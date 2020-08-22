#!/bin/sh

#SET VARIABLE
SESSION_NAME='tmux_monitor'
PATH_TO_HELPER="~/.varenik_bashrc/tmux_windows/monitoring/helper/"


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
      tmux new-session -s $SESSION_NAME -n "main" -d
      #SPLIT THE WINDOW
      
      tmux split-window -h -t $SESSION_NAME:0   -p 30
      tmux split-window -v -t $SESSION_NAME:0.1 

      # run monitoring processes
      tmux send-keys -t $SESSION_NAME:0.0 $PATH_TO_HELPER'htop.sh' C-m
      # run monitoring disk
      tmux send-keys -t $SESSION_NAME:0.1 $PATH_TO_HELPER'iotop.sh' C-m
      # run monitoring network adapters
      tmux send-keys -t $SESSION_NAME:0.2 $PATH_TO_HELPER'bomn.sh' C-m
            
      #CREEATE NEW WINDOWS 
      tmux new-window -n "gtop" -t $SESSION_NAME
      tmux send-keys -t $SESSION_NAME:1.0 $PATH_TO_HELPER'gtop.sh' C-m
      
      #ATTACH TO SESSON
      echo  "Attach to session "
      exec tmux attach -t $SESSION_NAME
fi
