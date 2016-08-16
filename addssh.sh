#/bin/bash

s3bucket=$1

users=$(aws s3 ls s3://$s3bucket | awk '{print $4}' | cut -d "." -f1)
for user in $users
do
useradd $user
cd /home/$user
mkdir .ssh
chmod 700 .ssh
chown $user:$user .ssh
aws s3 cp s3://$s3bucket$user.pub .ssh/$user.pub
cat .ssh/$user.pub >> .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
chown $user:$user .ssh/authorized_keys
echo "$user ALL=(ALL:ALL) ALL" >> /etc/sudoers
done