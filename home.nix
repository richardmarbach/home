{ config, pkgs, username, system, ... }:

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

  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs._1password
    pkgs._1password-gui
    pkgs.bat
    pkgs.fd
    pkgs.firefox
    pkgs.patchelf
    pkgs.gh
    pkgs.git
    pkgs.htop
    pkgs.jq
    pkgs.neovim
    pkgs.hack-font
    (pkgs.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    pkgs.ripgrep
    pkgs.ruby_3_1
    pkgs.rustup
    pkgs.sd
    pkgs.zk
  ];

  /* xdg.configFile."alacritty".source = config.lib.file.mkOutOfStoreSymlink ./config/alacritty; */
  xdg.configFile."wezterm".source = ./config/wezterm;
  xdg.configFile."rg".source = ./config/rg;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    plugins = [
      {
        name = "plugin-foreign-env";
        src = pkgs.fishPlugins.foreign-env.src;
      }
    ];
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "Hack";
    };
    settings = {
      cursor_shape = "block";
      hide_window_decorations = true;
      macos_options_as_alt = true;
    };
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    shortcut = "q";
    keyMode = "vi";
    newSession = true;
    mouse = true;
    sensibleOnTop = true;
    terminal = "xterm-256color";

    plugins = [
      pkgs.tmuxPlugins.cpu
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.continuum
    ];

    extraConfig = ''
      set -ga terminal-overrides ",*256col*:Tc"

      set -g status-style bg=default

      # Rebind S for session list
      unbind s
      bind S choose-session

      # Split panes with s and v like vim
      bind s split-window -v
      bind v split-window -h
      unbind '"'
      unbind %

      # Use vim like pane switching
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      set-option -g allow-rename off

      # Better mnemonic for renaming panes
      set -s command-alias[10] rename-pane='select-pane -T'
      set -s command-alias[11] renamep='select-pane -T'
    '';
  };
}

