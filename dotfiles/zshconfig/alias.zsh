# Aliases
alias dc="docker-compose"
alias dcd="docker-compose down"
alias duq='docker-compose up -d $(basename $(pwd))'
alias drq='docker-compose run --rm --entrypoint "" $(basename $(pwd))'
alias deq='docker-compose exec $(basename $(pwd))'
alias kc="kubectl"
alias gfe="git fetch --prune"
alias gme="git merge origin/HEAD"
alias gsw="git switch"
alias gch="git checkout"
alias gsw="git switch"
alias gst="git status"
alias gdi="git diff"
alias gad="git add"
alias gco="git commit"
alias gpu="git push"
alias gpuH="git push origin HEAD"
alias gre="git restore"
alias glo="git log"
alias repos='ghq list -p | peco'
alias repo='cd $(repos)'

