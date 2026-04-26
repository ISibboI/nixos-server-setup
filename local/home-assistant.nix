{ config, pkgs, ... }: {
  services.home-assistant.config = {
    "automation ui" = "!include automations.yaml";
    "scene ui" = "!include scenes.yaml";

    "automation manual" = [
      ###############
      ### Bedroom ###
      ###############
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

      ###################
      ### Samu's Room ###
      ###################
      {
        alias = "Samu's room morning on 1";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "06:45:00";
          }
        ];
        conditions = [
          {
            condition = "state";
            entity_id = "light.samu";
            state = "off";
            for = { hours = 0; minutes = 1; seconds = 0; };
          }
        ];
        actions = [
          {
            action = "light.turn_on";
            target.entity_id = "light.samu";
            data = {
              brightness = 1;
              transition = 60;
              color_temp_kelvin = 4500;
            };
          }
        ];
      }

      {
        alias = "Samu's room morning on 2";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "06:47:00";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            below = 3;
          }
          {
            condition = "state";
            entity_id = "light.samu";
            state = "on";
          }
        ];
        actions = [
          {
            action = "light.turn_on";
            target.entity_id = "light.samu";
            data = {
              brightness = 3;
              transition = 60;
              color_temp_kelvin = 4500;
            };
          }
        ];
      }

      {
        alias = "Samu's room morning on 3";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "06:49:00";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            below = 6;
          }
          {
            condition = "state";
            entity_id = "light.samu";
            state = "on";
          }
        ];
        actions = [
          {
            action = "light.turn_on";
            target.entity_id = "light.samu";
            data = {
              brightness = 6;
              transition = 60;
              color_temp_kelvin = 4500;
            };
          }
        ];
      }

      {
        alias = "Samu's room morning on 4";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "06:51:00";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            below = 10;
          }
          {
            condition = "state";
            entity_id = "light.samu";
            state = "on";
          }
        ];
        actions = [
          {
            action = "light.turn_on";
            target.entity_id = "light.samu";
            data = {
              brightness = 10;
              transition = 60;
              color_temp_kelvin = 4500;
            };
          }
        ];
      }

      {
        alias = "Samu's room morning on 5";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "06:53:00";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            below = 20;
          }
          {
            condition = "state";
            entity_id = "light.samu";
            state = "on";
          }
        ];
        actions = [
          {
            action = "light.turn_on";
            target.entity_id = "light.samu";
            data = {
              brightness = 20;
              transition = 60;
              color_temp_kelvin = 4500;
            };
          }
        ];
      }

      {
        alias = "Samu's room morning on 6";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "06:55:00";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            below = 40;
          }
          {
            condition = "state";
            entity_id = "light.samu";
            state = "on";
          }
        ];
        actions = [
          {
            action = "light.turn_on";
            target.entity_id = "light.samu";
            data = {
              brightness = 40;
              transition = 60;
              color_temp_kelvin = 4500;
            };
          }
        ];
      }

      {
        alias = "Samu's room morning on 7";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "06:57:00";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            below = 80;
          }
          {
            condition = "state";
            entity_id = "light.samu";
            state = "on";
          }
        ];
        actions = [
          {
            action = "light.turn_on";
            target.entity_id = "light.samu";
            data = {
              brightness = 80;
              transition = 60;
              color_temp_kelvin = 4500;
            };
          }
        ];
      }

      {
        alias = "Samu's room morning on 8";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "06:59:00";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            below = 160;
          }
          {
            condition = "state";
            entity_id = "light.samu";
            state = "on";
          }
        ];
        actions = [
          {
            action = "light.turn_on";
            target.entity_id = "light.samu";
            data = {
              brightness = 160;
              transition = 60;
              color_temp_kelvin = 4500;
            };
          }
        ];
      }

      {
        alias = "Samu's room morning on 9";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "07:00:00";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            below = 255;
          }
          {
            condition = "state";
            entity_id = "light.samu";
            state = "on";
          }
        ];
        actions = [
          {
            action = "light.turn_on";
            target.entity_id = "light.samu";
            data = {
              brightness = 255;
              transition = 60;
              color_temp_kelvin = 4500;
            };
          }
        ];
      }

      {
        alias = "Samu's room morning off";
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
            target.entity_id = "light.samu";
          }
        ];
      }

      {
        alias = "Samu's room evening on";
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
            entity_id = "light.samu";
            state = "off";
            for = { hours = 0; minutes = 1; seconds = 0; };
          }
        ];
        actions = [
          {
            action = "light.turn_on";
            target.entity_id = "light.samu";
            data = {
              brightness = 255;
              transition = 2;
              color_temp_kelvin = 2700;
            };
          }
        ];
      }

      ##############
      ### Office ###
      ##############
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
        alias = "Office daytime retrigger if turned off";
        mode = "single";
        triggers = [
          {
            trigger = "state";
            entity_id = "light.sebastian_room";
            from = "unavailable";
            to = "on";
          }
        ];
        conditions = [
          {
            condition = "time";
            after = "06:00:00";
            before = "18:59:00";
          }
          {
            condition = "template";
            value_template = "{{ this.attributes.last_triggered is none or this.attributes.last_triggered < today_at(\"05:00:00\") }}";
          }
        ];
        actions = [
          {
            action = "scene.turn_on";
            target.entity_id = "scene.daytime";
            data.transition = 0.1;
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
            color_temp_kelvin = 3500;
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