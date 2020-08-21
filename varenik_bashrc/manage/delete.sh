sed -i "/^#varenik_custom_aliases/ , /*end_varenik_custom_aliases$/d" ~/.bashrc

rm -R ~/.varenik_bashrc


# DELETE  tmuc.config
if [ -f ~/.tmux.conf ]; then
    rm ~/.tmux.conf
else
   echo "WARNING ::  looks like the ~/.tmux.conf was not found..... "
fi