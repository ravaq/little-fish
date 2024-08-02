#A function for listing installed packages info in a few diffrent ways. 

function list-packages
	switch $argv[1]
		case sz
			set cmd 'expac -H M "%-13m\t%-20n\t%10d" | sort -n'
		case dt
			set cmd 'expac --timefmt="%Y-%m-%d %T" -H M "%011l\t%-9m\t%-25n\t%10d" | sort -n'
		case dtq
			set cmd 'expac --timefmt="%Y-%m-%d %T" "%l\t%n" | sort'
		case exp
			set cmd 'expac -H M "%011m\t%-20n\t%10d" $(comm -23 (pacman -Qqe | sort | psub) (begin; pacman -Qqg xorg; expac -l '\n' '%E' base; end | sort -u | psub)) | sort -n'
		case nam
			set cmd 'expac -H M "%-20n\t%10d" $(comm -23 (pacman -Qqe | sort | psub) (begin; pacman -Qqg xorg; echo base; end | sort -u | psub))'
		case t #not working
			set cmd 'expac --timefmt="%Y-%m-%d %T"-H M "%011l\t%-11m\t%-25n\t%10d" $(comm -23 (pacman -Qqen | sort | psub) (begin; pacman -Qqg xorg; expac -l "\n" "%E" base; end | sort -u | psub)) | sort -n'
		case p #not working
			set cmd 'LC_ALL=C pacman -Qi | awk "/^Name/{name=$3} /^Installed Size/{print $4$5, name}" | sort -h'
		case '*'
			echo 'invalid option!'
			return 1
	end

	fish -c $cmd
	
end
