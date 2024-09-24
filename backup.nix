{ config, pkgs, ... }: {
  systemd.timers."backup-daily" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "backup-daily.service";
    };
  };
  
  systemd.timers."backup-weekly" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
      Unit = "backup-weekly.service";
    };
  };
  
  systemd.timers."backup-monthly" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "monthly";
      Persistent = true;
      Unit = "backup-monthly.service";
    };
  };
  
  systemd.timers."backup-yearly" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "yearly";
      Persistent = true;
      Unit = "backup-yearly.service";
    };
  };

  systemd.timers."backup-prune" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "backup-prune.service";
    };
  };

  systemd.services."backup-daily" = {
    script = ''
      set -eu
      set -o errexit
      set -o nounset
      set -o pipefail

      readonly SOURCE_CONFIGS=("/home/syncthing:syncthing" "/var/lib/immich:immich")

      readonly DATE="''$(${pkgs.coreutils}/bin/date '+%Y-%m-%d')"
      readonly BACKUP_DIR="/backup/daily/$DATE"

      ${pkgs.coreutils}/bin/mkdir -p "$BACKUP_DIR"

      # Sync
      for SOURCE_CONFIG in "''${SOURCE_CONFIGS[@]}"; do
        readarray -d ":" -t SOURCE_TARGET <<< "$SOURCE_CONFIG"
        SOURCE_DIR=''${SOURCE_TARGET[0]}
        TARGET_DIR=''${SOURCE_TARGET[1]}
        ${pkgs.rsync}/bin/rsync -av --delete "''${SOURCE_DIR}/" --link-dest "''${SOURCE_DIR}/" "''${BACKUP_DIR}/''${TARGET_DIR}"
      done
      
      # Move latest pointer
      ${pkgs.coreutils}/bin/rm -f "/backup/latest"
      ${pkgs.coreutils}/bin/ln -s "''${BACKUP_DIR}" "/backup/latest"
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };

  systemd.services."backup-weekly" = {
    script = ''
      set -eu
      set -o errexit
      set -o nounset
      set -o pipefail

      ${pkgs.coreutils}/bin/mkdir -p "/backup/daily"
      readonly DATE="$(${pkgs.coreutils}/bin/date '+%G-%V')"
      readonly BACKUP_DIR="/backup/weekly/$DATE"
      readonly SOURCE_SUBDIR="$(${pkgs.coreutils}/bin/ls -t /backup/daily | ${pkgs.gnugrep}/bin/grep -v 'latest' | sed '6q;d')"
      readonly SOURCE_DIR="/backup/daily/$SOURCE_SUBDIR"

      if [ -n "$SOURCE_SUBDIR" ]; then
        ${pkgs.coreutils}/bin/mkdir -p "$BACKUP_DIR"
        ${pkgs.coreutils}/bin/cp -al "$SOURCE_DIR/" "BACKUP_DIR/"
      else
        echo "Skipping weekly backup as there are not enough daily backups yet"
      fi
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };

  systemd.services."backup-monthly" = {
    script = ''
      set -eu
      set -o errexit
      set -o nounset
      set -o pipefail

      ${pkgs.coreutils}/bin/mkdir -p "/backup/weekly"
      readonly DATE="$(${pkgs.coreutils}/bin/date '+%Y-%m')"
      readonly BACKUP_DIR="/backup/monthly/$DATE"
      readonly SOURCE_SUBDIR="$(${pkgs.coreutils}/bin/ls -t /backup/weekly | ${pkgs.gnugrep}/bin/grep -v 'latest' | sed '4q;d')"
      readonly SOURCE_DIR="/backup/weekly/$SOURCE_SUBDIR"

      if [ -n "$SOURCE_SUBDIR" ]; then
        ${pkgs.coreutils}/bin/mkdir -p "$BACKUP_DIR"
        ${pkgs.coreutils}/bin/cp -al "$SOURCE_DIR/" "BACKUP_DIR/"
      else
        echo "Skipping monthly backup as there are not enough weekly backups yet"
      fi
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };

  systemd.services."backup-yearly" = {
    script = ''
      set -eu
      set -o errexit
      set -o nounset
      set -o pipefail

      ${pkgs.coreutils}/bin/mkdir -p "/backup/monthly"
      readonly DATE="$(${pkgs.coreutils}/bin/date '+%Y')"
      readonly BACKUP_DIR="/backup/yearly/$DATE"
      readonly SOURCE_SUBDIR="$(${pkgs.coreutils}/bin/ls -t /backup/monthly | ${pkgs.gnugrep}/bin/grep -v 'latest' | sed '12q;d')"
      readonly SOURCE_DIR="/backup/monthly/$SOURCE_SUBDIR"

      if [ -n "$SOURCE_SUBDIR" ]; then
        ${pkgs.coreutils}/bin/mkdir -p "$BACKUP_DIR"
        ${pkgs.coreutils}/bin/cp -al "$SOURCE_DIR/" "BACKUP_DIR/"
      else
        echo "Skipping yearly backup as there are not enough monthly backups yet"
      fi
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };

  systemd.services."backup-prune" = {
    script = ''
      set -eu
      set -o errexit
      set -o nounset
      set -o pipefail

      readonly BACKUP_DIR="/backup"
      ${pkgs.coreutils}/bin/mkdir -p "/backup/daily" "/backup/weekly" "/backup/monthly"

      # Remove daily backups after one week
      ${pkgs.coreutils}/bin/ls -t /backup/daily | ${pkgs.coreutils}/bin/tail -n +8 | ${pkgs.findutils}/bin/xargs -Iä ${pkgs.coreutils}/bin/rm -rf /backup/daily/ä

      # Remove weekly backups after six weeks
      ${pkgs.coreutils}/bin/ls -t /backup/weekly | ${pkgs.coreutils}/bin/tail -n +7 | ${pkgs.findutils}/bin/xargs -Iä ${pkgs.coreutils}/bin/rm -rf /backup/weekly/ä

      # Remove monthly backups after fourteen months
      ${pkgs.coreutils}/bin/ls -t /backup/monthly | ${pkgs.coreutils}/bin/tail -n +15 | ${pkgs.findutils}/bin/xargs -Iä ${pkgs.coreutils}/bin/rm -rf /backup/monthly/ä

      # Never remove yearly backups
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}