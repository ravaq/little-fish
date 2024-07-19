#Creates a ssh key for Github, enter your email as argument.
function github-ssh-generate
  ssh-keygen -t rsa -b 4096 -C $argv
  copy < ~/.ssh/id_rsa.pub
end

