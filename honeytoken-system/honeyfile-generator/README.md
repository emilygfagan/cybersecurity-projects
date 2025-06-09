# Part 1 of the Honeytoken System: File Generator

I ran into the issue while learning about Honeytoken systems that creating a bunch of random documents is very tedious. I decided to create a script in PowerShell that would automate the process for me... because that's what it's for, right?     


### Base Code

![image1](images/basecode.png)     


Started out with just two file types to test how the script would look. Ran for the first time and everything was smooth and worked correctly. Below is the output for my first run, where I selected 3 `.csv` files, and the second run where I selected 4 `.txt` files.      

![image2](images/v1.0csv.png)  ![image3](images/v1.1txt.png)        



### Modifications

I wanted to edit the script so that it would include multiple entries in each file and it would randomize the creation date of the file. I also wanted the administrator running the script to be able to choose what the filename would be.     
