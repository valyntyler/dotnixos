{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = true;
    enableNushellIntegration = true;
    # config.hide_env_diff = true;
  };
}
