#conda initialize stuff pulled from the content dumped into .bashrc by
#  conda init bash
#

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/apps/easybuild/software/tinkercliffs-rome/Anaconda3/2020.07/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/apps/easybuild/software/tinkercliffs-rome/Anaconda3/2020.07/etc/profile.d/conda.sh" ]; then
        . "/apps/easybuild/software/tinkercliffs-rome/Anaconda3/2020.07/etc/profile.d/conda.sh"
    else
        export PATH="/apps/easybuild/software/tinkercliffs-rome/Anaconda3/2020.07/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

