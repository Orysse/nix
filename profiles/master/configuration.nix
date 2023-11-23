# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, hostname, username, locale, timezone, ... }:

{
  imports =
    [ 
      ../../system/hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;

    theme = pkgs.stdenv.mkDerivation rec {
      pname = "catppuccin-grub";
      version = "1";
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "grub";
        rev = "803c5df";
        hash = "sha256-/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0=";
      };
      installPhase = "
        mkdir -p $out
        cp -r src/catppuccin-mocha-grub-theme/* $out/  
      ";
      meta = {
        description = "catppuccin-grub";
      };
    };
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  networking.hostName = hostname;

  networking.networkmanager.enable = true;

  time.timeZone = timezone;

  i18n.defaultLocale = locale;

  services.xserver = {
    layout = "us";
    xkbVariant = "";
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      sddm.enable = true;
      sddm.theme = "rose-pine";
      defaultSession = "none+bspwm";
    };

    windowManager.bspwm = {
      enable = true;
    };
  };

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  }; 

  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
  
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    cmake
    gcc
    git
    greetd.tuigreet
    killall
    libnotify
    tree
    unzip
    vim
    wget
    wl-clipboard
    xdg-desktop-portal-hyprland
    
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )

    # derivations
    (callPackage ../../system/packages/sddm-rose-pine.nix {})

  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "IosevkaTerm" "Iosevka" ]; })
    rounded-mgenplus
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
