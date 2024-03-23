# bible_verses_in_terminal
A simple way to get random bible verses to display on your terminal every time you open up a new window.

1. Paste this at the top of your ~/.bashrc file. If you bash. If you use zsh paste the following line at the top of your ~/.zshrc file.
2. The ~/.bashrc and ~/.zshrc are usually located in your /home directory
3. Paste this following line at the top of your ~/.bashrc or ~/.zshrc file
4. shuf -n 1 /path/to/your/file/bible_verses_various.txt | head -1
5. It is that simple. For a long time I had an app that was doing this and it always gave me issues. Until I finally learned
the basics of bash. Hope it helps. Now you can have a random bible verse, quote, poem. Whatever everytime you open up a new terminal window.

