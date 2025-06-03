{ config, pkgs, ... }: {
  services.home-assistant.config = {
    "automation ui" = "!include automations.yaml";
    "scene ui" = "!include scenes.yaml";

    "scene manual" = [
      {
        name = "Daytime preconfigured";
        entities = {
          "light.wiz_rgbw_tunable_f62fd1" = {
            color_temp_kelvin = 3000;
          };
        };
      }
    ];
  };
}