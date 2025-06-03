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
            condition = "state";
            entity_id = "light.bedroom";
            state = "on";
            for = { hours = 0; minutes = 1; seconds = 0; };
          }
          {
            condition = "numeric_state";
            entity_id = "light.bedroom";
            attribute = "brightness";
            above = 150;
          }
        ];
        actions = [
          {
            action = "light.turn_on";
            target.entity_id = "light.bedroom";
            data = {
              transition = 2;
              brightness = 150;
            };
          }
        ];
      }
    ];

    "scene manual" = [
      {
        name = "Daytime";
        icon = "mdi:white-balance-sunny";
        entities = {
          "light.sebastian_room" = {
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
          "light.sebastian_room" = {
            state = "on";
            rgbw_color = [100 245 249 155];
            color_mode = "rgbw";
          };
        };
      }
    ];
  };
}