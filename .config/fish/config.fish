if test -e (dirname (status -f))/.exports
  source (dirname (status -f))/.exports
end
if test -e (dirname (status -f))/.aliases
  source (dirname (status -f))/.aliases
end
if test -e (dirname (status -f))/.fns
  source (dirname (status -f))/.fns
end

if status is-interactive
and not set -q TMUX
  if type -q tmux
    exec tmux
  end
end
