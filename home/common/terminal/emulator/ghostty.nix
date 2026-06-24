let
  inherit (builtins) toString;
  font-size = 14;
  font-family = "JetBrainsMono NF";
in {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      inherit font-size font-family;
      theme = "Gruvbox Dark";
      title = "";
      window-padding-x = 10;
      window-padding-y = 10;
      mouse-hide-while-typing = true;
      shell-integration-features = "ssh-env";
      notify-on-command-finish = "unfocused";
      notify-on-command-finish-action = "bell,notify";
      notify-on-command-finish-after = "20s";
      keybind = [
        "clear"
        "ctrl+shift+r=reload_config"
        "performable:ctrl+l=clear_screen"
        # clipboard actions
        "performable:ctrl+shift+c=copy_to_clipboard"
        "performable:ctrl+shift+v=paste_from_clipboard"
        "performable:ctrl+shift+a=select_all"
        # increase/decrease font size
        "ctrl+shift+plus=increase_font_size:1"
        "ctrl+shift+minus=decrease_font_size:1"
        "ctrl+shift+0=set_font_size:${toString font-size}"
        # create/remove tabs
        "ctrl+t=new_tab"
        "ctrl+shift+t=new_tab"
        "ctrl+shift+w=close_tab"
        # switch between tabs
        "alt+1=goto_tab:1"
        "alt+2=goto_tab:2"
        "alt+3=goto_tab:3"
        "alt+4=goto_tab:4"
        "alt+5=goto_tab:5"
        "alt+6=goto_tab:6"
        "alt+7=goto_tab:7"
        "alt+8=goto_tab:8"
        "alt+9=goto_tab:9"
        "alt+0=goto_tab:10"
        # create splits
        "alt+n=new_split:auto"
        "alt+q=close_surface"
        "alt+shift+h=new_split:down"
        "alt+shift+v=new_split:right"
        # move between splits
        "alt+h=goto_split:left"
        "alt+j=goto_split:down"
        "alt+k=goto_split:up"
        "alt+l=goto_split:right"
      ];
    };
  };
}
