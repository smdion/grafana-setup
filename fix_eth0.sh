#!/bin/bash

sudo sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"/g' grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
