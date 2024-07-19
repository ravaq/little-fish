function web-query
  if test (count $argv) -lt 2
    echo 'please enter a valid option and query!'
    return 1
  else
    set mod terminal
    set option $argv[1]
    set query (string join '+' $argv[2..-1])
    switch $option
      case --ggl
       set url "google.com/search?q=$query"
      case --arch
        set url "archlinux.org/packages/?sort=&q=$query&sort=-last_update"
      case --aur
        set url "aur.archlinux.org/packages?O=0&SeB=nd&K=$query&SB=l&SO=d"
      case --alt
        set url "alternativeto.net/software/$query/?platform=linux&sort=likes"
        set mod browser
      case --dict
        set url
      case --gthb
        set url "https://github.com/search?q=$query&type=repositories&s=stars&o=desc"
      case --vs
      	set url "google.com/search?q=compare+$query"
      case --url
        set url "$query"
      case '*'
        echo "'$option' is not a valid option!"
        return 1
    end
  end

  set url (string join '' https:// $url)
  if test $mod = browser
    xdg-open $url
  else
    links $url
  end
end
