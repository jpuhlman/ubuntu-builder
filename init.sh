#!/bin/bash

if [ -n "$EXTRA_PACKAGES" ] ; then
   yum install -y $EXTRA_PACKAGES
fi

groupadd -g $USERGID engr 
useradd -s /bin/bash -d $HOME -M -u $USERID -g $USERGID $USERNAME
echo "$USERNAME  ALL=(ALL)       NOPASSWD: ALL" | tee -a /etc/sudoers > /dev/null
sudo usermod -a -G mock $USERNAME
chown root.engr /var/run/docker.sock
echo "export MOCK_OPTS='--old-chroot'" >> /etc/bashrc
echo
echo "Welcome to ubuntu 18.04 builder"
echo
if [ -n "$SCRIPTRUNNER" ] ; then
   if [ -d "$CURRENTPATH" ] ; then
      cd $CURRENTPATH
   else
      cd $HOME
   fi
   chmod 755 $SCRIPTRUNNER
   sudo --preserve-env="CURRENTPATH" -u $USERNAME $SCRIPTRUNNER
else 
   su - $USERNAME
fi
