#!/bin/sh

#SET VARIABLE
SESSION_NAME='tmux_kvm'
PATH_TO_HELPER="~/.varenik_bashrc/tmux_windows/kvm/helper/"


# check that tmux is installed
if ! command -v tmux > /dev/null; then
   sudo apt install tmux   
fi #end install tmux


# CHECK IF EXSIST THE SESSION
tmux has-session -t $SESSION_NAME
if [ $? = 0 ] 
   then
      echo  "Attach to session "
      exec tmux attach -t $SESSION_NAME
else
      # CREATE THE SESSION AND SET NAME FOR WINDOWS
      echo "Create a session"
      tmux new-session -s $SESSION_NAME -n "KVM-helper" -d
      #SPLIT THE WINDOW
      
      tmux split-window -h -t $SESSION_NAME:0   -p 30
      tmux split-window -v -t $SESSION_NAME:0.1 
      tmux split-window -v -t $SESSION_NAME:0.2 
      tmux split-window -v -t $SESSION_NAME:0.3



      # run monitoring processes
      # tmux send-keys -t $SESSION_NAME:0.0 '~/.varenik_bash/tmux-monitoring/helper/htop.sh' C-m

      tmux send-keys -t $SESSION_NAME:0.0 $PATH_TO_HELPER'watch_storage_pool.sh' C-m
      tmux send-keys -t $SESSION_NAME:0.1 'watch virsh list --all' C-m
      tmux send-keys -t $SESSION_NAME:0.2 'watch virsh pool-list' C-m
      tmux send-keys -t $SESSION_NAME:0.3 'watch virsh net-list' C-m

      exec tmux attach -t $SESSION_NAME
fi
