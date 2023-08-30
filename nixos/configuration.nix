# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in
{

  imports =
    [ # Include the results of the hardware scan.
      (import "${home-manager}/nixos")
      ./hardware-configuration.nix
      /home/jvinas/.sys-config/nixos/vim.nix
    ];


  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    xkbOptions = "caps:super";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jvinas = {
    isNormalUser = true;
    description = "Jaime Vinas";
    extraGroups = [ "networkmanager" "wheel" "docker"];
  };


  home-manager.users.jvinas = {
    home.username = "jvinas";
    home.homeDirectory = "/home/jvinas";

    home.stateVersion = "23.05";
    programs.home-manager.enable = true;

    programs = {
      git = {
        enable = true;
        userName  = "jaimevp54";
        userEmail = "jvinas@multimediallc.com";
        aliases = {
          ci = "commit";
          co = "checkout";
          ph = "push origin HEAD";
          s = "status";
          d = "diff";
        };
      };

      bash = {
        enable = true;
        initExtra = ''
          export XDG_CONFIG_HOME=$HOME/.config

          parse_git_branch() {
          git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
          }
          export PS1="\[\033[01;34m\]\w\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\]$ "

          cd ~/projects/chaturbate
        '';
      };

      zoxide = {
        enable = true;
      };
    };


    home.packages = with pkgs; [
      (pkgs.python311.withPackages (ps: with ps; [pip ipython invoke textual requests]))
      zeal
      nodejs
    ];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "jvinas";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    (pkgs.python311.withPackages (ps: with ps; [pip ipython requests]))
    alacritty
    gh
    git
    google-chrome
    google-cloud-sdk
    ranger
    ripgrep                                                                                                     
    tree                                                                                            
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # List services that you want to enable:

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.x11 = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  services.xserver = {
    enable = true;
   
    desktopManager = {
      xterm.enable = false;
    };
    excludePackages = [ pkgs.xterm ];

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
      ];
    };
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
