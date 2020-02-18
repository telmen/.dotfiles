if test -e (dirname (status -f))/.exports
  . (dirname (status -f))/.exports
end
if test -e (dirname (status -f))/.aliases
  . (dirname (status -f))/.aliases
end
if test -e (dirname (status -f))/.fns
  . (dirname (status -f))/.fns
end

if status is-interactive
and not set -q TMUX
  if type -q tmux
    exec tmux
  end
end

if status is-interactive
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"
end
