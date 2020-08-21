# clone folder varenik_bash from github  to ~/.varenik_bash
# https://github.com/domestos/varenik_bash

case $1 in
# INSTALL
install)
    echo Instaling ...
    if [ -f ~/.bashrc_backup ]; then
        echo "MAIN :: Looks like varenik_bash was installed. Now You can only update or delete it"
    else  
        ./varenik_bashrc/manage/install.sh
    fi  
;;
#UPDATE
update)
echo updating

;;
#DELETE
delete)
echo deleting
  if [ -f ~/.bashrc_backup ] 
        then
        ./varenik_bashrc/manage/delete.sh
        source ~/.bashrc
    else
        ./varenik_bashrc/manage/delete.sh
        echo "WARNING ::  looks like the ~/.bashrc_backup was not found..... "
    fi
;;
#SOMETHING ELSE
*)
echo "don\'t know the command. Please use: install or update or delete" 
;;
esac

