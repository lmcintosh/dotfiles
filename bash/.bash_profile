# Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

source ~/.profile

source /usr/local/bin/virtualenvwrapper.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lmcintosh/code/google-cloud-sdk/path.bash.inc' ]; then source '/Users/lmcintosh/code/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lmcintosh/code/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/lmcintosh/code/google-cloud-sdk/completion.bash.inc'; fi

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/usr/local/opt/python/libexec/bin:/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

export WORKON_HOME=$HOME/code/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

source /usr/local/bin/virtualenvwrapper.sh
