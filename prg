 PRG1--- COMMANDS rm,cp,mv,cmp,wc,split,diff

echo “ ls command”
ls
echo "Copying content from file1.txt to file3.txt"
cp file1.txt file3.txt
echo "Displaying contents in file3.txt"
cat file3.txt
echo "Moving contents from file2.txt to file4.txt"
mv file2.txt file4.txt
echo "Displaying content in file4.txt"
cat file4.txt
echo "Display count of the lines, words, character in the file file4.txt"
wc file4.txt
echo "Display the number of lines in file4.txt"
wc -l file4.txt
echo "Display the number of words in file4.txt"
wc -w file4.txt
echo "Display the number of character in file4.txt"
wc -c file4.txt
echo "Splitting the file4.txt by 3 lines in each"
split -3 file4.txt
echo "Listing the files"
ls
echo "Comparing the files file1.txt file4.txt"
cmp file1.txt file4.txt
echo "Using diff command between file1.txt file4.txt"
diff file1.txt file4.txt

PRG2-----user and system configuration

echo -e "username : " $ USER
echo -e "loginname : " $ LOGNAME
echo -e "currentshell : " $ SHELL
echo -e "homedirectory : " $ HOME
echo -e "our pc os is : " $OSTYPE
echo -e "current directory : " $pwd
echo -e "system config : " $(lscpu)
echo -e "free memory space : "
free -m


PRG3 ---IMPLEMENTATION OF PIPES,REDIRECTION

echo “Pipe symbol connect one or more process”
ls -1 *.sh | wc –l
echo “Redirect the output”
echo “------------------------“
echo “Redirect the output to the new file”
sh lab2.sh > correctoutput
echo “Redirect error output to the new file”
sh lab2.sh > erroroutput
echo “Redirect all output to the new file”
sh lab2.sh &> alloutputs
echo “-------------------------“
echo “tee copies data from standard input to each file and also to standard output”
ls -1 *.txt | wc –l | tee count.txt



PRG4 ---- DISPLAY THE DATES,USERNAME,LS THE FILES

echo "1.Current date:"
echo "2.Your user name:"
echo "3.List files and directories"
read option
case ${option} in
1)
echo "Current date is :" $(date);;
2)
echo "Your user name is: "$(whoami);;
3)
echo "To list out all files and directories:"$(ls);;
*)
echo "Invalid Option"
esac

PRG5----- FILTER COMMANDS

echo "Filter commands"
cp /etc/passwd passwd
echo "Display the lines containing the word root"
grep -n "root" passwd | more
echo "Display the count of lines that is containing the word root"
grep -c "root" passwd
echo "Display the count of lines that dont match with the line root"
grep -v "root" passwd | more
echo "Display the no. of lines, character and words in passwd file"

wc passwd
echo "Replace ":" with "*" in the passwd file"
tr ":" '*' < passwd | more
echo "Display first column of the passwd file"
cut -d ':' -f1 passwd

PRG6---- DELETE THE FILE WHICH HAS SIZE 0

clear
echo "Enter the file name"
read fname
if[-e $fname]
then
echo $ fname "file has size>0"
else
rm $fname
