{ config, pkgs, ... }: {
  services.home-assistant.config = {
    "automation ui" = "!include automations.yaml";
    "scene ui" = "!include scenes.yaml";

    "automation manual" = [
      {
        alias = "Bedroom reminder dim";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "19:10:00";
          }
        ];
        conditions = [
          {
            condition = "device";
            type = "is_on";
            device_id = "04b0c1b4eb9cd8c02dddf944d54a6b07";
            entity_id = "af8c051d7ebd61a611e69a0c1c7e6281";
            domain = "light";
            for = { hours = 0; minutes = 1; seconds = 0; };
          }
        ];
        actions = [
          {
            device_id = "04b0c1b4eb9cd8c02dddf944d54a6b07";
            entity_id = "af8c051d7ebd61a611e69a0c1c7e6281";
            domain = "light";
            type = "brightness_decrease";
          }
        ];
      }
    ];

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