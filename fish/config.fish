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

if test -r ~/.dir_colors
  switch (uname)
    case Darwin
      eval (gdircolors -c ~/.dir_colors)

    case Linux
      eval (dircolors -c ~/.dir_colors)
    end
end

fish_vi_key_bindings
