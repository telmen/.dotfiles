set fish_greeting
set -gx FZF_DEFAULT_COMMAND 'rg --files --follow --hidden -g !.git'

if test -e (dirname (status -f))/.exports
  source (dirname (status -f))/.exports
end
if test -e (dirname (status -f))/.aliases
  source (dirname (status -f))/.aliases
end
if test -e (dirname (status -f))/.fns
  source (dirname (status -f))/.fns
end
rvm default
# test -e /Users/telmen/.iterm2_shell_integration.fish ; and source /Users/telmen/.iterm2_shell_integration.fish ; or true
