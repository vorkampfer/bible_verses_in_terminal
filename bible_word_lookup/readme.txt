# This repo shows you how to look up the bible from your terminal in Linux.
### It is very simple. First you will need the bible in .txt form. 
### You can install poppler-utils in debian or 'sudo pacman -S poppler' in blackarch.
### That will give you the pdftotext package. To convert any pdf to text format you do the following command.
### 'pdftotext filename.pdf' 
### I have included the King James Version and the Book of Sirach. 
### 1. Download the bible in .txt format and you will simply create an alias that points to your akjv.txt
### 2. Here is the alias I have created on my desktop.
### 3. alias bible_lookup='cat /home/path/to/the/file/akjv.txt | grep -i -C4'
### 4. All you have to do is add that alias the bottom of your ~/.bashrc or ~/.zshrc file
### 5. You will need to define where the path to the akjv.txt file is in the alias.
### 6. Usage is really simple, type 'bible_lookup <word to look up>' remove the quotes and brackets of course.
### 7. You many need to type 'source ~/.bashrc' to get the alias recognized by bash or zsh if you use that.
### 7. I will also be adding a bash script if people find that easier to use.
