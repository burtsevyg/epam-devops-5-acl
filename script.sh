#!/usr/bin/env bash
set -e

groupadd I_GROUP

for user in R{1..5}; do useradd $user; done
for user in I{1..3}; do useradd $user -g I_GROUP ; done
for user in A{1..4}; do useradd $user; done

for folder in /data/Proj{1..3}
do
    mkdir -p $folder
    chmod 770 $folder
    setfacl -b $folder
done

for user in R2 R3 R5 A1; do setfacl -Rm u:$user:rwx /data/Proj1; done
for user in R1 R5 A1; do setfacl -Rm u:$user:rwx /data/Proj2; done
for user in R1 R2 R4 A2; do setfacl -Rm u:$user:rwx /data/Proj3; done

for user in A4; do setfacl -Rm u:$user:rx /data/Proj1; done
for user in A2 A3; do setfacl -Rm u:$user:rx /data/Proj2; done
for user in A1 A4; do setfacl -Rm u:$user:rx /data/Proj3; done

#setfacl -Rdm m:I_GROUP:r /data/Proj{1..3}
#setfacl -Rdm g:I_GROUP:rwx /data/Proj{1..3}
