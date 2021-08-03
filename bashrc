# .bashrc

# User specific aliases and functions

#if [ -z "$_HOMEBASHRC" -o -n "$_HOMEBASHPROFILE" ]; then
  # Source global definitions
# . /home/Environment/bash.bashrc
  . /home/Environment.testing/bash.bashrc
  
  if test -f ~/.alias.sh; then
    . ~/.alias.sh
  fi
  
  #local stuff goes below here
  if test -z "$LANG"; then
    export LANG=de_DE.UTF-8
  fi
#fi

# bash completion
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi


# set PATH so it includes user's private bin if it exists
export PATH=/scratch-local/usr/local/bin:$PATH
# llvm version switch
#export PATH=/scratch-local/usr_llvm_8_0/local/bin:$PATH
export PATH=/usr/local/cuda/bin:$PATH
export PATH=/usr/local/texlive/2020/bin/x86_64-linux:$PATH
if [ -d "/scratch-local/home/qiao/.local/bin" ]; then
    PATH="/scratch-local/home/qiao/.local/bin:$PATH"
fi

# for Taichi
export TAICHI_REPO_DIR=/scratch-local/home/qiao/Project/Taichi/taichi  # Path to your taichi repository
export PYTHONPATH=$TAICHI_REPO_DIR/python:$PYTHONPATH
export PATH=$TAICHI_REPO_DIR/bin:$PATH
# export CXX=/path/to/clang  # Uncomment if you encounter issue about compiler in the next step.
# export PATH=/opt/llvm/bin:$PATH  # Uncomment if your llvm or clang is installed in /opt


# set PATH so it includes other shared libraries
# llvm version switch
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/scratch-local/usr_llvm_8_0/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/scratch-local/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64

## powerline
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /scratch-local/home/qiao/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# alias
alias windowsCodesign31='rdesktop -g 2560x1400 -u qiao -d hscdad 131.188.51.31'
alias open='gnome-open'
alias de='gio trash'

