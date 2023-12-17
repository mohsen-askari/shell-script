#!/bin/bash

# 1. Create a directory named "MyDirectory"
mkdir MyDirectory

# 2. Change into the created directory
cd MyDirectory

# 3. Prompt the user for their name
read -p "Please enter your name: " userName

# 4. Prompt the user for their age
read -p "Please enter your age: " userAge

# 5. Create a text file named "user_info.txt" and store user information in it
echo "Name: $userName" > user_info.txt
echo "Age: $userAge" >> user_info.txt

# 6. Create 3 files with different names (file1.txt, file2.txt, file3.txt)
for i in {1..3}
do
    touch "file$i.txt"
done

# 7. Change the permissions of file1 to read and write for everyone
chmod +rw file1.txt

# 8. Use a while loop to display the files
echo "Displaying files:"
while read file
do
    echo "- $file"
done < <(ls)

# 9. Copy file1 to a new file named "file_copy.txt"
cp file1.txt file_copy.txt

# 10. Create a variable and display its value
myVariable="Hello, this is a variable!"
echo "Variable value: $myVariable"

# 11. Use an if statement to check the existence of file2
if [ -e "file2.txt" ]; then
    echo "file2 exists."
else
    echo "file2 does not exist."
fi

# 12. Delete file3
rm file3.txt

# 13. Display the files again after deletion
echo "Displaying files after deletion:"
ls

