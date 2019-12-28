#!/bin/bash
#
# ~/bin/list-disks.shs
#

lsblk -d -o name,vendor,model,type,size,hotplug
