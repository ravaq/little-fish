function bsh
  set cmd (string join ' ' $argv)
  bash -c $cmd
end
