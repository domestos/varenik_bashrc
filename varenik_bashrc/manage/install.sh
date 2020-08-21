echo "START INSTALL VARENIK BASH"
#copy varenik_bashrc to ~/.varenik_bashrc
cp -R ./varenik_bashrc ~/.varenik_bashrc

#============================ INCLUDE ALIASES =======================================
function include_aliases(){
    echo " ">> ~/.bashrc 
    echo "#varenik_custom_aliases " >> ~/.bashrc 
    echo "if [ -f ~/.varenik_bashrc/aliases/varenik_aliases ]; then" >> ~/.bashrc 
    echo "  . ~/.varenik_bashrc/aliases/varenik_aliases" >> ~/.bashrc 
    echo "fi" >> ~/.bashrc 
    echo "#end_varenik_custom_aliases">> ~/.bashrc 
    # chack if varenik aliases have been included 
    if grep -q varenik_aliases  ~/.bashrc ; then
        echo " - Custom Varenik Aliases were included to  ~/.bashrc  file."
        source ~/.bashrc
        # 0 = true
        return 0
    else
        echo "Ooops! Something went wrong. "
        # 1 = false
        return 1
    fi
}
#===================================================================================

#============================ SET TMUX CONFIG ======================================
function set_tmux_config(){
    # COPY THE tmuc.config
    if [ ! -f ~/.tmux.conf ]; then
        echo " - Copy tmux config"
        cp ~/.varenik_bashrc/manage/config/tmux.conf ~/.tmux.conf
    fi
}
#===================================================================================


#============================ RUN MAIN ======================================
#check if files have been copied
if [ -d ~/.varenik_bashrc ] ; then
    echo " - Success! The required files have been copied to ~/.varenik_bashrc"
    include_aliases
    set_tmux_config
else
    echo "Ooop! Something went wrong. Files have not been copied."
fi
#===================================================================================
