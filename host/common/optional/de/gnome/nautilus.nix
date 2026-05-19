{pkgs, ...}: {
  # environment.systemPackages = with pkgs; [turtle];
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ghostty";
  };
}
