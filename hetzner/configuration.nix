{ config, pkgs, ... }:

let
  # Store secrets in a separate file.
  secrets = builtins.getFlake "path:/root/secrets?lastModified=1762194542&narHash=sha256-x1RuURL02JqeCWgHJ8iN6H/p0BfZcs2BETKEu/SVmW4%3D";
  matrixFqdn = "matrix.${config.networking.domain}";
  matrixBaseUrl = "https://${matrixFqdn}";
  clientConfig."m.homeserver".base_url = matrixBaseUrl;
  serverConfig."m.server" = "${matrixFqdn}:443";
  mkWellKnown = data: ''
    add_header Content-Type application/json;
    add_header Access-Control-Allow-Origin *;
    return 200 '${builtins.toJSON data}';
  '';
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Backup scripts.
      ./backup.nix
      # Mailserver.
      (builtins.fetchTarball {
        # Pick a release version you are interested in and set its hash, e.g.
        url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/57d9624c71ca65bee69b30d72b11f6c5257e9500/nixos-mailserver-57d9624c71ca65bee69b30d72b11f6c5257e9500.tar.gz";
        # To get the sha256 of the nixos-mailserver tarball, we can use the nix-prefetch-url command:
        # nix-prefetch-url "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/master/nixos-mailserver-master.tar.gz" --unpack
        sha256 = "0vmzm1qh7yg52cr6v45jhhwd2yb1h82pyi44dx9h5jrqdv7b2mci";
      })
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
    direnv
    docker-compose

    # Fish stuff
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fzf
    fishPlugins.grc
    grc

    # htpasswd for creating HTTP basic auth logins
    apacheHttpd

    # Image editing
    exiftool

    # Python3 for sshuttle VPN over SSH
    python3

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

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  # Use GRUB2 as the boot loader.
  # We don't use systemd-boot because Hetzner uses BIOS legacy boot.
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    efiSupport = false;
    devices = [ "/dev/sda" "/dev/sdb" ];
  };

  networking.hostName = "hetzner";
  networking.useDHCP = false;
  # Network (Hetzner uses static IP assignments, and we don't use DHCP here)
  networking.domain = secrets.domain;
  networking.interfaces.${secrets.nixos_interface} = {
    ipv4.addresses = [
      {
        address = secrets.ip_v4;
        # The prefix length is commonly, but not always, 24.
        # You should check what the prefix length is for your server
        # by inspecting the netmask in the "IPs" tab of the Hetzner UI.
        # For example, a netmask of 255.255.255.0 means prefix length 24
        # (24 leading 1s), and 255.255.255.192 means prefix length 26
        # (26 leading 1s).
        prefixLength = secrets.netmask_prefix_length;
      }
    ];
    ipv6.addresses = [
      {
        address = secrets.ip_v6;
        prefixLength = 64;
      }
    ];
  };
  networking.defaultGateway = secrets.default_gateway;
  networking.defaultGateway6 = { address = "fe80::1"; interface = secrets.nixos_interface; };

  # The mdadm RAID1s were created with 'mdadm --create ... --homehost=hetzner',
  # but the hostname for each machine may be different, and mdadm's HOMEHOST
  # setting defaults to '<system>' (using the system hostname).
  # This results mdadm considering such disks as "foreign" as opposed to
  # "local", and showing them as e.g. '/dev/md/hetzner:root0'
  # instead of '/dev/md/root0'.
  # This is mdadm's protection against accidentally putting a RAID disk
  # into the wrong machine and corrupting data by accidental sync, see
  # https://bugzilla.redhat.com/show_bug.cgi?id=606481#c14 and onward.
  # We do not worry about plugging disks into the wrong machine because
  # we will never exchange disks between machines, so we tell mdadm to
  # ignore the homehost entirely.
  boot.swraid.mdadmConf = ''
    HOMEHOST <ignore>
  '';
  boot.swraid.enable = true;

  networking.nameservers = [ "8.8.8.8" "1.1.1.1" ];

  # No root password.
  # Since we don't allow password authentication for SSH, that should be fine for installation.
  # For security reasons, still set one after installation.
  users.users.root.initialPassword = "";
  # The only possibility to log in initially is this ssh key.
  users.users.root.openssh.authorizedKeys.keys = [
    secrets.root_ssh_key
  ];

  services.openssh = {
    enable = true;
    # Require public key authentication for better security.
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    settings.PermitRootLogin = "prohibit-password";
    settings.ClientAliveInterval = 60;
    settings.ClientAliveCountMax = 60;
  };

  # Create a backup copy of the system config.
  system.copySystemConfiguration = true;

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

        forceSSL = true;
        enableACME = true;
        root = "/var/www";
      };
      proxy = port: base {
        "/".proxyPass = "http://localhost:" + toString(port);
      };
    in {
      # Define syncthing.${config.networking.domain} as reverse-proxied service on localhost:8384
      "syncthing.${config.networking.domain}" = proxy 8384 // {
        basicAuthFile = "/var/www/.htpasswd";
      };

      "matrix.${config.networking.domain}" = proxy 8008;

      # Make matrix findable from root domain
      "${config.networking.domain}" = {
        enableACME = true;
        forceSSL = true;
        locations."= /.well-known/matrix/server".extraConfig = mkWellKnown serverConfig;
        locations."= /.well-known/matrix/client".extraConfig = mkWellKnown clientConfig;
      };

      # Element: webinterface for matrix
      "element.${config.networking.domain}" = {
        enableACME = true;
        forceSSL = true;

        root = pkgs.element-web.override {
          conf = {
            default_server_config = clientConfig; # see `clientConfig` from the snippet above.
          };
        };
      };

      # Enable ACME for nextcloud
      "nextcloud.${config.networking.domain}" = {
        enableACME = true;
        forceSSL = true;
      };

      # Gitlab
      "gitlab.${config.networking.domain}" = {
        enableACME = true;
        forceSSL = true;
        root = "/var/www";
        locations."/".proxyPass = "http://unix:/run/gitlab/gitlab-workhorse.socket";
      };

      # Immich
      "immich.${config.networking.domain}" = {
        enableACME = true;
        forceSSL = true;
        root = "/var/www";
        # Required to upload large files.
        extraConfig = ''
          proxy_read_timeout 10800s;
          proxy_send_timeout 10800s;
          send_timeout 10800s;
          client_max_body_size 0;
        '';
        locations."/" = {
          proxyPass = "http://localhost:2283";
          proxyWebsockets = true;
        };
      };

      # Forgejo
      "forgejo.${config.networking.domain}" = {
        enableACME = true;
        forceSSL = true;
        root = "/var/www";
        extraConfig = "client_max_body_size 512M;";
        locations."/".proxyPass = "http://unix:/run/forgejo/forgejo.sock";
      };

      # Home assistant
      "home.${config.networking.domain}" = {
        forceSSL = true;
        enableACME = true;
        extraConfig = ''
          proxy_buffering off;
        '';
        locations."/" = {
          proxyPass = "http://[::1]:8123";
          proxyWebsockets = true;
        };
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "isibboi@gmail.com";
  };

  # Syncthing
  services = {
    syncthing = {
        enable = true;
        user = "syncthing";
        dataDir = "/home/syncthing";    # Default folder for new synced folders
        openDefaultPorts = true;
        overrideDevices = false;
        overrideFolders = false;
    };
  };

  # Matrix
  services.matrix-synapse = {
    enable = true;
    settings.server_name = config.networking.domain;
    settings.public_baseurl = matrixBaseUrl;
    settings.listeners = [
      { port = 8008;
        bind_addresses = [ "localhost" ];
        type = "http";
        tls = false;
        x_forwarded = true;
        resources = [ {
          names = [ "client" "federation" ];
          compress = true;
        } ];
      }
    ];
    extraConfigFiles = [ "/etc/nixos/matrix-shared-secret.txt" ];
  };

  # Nextcloud
  services.nextcloud = {
    enable = true;
    hostName = "nextcloud.${config.networking.domain}";
    package = pkgs.nextcloud32;
    https = true;
    config = {
      dbtype = "pgsql";
      # Set only once, hence it can be in /run
      adminpassFile = "/etc/nixos/nextcloud-admin-pass.txt";
      # Needed every time.
      dbpassFile = "/etc/nixos/nextcloud-postgres-pass.txt";
    };
  };

  /*# Gitlab
  services.gitlab = {
    enable = true;
    host = "gitlab.${config.networking.domain}";
    port = 443;
    https = true;
    databasePasswordFile = "/etc/nixos/gitlab-postgres-pass.txt";
    initialRootPasswordFile = "/etc/nixos/gitlab-initial-root-pass.txt";
    secrets = {
      secretFile = "/etc/nixos/gitlab-secret.txt";
      otpFile = "/etc/nixos/gitlab-otp.txt";
      dbFile = "/etc/nixos/gitlab-db.txt";
      jwsFile = pkgs.runCommand "oidcKeyBase" {} "${pkgs.openssl}/bin/openssl genrsa 2048 > $out";
    };
  };
  systemd.services.gitlab-backup.environment.BACKUP = "dump";

  # Gitlab runner
  services.gitlab-runner = {
    enable = true;
    settings.concurrent = 8;
    services.debian = {
      # File should contain at least these two variables:
      # `CI_SERVER_URL`
      # `REGISTRATION_TOKEN`
      authenticationTokenConfigFile = "/etc/nixos/gitlab-runner-registration.txt";
      dockerImage = "debian:stable";
      cloneUrl = "https://gitlab.${config.networking.domain}";
      environmentVariables = {
        # Make sure it uses btrfs volumes for faster CI times.
        DOCKER_DRIVER = "btrfs";
      };
    };
  };*/

  # Mailserver
  mailserver = {
    enable = true;
    stateVersion = 3;
    fqdn = "mail.${config.networking.domain}";
    domains = [ "${config.networking.domain}" ];

    # A list of all login accounts. To create the password hashes, use
    # nix-shell -p mkpasswd --run 'mkpasswd -sm bcrypt'
    loginAccounts = {
      "sibbo@${config.networking.domain}" = {
        hashedPasswordFile = "/etc/nixos/mail-password-sibbo.txt";
        aliases = ["postmaster@${config.networking.domain}"];
      };
    };

    # Use Let's Encrypt certificates. Note that this needs to set up a stripped
    # down nginx and opens port 80.
    certificateScheme = "acme-nginx";
  };

  # Grocy
  services.grocy = {
    enable = true;
    hostName = "grocy.${config.networking.domain}";
    settings = {
      currency = "EUR";
      culture = "en";
      calendar = {
        showWeekNumber = true;
        # 1 = Monday
        firstDayOfWeek = 1;
      };
    };
  };

  # Immich
  services.immich = {
    enable = true;
  };

  # Forgejo
  services.forgejo = {
    enable = true;
    database.type = "postgres";
    lfs.enable = true;
    settings = {
      server = {
        DOMAIN = "forgejo.${config.networking.domain}";
        ROOT_URL = "https://forgejo.${config.networking.domain}/";
        PROTOCOL = "http+unix";
      };
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "github";
      };
      service.DISABLE_REGISTRATION = true; 
    };
  };

  # Forgejo actions runner
  services.gitea-actions-runner = {
    package = pkgs.forgejo-actions-runner;
    instances.default = {
      enable = false;
      name = "monolith";
      url = "https://forgejo.${config.networking.domain}/";
      # Obtaining the path to the runner token file may differ
      tokenFile = "/etc/nixos/forgejo-runner-token.txt";
      labels = [
        "ubuntu-latest:docker://node:16-bullseye"
        "ubuntu-22.04:docker://node:16-bullseye"
        "ubuntu-20.04:docker://node:16-bullseye"
        "ubuntu-18.04:docker://node:16-buster"
      ];
    };
  };

  # Postgres setup
  services.postgresql = {
    enable = true;
    # Matrix
    initialScript = pkgs.writeText "postgres-init.sql" ''
      CREATE ROLE "matrix-synapse" WITH LOGIN PASSWORD 'synapse';
      CREATE DATABASE "matrix-synapse" WITH OWNER "matrix-synapse"
        TEMPLATE template0
        LC_COLLATE = "C"
        LC_CTYPE = "C";

      CREATE ROLE "nextcloud" WITH LOGIN PASSWORD 'nextcloud';
      CREATE DATABASE "nextcloud" WITH OWNER "nextcloud";
    '';
    # Home assistant
    ensureDatabases = [ "hass" ];
    ensureUsers = [{
      name = "hass";
      ensureDBOwnership = true;
    }];
  };

  # Firewall
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = secrets.system.stateVersion; # Did you read the comment?
}
