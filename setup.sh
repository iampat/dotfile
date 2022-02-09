mv $HOME/.bashrc $/.bashrc.bak.$RANDOM
ln -s dotbashrc $HOME/.bashrc
source $HOME/.bashrc
