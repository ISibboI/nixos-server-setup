{ config, pkgs, ... }: {
  services.home-assistant.config = {
    "automation ui" = "!include automations.yaml";
    "scene ui" = "!include scenes.yaml";

    "scene manual" = [
      {
        id = "110011";
        name = "Daytime preconfigured";
        entities = {
          "light.wiz_rgbw_tunable_f62fd1" = {
            state = "on";
            color_temp = 300;
            color_mode = "color_temp";
          };
        };
      }
    ];
  };
}