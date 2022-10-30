local Job = require'plenary.job'

Job:new({
  command = 'rg',
  args = { '--files' },
  cwd = '/usr/bin',
  env = { ['a'] = 'b' },
  on_exit = function(j, return_val)
    print(return_val)
    print(j:result())
  end,
}):sync() -- or start()

return {
  extension = {
    -- extension = filetype
    -- example:
    ['jl'] = 'julia',
  },
  file_name = {
    -- special filenames, likes .bashrc
    -- we provide a decent amount
    -- name = filetype
    -- example:
    ['.bashrc'] = 'bash',
  },
  shebang = {
    -- Shebangs are supported as well. Currently we provide
    -- sh, bash, zsh, python, perl with different prefixes like
    -- /usr/bin, /bin/, /usr/bin/env, /bin/env
    -- shebang = filetype
    -- example:
    ['/usr/bin/node'] = 'javascript',
  }
}