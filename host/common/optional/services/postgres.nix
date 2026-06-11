{
  services.postgresql = {
    enable = true;
    authentication = ''
      # type	database	user	origin-address	auth-method
      local	all		all			trust
      host	all		all	127.0.0.1/32	trust
      host	all		all	::1/128		trust
    '';
    identMap = ''
      # arbitraryMapName	systemUser	DBUser
      superuser_map		root		postgres
      superuser_map		postgres  	postgres

      # Let other names login as themselves
      superuser_map		/^(.*)$		\1
    '';
  };
}
