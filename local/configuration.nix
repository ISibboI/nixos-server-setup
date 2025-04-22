{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Store secrets in a separate file.
      ./secrets.nix
      # Backup scripts.
      ./backup.nix
    ];

  nix = {
    settings = {
      # Enable flakes and new 'nix' command.
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store.
      auto-optimise-store = true;
    };
  };

  users.mutableUsers = false;

  # We want to use fish instead of bash.
  users.defaultUserShell = pkgs.fish;

  programs.fish.enable = true;
  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
      user.name = "Sebastian Schmidt";
      user.email = "isibboi@gmail.com";
    };
  };

  environment.systemPackages = with pkgs; [
    # Basics
    vim
    file
    htop
    bind
    lm_sensors

    # Fish stuff
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fzf
    fishPlugins.grc
    grc

    # Backups
    duperemove
  ];

  # Set your time zone.
  time.timeZone = "Europe/Helsinki";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "ter-v32n";
    keyMap = "fi";
    packages = with pkgs; [terminus_font];
  };

  # Use GRUB2 as the boot loader.
  # We don't use systemd-boot because Hetzner uses BIOS legacy boot.
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    efiSupport = false;
    devices = [ "/dev/sda" ];
  };

  networking.nameservers = [ "8.8.8.8" "1.1.1.1" ];

  # No root password.
  # Since we don't allow password authentication for SSH, that should be fine for installation.
  # For security reasons, still set one after installation.
  users.users.root.initialPassword = "";

  services.openssh = {
    enable = true;
    # Require public key authentication for better security.
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    settings.PermitRootLogin = "prohibit-password";
    settings.ClientAliveInterval = 60;
    settings.ClientAliveCountMax = 60;
  };

  services.bind = {
    enable = true;
    cacheNetworks = [ "127.0.0.0/24" "::1/128" "192.168.0.0/24" ];
    zones = {
      "home" = {
        master = true;
        allowQuery = [ "127.0.0.0/24" "::1/128" "192.168.0.0/24" ];
        file = pkgs.writeText "home.zone" ''
          $ORIGIN home.
          $TTL    1h
          @                  IN      SOA     ns  hostmaster (
                                                 1    ; Serial
                                                 3h   ; Refresh
                                                 1h   ; Retry
                                                 1w   ; Expire
                                                 1h)  ; Negative Cache TTL
                             IN      NS      ns
          ns                 IN      A       192.168.1.111

          server             IN      A       192.168.1.111
          jellyfin           IN      A       192.168.1.111
        '';
      };
    };
  };

  # Webserver
  services.nginx = {
    enable = true;

    # Use recommended settings
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    # Only allow PFS-enabled ciphers with AES256
    sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";

    # Add virtual hosts:
    virtualHosts = let
      base = locations: {
        inherit locations;

        forceSSL = false;
        enableACME = false;
        root = "/var/www";
      };
      proxy = port: base {
        "/".proxyPass = "http://localhost:" + toString(port);
      };
    in {
      # Immich
      "immich.home" = proxy 8096;
    };
  };

  # Jellyfin
  services.jellyfin = {
    enable = true;
  };

  # Create a backup copy of the system config.
  system.copySystemConfiguration = true;

}
