{ config, pkgs, ... }: {
  systemd.timers."hourly-jobs" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*:05:00";
      Persistent = true;
      Unit = "hourly-jobs.service";
    };
  };

  systemd.services."hourly-jobs" = {
    script = ''
      set -eu
      set -o errexit
      set -o nounset
      set -o pipefail

      readonly SCRIPT="/root/jobs/hourly-jobs.sh"
      if [ -x "$SCRIPT" ]; then
        HOUR=$(${pkgs.coreutils}/bin/date +%H)
        ${pkgs.bash}/bin/bash -c "$SCRIPT ${pkgs.nix}/bin/nix $HOUR"
      else
        echo "Script $SCRIPT is not executable or does not exist."
        exit 1
      fi
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}