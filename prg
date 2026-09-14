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


PRG7------SUM OF DIGITS

echo -n "Enter a number:"
read n
sd=0
sum=0
while [ $n -gt 0 ]
do
sd=$(( $n % 10 ))
n=$(( $n / 10 ))
sum=$(( $sum + $sd ))
done
echo "Sum of all digits is "$sum


PRG8-----FINDING GREATEST NUMBERS

for((i=0;i<$1;i++))
do
echo "Enter $((i+1)) number:"
read nos[$i]
done
echo "Number entered are:"
for((i=0;i<$1;i++))
do
echo ${nos[$i]}
done
small=${nos[0]}
greater=${nos[0]}
for((i=0;i<$1;i++))
do
if [ ${nos[$i]} -lt $small ] then
small=${nos[$i]}
elif [ ${nos[$i]} -gt $greater ] then
greater=${nos[$i]}fi
done
echo "Smallest number in an array is $small"
echo "Greatest number in an array is $greater"

PRG9------PALINDRONE CHECKING

read -p "Enter a string:" string
if [[ $(rev <<< "$string") == "$string" ]] then
echo "Palindrome"
else
echo "Not a Palindrome"
fi

PRG10------MULTIPLICATION TABLE

echo "Enter the table number"
read n
echo "Enter the range"
read range
echo "Multiplication table for $n upto the range $range"
for((i=1;i<=range;i++))
{
echo " $i X $n = `expr $n \* $i`"
}

PRG11-------GROUP INFORMATION

# a. Display all groups available in the system
echo "--- All Groups in the System ---"
cat /etc/group | cut -d: -f1
# b. Display the group ID of a specified group
echo ""
echo "Enter group name to find its ID:"
read grpname
grpid=$(getent group $grpname | cut -d: -f3)
echo "Group ID of '$grpname' is: $grpid"
# c. List users belonging to a particular group
echo ""
echo "Enter group name to list its members:"
read grpname2
echo "Users in group '$grpname2':"
getent group $grpname2 | cut -d: -f4 | tr ',' '\n'
# d. Count total number of groups
echo ""
totalgroups=$(cat /etc/group | wc -l)
echo "Total number of groups: $totalgroups"
# e. Display groups assigned to current user
echo ""
echo "Groups assigned to current user ($USER):"
groups $USER

PRG12--------MONITOR PROCESS ACTIVITIES

# a. Display all running processes
echo "--- All Running Processes ---"
ps -ef
# b. Processes belonging to the current user
echo ""
echo "--- Processes of Current User ($USER) ---"
ps -u $USER
# c. Top 5 CPU consuming processes
echo ""
echo "--- Top 5 CPU Consuming Processes ---"
echo "PID COMMAND %CPU"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6
# d. Process ID and Parent Process ID
echo ""
echo "--- PID and PPID ---"
echo "PID PPID COMMAND"
ps -eo pid,ppid,comm | head -15
# e. Total number of running processes
echo ""
total=$(ps -ef | wc -l)
echo "Total number of running processes: $total"

PRG13-------NETWORK CONFIGURATION

# a. Display system hostname
echo "--- System Hostname ---"
hostname
# b. IP address of all network interfaces
echo ""
echo "--- IP Addresses of Network Interfaces ---"
ip addr show | grep -E 'inet |^[0-9]+:'
# c. Routing table information
echo ""
echo "--- Routing Table ---"
ip route
# d. DNS server configuration
echo ""
echo "--- DNS Server Configuration ---"
cat /etc/resolv.conf
# e. Test network connectivity
# a. Display system hostname
echo "--- System Hostname ---"
hostname
# b. IP address of all network interfaces
echo ""
echo "--- IP Addresses of Network Interfaces ---"
ip addr show | grep -E 'inet |^[0-9]+:'
# c. Routing table information
echo ""
echo "--- Routing Table ---"
ip route
# d. DNS server configuration
echo ""
echo "--- DNS Server Configuration ---"
cat /etc/resolv.conf
# e. Test network connectivity
echo ""
echo "Enter remote host to test (e.g. 8.8.8.8):"
read remotehost
echo "Testing connectivity to $remotehost ..."
ping -c 4 $remotehost

PRG14------MONITOR SYSTEM LOGS

# a. Recent system log entries
echo "--- Recent System Log Entries ---"
tail -20 /var/log/messages 2>/dev/null || journalctl -n 20
# b. Login history of users
echo ""
echo "--- Login History of Users ---"
last | head -15
# c. Failed login attempts
echo ""
echo "--- Failed Login Attempts ---"
grep "Failed password" /var/log/secure 2>/dev/null | tail -10
# d. Search for specific keyword in log files
echo ""
echo "Enter keyword to search in /var/log/messages:"
read keyword
echo "Results for '$keyword':"
grep -i "$keyword" /var/log/messages 2>/dev/null | tail -10
# e. Last 10 security related log messages
echo ""
echo "--- Last 10 Security Log Messages ---"
tail -10 /var/log/secure 2>/dev/null || journalctl -u sshd -n 10

PRG15------ANALYZE DISK USAGE

# a. Disk usage of all directories in home folder
echo "--- Disk Usage of Home Directory ---"
du -sh ~/* 2>/dev/null
# b. Top 5 largest directories in the system
echo ""
echo "--- Top 5 Largest Directories ---"
du -sh /* 2>/dev/null | sort -rh | head -5
# c. Number of files in each home subdirectory
echo ""
echo "--- File Count in Each Home Subdirectory ---"
for dir in ~/*/
do
count=$(ls "$dir" 2>/dev/null | wc -l)
echo "$dir : $count files"
done
# d. Filesystem type of each partition
echo ""
echo "--- Filesystem Type of Each Partition ---"
df -T | awk '{print $1, $2, $NF}'
# e. Free disk space available
echo ""
echo "--- Free Disk Space Available ---"
df -h

