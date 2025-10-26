from bs4 import BeautifulSoup

# Input and output file paths
input_path = r'C:\Users\rohan\Desktop\instagram-abdes_790-2025-06-18-UJREOeZD\connections\followers_and_following\following.html'
output_path = r'C:\Users\rohan\Desktop\a.txt'

# Read and parse the HTML
with open(input_path, 'r', encoding='utf-8') as file:
    soup = BeautifulSoup(file, 'html.parser')

# Extract usernames from anchor tags
usernames = [a.text.strip() for a in soup.find_all('a') if a.text.strip()]

# Write usernames to the output file
with open(output_path, 'w', encoding='utf-8') as out_file:
    for name in usernames:
        out_file.write(name + '\n')

print(f"Extracted {len(usernames)} usernames.")