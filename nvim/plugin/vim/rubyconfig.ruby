

if has("ruby")

if !exists('g:shim_ghciInterp')
    let g:shim_ghciInterp = "ghci"
endif
if !exists('g:shim_ghciPrompt')
    let g:shim_ghciPrompt = "^[\*A-Z][A-Za-z0-9\. ]+>"
endif
if !exists('g:shim_ghciTimeout')
    let g:shim_ghciTimeout = 10
endif
if !exists('g:shim_jumpToGhci')
    let g:shim_jumpToGhci = "false"
endif
if !exists('g:shim_quickfix')
    let g:shim_quickfix = "true"
endif
if !exists('g:shim_defaultWindowSize')
    let g:shim_defaultWindowSize = 15
endif
if !exists('g:shim_ghciArgs')
    let g:shim_ghciArgs = ""
endif

command! GhciReload ruby $ghci.reloadGhci
command! GhciFile ruby $ghci.ghciSourceFile
command! -range GhciRange ruby $ghci.writeRangeToGhci(<line1>, <line2>)

ruby << EOF
module VIM
	class Buffer
		class << self
			def getForName(name)
				(0...self.count).each { |i|
					return self[i] if self[i].name =~ name
				}
			end
		end
	end

	class Window
		class << self
			def forBufferName(bufferName)
				(0...self.count).each { |i|
					return self[i] if self[i].buffer.name == bufferName
				}
                return nil
			end

			def number(window)
				(0...self.count).each { |i|
					return i + 1 if self[i] == window
				}
			end
		end
	end
end
EOF

ruby << EOF
require 'expect'

class Ghci
	def initialize
		@ghciInterp = VIM::evaluate("g:shim_ghciInterp")
		@ghciArgs = VIM::evaluate("g:shim_ghciArgs")
		@ghciPrompt = Regexp.new(VIM::evaluate("g:shim_ghciPrompt"))
		@ghciTimeout = VIM::evaluate("g:shim_ghciTimeout").to_i
		@jumpToGhci = VIM::evaluate("g:shim_jumpToGhci") == "true" ? true : false
		@quickfix = VIM::evaluate("g:shim_quickfix") == "true" ? true : false
		@defaultWindowSize = VIM::evaluate("g:shim_defaultWindowSize").to_i

		@buffer = nil
		@pipe = nil
	end

	def setupWindow
		originatorWin = VIM::Window.current
		VIM::command("below split +e ghci")
		VIM::command("res " + @defaultWindowSize.to_s)
		VIM::command("setlocal buftype=nofile noswapfile filetype=haskell")
		VIM::command("imap <buffer> <CR> <Esc>:GhciRange<CR>a")

		@buffer = VIM::Buffer.getForName(Regexp.new(Regexp.escape(File::Separator) + "ghci$"))

		VIM::command(VIM::Window.number(originatorWin).to_s + "wincmd w") unless @jumpToGhci
	end

	def initGhciBuffer
		setupWindow
        openGhci
	end

    def openGhci
		@ghciArgs = VIM::evaluate("g:shim_ghciArgs")
		# ghci writes some stuff to stderr...
		@pipe = IO.popen(@ghciInterp + " " + @ghciArgs + " 2>&1", File::RDWR)
		readFromGhci
    end

	def closeGhci
		if(!@pipe.nil?)
			@pipe.syswrite(":q\n")
			@pipe.close
			@pipe = nil
		end
	end

    def reloadGhci
		if(@pipe.nil?)
            openGhci
        else
            closeGhci
            @buffer.length.times { @buffer.delete(1) }
            openGhci
        end
    end

	def readFromGhci
		if(!@buffer.nil? && !@pipe.nil?)
			output = @pipe.expect(@ghciPrompt, @ghciTimeout)
			return if output.nil?
			text = output.join("\n").strip + " "

			text.split(/\r?\n/).each { |line|
				@buffer.append(@buffer.count, line)
			}

			originatorWin = VIM::Window.current
			window = VIM::Window.forBufferName(@buffer.name)

			if(@quickfix)
				VIM::command("cex " + text.inspect) unless text =~ /<interactive>/
			end
			
			window.cursor = [ @buffer.count, @buffer[@buffer.count].length ] unless window.nil?

            if(!window.nil? && window != VIM::Window.current)
				# switch to the ghci window and refresh it to
				# make sure the new output is visible, then switch
				# back unless we wanted to go there anyway
				VIM::command(VIM::Window.number(window).to_s + "wincmd w")
				VIM::command("redraw")
				VIM::command(VIM::Window.number(originatorWin).to_s + "wincmd w") unless @jumpToGhci
			end
		else
			VIM::message("Ghci buffer or pipe isn't open!")
		end
	end

	def writeToGhci(text)
		text.strip!
		if(text.length > 0)
			initGhciBuffer if @buffer.nil?

			if(!@buffer.nil? && !@pipe.nil?)
                # if the input matches the prompt, it was typed
                # in the interpreter window and we don't need to
                # echo it; also remove it before passing it on to ghci
				if(!(text =~ @ghciPrompt).nil?)
					text.gsub!(@ghciPrompt, "")
				else
					text.split(/\r?\n/).each { |line|
						@buffer.append(@buffer.count, line)
					}
				end

                begin
                    @pipe.syswrite(text + "\n")
                rescue SystemCallError
                    VIM::message("Restarting Ghci, write failed: " + $!)
                    openGhci
                    retry
                end
				readFromGhci
			else
				VIM::message("Ghci buffer or pipe isn't open!")
			end
		end
	end

	def ghciSourceFile
		autowrite = VIM::evaluate("&autowrite")
		modified = VIM::evaluate("&mod")
		VIM::command("w") if((modified == "1") && (autowrite == "1"))
		writeToGhci(":l " + VIM::Buffer.current.name)
	end

	def writeRangeToGhci(line1, line2)
		text = []
		(line1..line2).each { |i|
			text << VIM::Buffer.current[i]
		}
		writeToGhci(text.join("\n"))
	end
end
$ghci = Ghci.new
EOF

autocmd BufDelete ghci ruby $ghci.closeGhci
autocmd VimLeavePre * ruby $ghci.closeGhci

endif
