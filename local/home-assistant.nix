{ config, pkgs, ... }: {
  services.home-assistant.config = {
    "automation ui" = "!include automations.yaml";
    "scene ui" = "!include scenes.yaml";

    "scene manual" = [
      {
        name = "Daytime";
        icon = "mdi:white-balance-sunny";
        entities = {
          "light.wiz_rgbw_tunable_f62fd1" = {
            state = "on";
            color_temp_kelvin = 3000;
            color_mode = "color_temp";
          };
          "light.wiz_rgbw_tunable_f63007" = {
            state = "on";
            color_temp_kelvin = 3000;
            color_mode = "color_temp";
          };
          "light.wiz_rgbw_tunable_f63def" = {
            state = "on";
            color_temp_kelvin = 3000;
            color_mode = "color_temp";
          };
        };
      }

      {
        name = "Relax";
        icon = "mdi:sofa-single";
        entities = {
          "light.wiz_rgbw_tunable_f62fd1" = {
            state = "on";
            rgbw_color = [100 245 249 155];
            color_mode = "rgbw";
          };
          "light.wiz_rgbw_tunable_f63007" = {
            state = "on";
            rgbw_color = [100 245 249 155];
            color_mode = "rgbw";
          };
          "light.wiz_rgbw_tunable_f63def" = {
            state = "on";
            rgbw_color = [100 245 249 155];
            color_mode = "rgbw";
          };
        };
      }
    ];
  };
}