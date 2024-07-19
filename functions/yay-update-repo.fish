function yay-update-repo
  yay -Sy
  if test (count $argv) -gt 0
    yay $argv
  end
end

