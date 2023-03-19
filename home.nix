{ config, pkgs, username, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  home.packages = [
    pkgs.htop
    pkgs.neovim
    pkgs.fd
    pkgs.ripgrep
    pkgs.bat
    pkgs.git
    pkgs.gh
    pkgs._1password-gui
    pkgs._1password
    pkgs.rustup
    pkgs.ruby_3_1
    pkgs.firefox
    pkgs.zk
  ];

  xdg.configFile."alacritty".source = config.lib.file.mkOutOfStoreSymlink ./config/alacritty;

  /* programs.fish = { */
  /*   enable = true; */
  /*   plugins = [ */
  /*     { */
  /*       name = "plugin-foreign-env"; */
  /*       src = pkgs.fetchFromGitHub { */
  /*         owner = "oh-my-fish"; */
  /*         repo = "plugin-foreign-env"; */
  /*         rev = "3ee95536106c11073d6ff466c1681cde31001383"; */
  /*         sha256 = "vyW/X2lLjsieMpP9Wi2bZPjReaZBkqUbkh15zOi8T4Y="; */
  /*       }; */
  /*     } */
  /*   ]; */
  /* }; */
  /**/
  /* home.file.".config/" = { */
  /*   fish = { */
  /*     enable = true; */
  /*     source = config/fish; */
  /*     recursive = true; */
  /*   }; */
  /* }; */
}

