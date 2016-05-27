#!/bin/bash
mkdir files;
cd files;
touch file{1..100};
for((i=1;i<=100;i++))
do
#making files to 9983 bytes
  dd if=/dev/zero of=file$i bs=9983 count=1;
#appending string with 16 character which is 17 bytes(including null character)
  cat /dev/urandom |tr -dc 'A-Za-z'|fold -w 16|head -n 1 >> file$i;
done
touch -d "2 days ago" file{1..100};
chmod 444 file{1..100};
sudo chattr +i file{1..100};
