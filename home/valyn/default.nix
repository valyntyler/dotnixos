{inputs, ...}: {
  imports = [
    ../common/software/services/walker.nix
    ../common/software/browser
    ../common/software/editor
    ../common/software/email
    ../common/software/games
    ../common/software/launcher
    ../common/software/creation.nix
    ../common/software/packages.nix
    ../common/terminal/emulator
    ../common/terminal/programs
    ../common/terminal/prompt
    ../common/terminal/shell
    ../common/terminal/packages.nix
    ../common/uiux/cursor.nix
    ../common/uiux/dconf.nix
    ../common/uiux/fonts.nix
    ../common/uiux/gtk.nix
    ../common/uiux/xdg.nix

    # modules
    ../../modules/home-manager
    inputs.zen-browser.homeModules.beta
  ];

  # FIX: clangd can't find libgcc on its own for now
  home.file.".config/clangd/config.yaml".text = ''
    CompileFlags:
      Add:
        - "-I/nix/store/gi4cz4ir3zlwhf1azqfgxqdnczfrwsr7-glibc-2.40-66-dev/include"
        - "-I/nix/store/gj06hl0vb46kf66zpsss4gk5wphfh5lk-compiler-rt-libc-21.1.2-dev/include"
        - "-I/nix/store/kzq78n13l8w24jn8bx4djj79k5j717f1-gcc-14.3.0/include/c++/14.3.0"
        - "-I/nix/store/kzq78n13l8w24jn8bx4djj79k5j717f1-gcc-14.3.0/include/c++/14.3.0/x86_64-unknown-linux-gnu"
        - "-I/nix/store/sqlnjj8c3n3si3sjnadhdbcwgrk97g2w-clang-wrapper-21.1.2/resource-root/include"
        - "-I/nix/store/gi4cz4ir3zlwhf1azqfgxqdnczfrwsr7-glibc-2.40-66-dev/include"
  '';

  home = {
    username = "valyn";
    homeDirectory = "/home/valyn";
    stateVersion = "24.05";
  };

  targets.genericLinux.enable = true;
  programs.home-manager.enable = true;
}
