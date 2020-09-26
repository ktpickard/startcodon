#!/bin/bash
# install-s3fs.sh
# by ktpickard on 2020-09-25

# Install s3fs
# Assumes username is ubuntu
sudo apt-get install s3fs
cd /etc
read -p "Use your AWS credentials in the next line"
# sudo echo YourAWSAccessKeyId:YourAWSSecretKey > ./passwd-s3fs
sudo chmod 600 ./passwd-s3fs
read -p "Change fuse.conf to allow other connections"
sudo vi /etc/fuse.conf #uncomment the allow_other_user line
cd /var/www/html
sudo mkdir genome
sudo chown ubuntu.ubuntu genome
echo "Test mount point"
read -p "Use your S3 bucket name in the next line"
# s3fs YourBucketName genome -o umask=022,uid=$UID,gid=1000,allow_other
echo "umask=022 is the complement of 755. Ubuntu has a uid and gid of 1000 (use “id” for details)"
read -p "If 'ls -l /var/www/html/genome' is successful, unmount the directory"
sudo umount genome

read -p "Ready to add fstab entry"
sudo vi /etc/fstab
read -p "Use your bucket_name below. Your details may vary."
# YourBucketName /var/www/html/genome fuse.s3fs _netdev,allow_other,use_cache=/tmp,uid=1000,umask=022,gid=1000 0 1
# Mount the bucket
sudo mount -av
echo "Your s3 bucket should be mounted now. Confirm with 'ls -l /var/www/html/genome'"
