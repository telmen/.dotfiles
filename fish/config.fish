if test -e (dirname (status -f))/.exports
  . (dirname (status -f))/.exports
end
if test -e (dirname (status -f))/.aliases
  . (dirname (status -f))/.aliases
end
if test -e (dirname (status -f))/.fns
  . (dirname (status -f))/.fns
end

# kitty completion
if command -v kitty
  kitty + complete setup fish | source
end