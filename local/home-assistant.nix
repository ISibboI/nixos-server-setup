{ config, pkgs, ... }: {
  services.home-assistant.config = {
    "automation ui" = "!include automations.yaml";
    "scene ui" = "!include scenes.yaml";

    "automation manual" = [
      {
        alias = "Bedroom morning on";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "06:30:00";
          }
        ];
        conditions = [
          {
            condition = "state";
            entity_id = "light.bedroom";
            state = "off";
            for = { hours = 0; minutes = 1; seconds = 0; };
          }
        ];
        actions = [
          {
            action = "scene.turn_on";
            target.entity_id = "scene.wake_up";
          }
        ];
      }

      {
        alias = "Bedroom morning off";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:50:00";
          }
        ];
        actions = [
          {
            action = "light.turn_off";
            target.entity_id = "light.bedroom";
          }
        ];
      }

      {
        alias = "Bedroom evening on";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "17:30:00";
          }
        ];
        conditions = [
          {
            condition = "state";
            entity_id = "light.bedroom";
            state = "off";
            for = { hours = 0; minutes = 1; seconds = 0; };
          }
        ];
        actions = [
          {
            action = "light.turn_on";
            target.entity_id = "light.bedroom";
            data = {
              brightness = 255;
              transition = 2;
            };
          }
        ];
      }

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

      {
        alias = "Office daytime";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "6:00:00";
          }
        ];
        actions = [
          {
            action = "scene.turn_on";
            target.entity_id = "scene.daytime";
            data.transition = 120;
          }
        ];
      }

      {
        alias = "Office evening dim";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "19:00:00";
          }
        ];
        actions = [
          {
            action = "scene.turn_on";
            target.entity_id = "scene.relax";
            data.transition = 10;
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
            rgbw_color = [255 155 255 150];
            color_mode = "rgbw";
          };
        };
      }

      {
        name = "Wake-up";
        icon = "mdi:weather-sunset-up";
        entities = {
          "light.bedroom" = {
            state = "on";
            effect = "Wake-up";
          };
        };
      }
    ];
  };
}