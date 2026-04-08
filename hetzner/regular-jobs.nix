{ config, pkgs, ... }: {
  systemd.timers."daily-jobs-at-four" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "16:00:00";
      Persistent = true;
      Unit = "daily-jobs-at-four.service";
    };
  };

  systemd.services."daily-jobs-at-four" = {
    script = ''
      set -eu
      set -o errexit
      set -o nounset
      set -o pipefail

      readonly SCRIPT="/root/jobs/daily-jobs-at-four.sh"
      if [ -x "$SCRIPT" ]; then
        "$SCRIPT"
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