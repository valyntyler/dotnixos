{
  services.kanata = {
    enable = true;
    keyboards.genericKeyboard = {
      extraDefCfg = "process-unmapped-keys yes";
      config = ''
        (defsrc caps)
        (deflayer start esc)
      '';
    };
  };
}
