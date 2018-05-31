export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib
export DYLD_LIBRARY_PATH=$LD_LIBRARY_PATH

# Aliases for more convenient git commands
alias gc='git commit'
alias gs='git status '
alias cm='commit -m'

# Added June 1, 2016
# Alias for compiling mex commands
#alias 'gcc-4.2'='gcc'
#alias 'g++-4.2'='g++'

# FASD aliases
eval "$(fasd --init auto)"
alias j='fasd_cd -d'
