# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# Next two lines commented out on Oct 6, 2014 due to problems udpating ipython
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# export PATH

export PYTHONPATH=/Library/Frameworks/EPD64.framework/Versions/7.3/lib/python2.7/site-packages
export CFLAGS="-I/Developer/SDKs/MacOSX10.8.sdk/usr/lib/"
export ARCHFLAGS="-arch x86_64"

# Setting PATH for EPD-7.3-2
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/EPD64.framework/Versions/Current/bin:/Developer/NVIDIA/CUDA-6.5/bin:${PATH}"
export PATH

# Added April 5, 2013
# Updated Dec 31, 2014 with path to pyCUDA
PYTHONPATH="/Users:/Users/lmcintosh:/Users/lmcintosh/Dropbox:/Users/lmcintosh/Dropbox:/Users/lmcintosh/Git/information-theory-toolbox:/Users/lmcintosh/Git/surround-size:/Users/lmcintosh/Git/emailing:/Users/lmcintosh/Dropbox/BIOE332_Software:/Users/lmcintosh/Dropbox/BIOE332_Software/PyDSTool:/Users/lmcintosh/Dropbox/BIOE332_Software/PyDSTool/tests:/Users/lmcintosh/Git/pycuda:/Users/lmcintosh/Git/Sum-of-Functions-Optimizer:/Users/lmcintosh/Git/igor/recording:/Users/lmcintosh/Git/natural-scenes:${PYTHONPATH}"

export PYTHONPATH

# Added Dec 31, 2014
CUDA_ROOT="/usr/local/cuda/bin:/usr/local/cuda:/Developer/NVIDIA/CUDA-6.5/bin:${CUDA_ROOT}"

export CUDA_ROOT

# Added Dec 31, 2014
LD_LIBRARY_PATH="/usr/local/cuda/lib:/usr/local/cuda/lib64:/Developer/NVIDIA/CUDA-6.5/bin:$LD_LIBRARY_PATH"

export LD_LIBRARY_PATH

# Added Jan 7, 2015
DYLD_LIBRARY_PATH="/Developer/NVIDIA/CUDA-6.5/lib:$DYLD_LIBRARY_PATH"

export DYLD_LIBRARY_PATH

# Added March 15, 2015
DYLD_FALLBACK_LIBRARY_PATH="/Library/Frameworks/EPD64.framework/Versions/7.3/lib:$DYLD_FALLBACK_LIBRARY_PATH"

export DYLD_FALLBACK_LIBRARY_PATH

MKL_NUM_THREADS=1
export MKL_NUM_THREADS

function cd
{
    if [ ${#1} == 0 ]; then
        builtin cd
    elif [ -d "${1}" ]; then
        builtin cd "${1}"
    elif [[ -f "${1}" || -L "${1}" ]]; then
        path=$(getTrueName "$1")
        builtin cd "$path"
    else
        builtin cd "${1}"
    fi
}

# Set the prompt to show the current git branch:
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

PS1="\h:\W$RED \$(parse_git_branch)$NO_COLOR $"

# Added July 21, 2015
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
