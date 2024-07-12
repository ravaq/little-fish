function windowshare -a 'shared'
	set winip 200.200.200.2
	set pass ''
	set sharein ~/Documents/windowshare/

	if not test -n "$shared"
		set shared 'share'
	end 
	sudo mount.cifs -o password=$pass //$winip/$shared $sharein
end  

