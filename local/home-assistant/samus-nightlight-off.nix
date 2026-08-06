{ config, pkgs, ... }: {
  services.home-assistant.config = {
    "automation manual Samu's room nightlight off" = [
      {
        alias = "Samu's room nightlight off 1";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:00:00";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 152;
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
              brightness = 152;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 2";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:00:24";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 151;
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
              brightness = 151;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 3";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:00:47";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 150;
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
              brightness = 150;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 4";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:01:11";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 149;
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
              brightness = 149;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 5";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:01:34";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 148;
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
              brightness = 148;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 6";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:01:58";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 147;
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
              brightness = 147;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 7";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:02:21";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 146;
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
              brightness = 146;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 8";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:02:45";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 145;
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
              brightness = 145;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 9";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:03:08";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 144;
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
              brightness = 144;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 10";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:03:32";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 143;
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
              brightness = 143;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 11";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:03:55";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 142;
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
              brightness = 142;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 12";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:04:19";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 141;
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
              brightness = 141;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 13";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:04:42";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 140;
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
              brightness = 140;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 14";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:05:06";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 139;
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
              brightness = 139;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 15";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:05:29";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 138;
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
              brightness = 138;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 16";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:05:53";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 137;
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
              brightness = 137;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 17";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:06:16";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 136;
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
              brightness = 136;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 18";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:06:40";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 135;
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
              brightness = 135;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 19";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:07:04";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 134;
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
              brightness = 134;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 20";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:07:27";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 133;
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
              brightness = 133;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 21";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:07:51";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 132;
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
              brightness = 132;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 22";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:08:14";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 131;
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
              brightness = 131;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 23";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:08:38";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 130;
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
              brightness = 130;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 24";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:09:01";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 129;
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
              brightness = 129;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 25";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:09:25";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 128;
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
              brightness = 128;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 26";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:09:48";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 127;
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
              brightness = 127;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 27";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:10:12";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 126;
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
              brightness = 126;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 28";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:10:35";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 125;
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
              brightness = 125;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 29";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:10:59";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 124;
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
              brightness = 124;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 30";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:11:22";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 123;
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
              brightness = 123;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 31";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:11:46";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 122;
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
              brightness = 122;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 32";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:12:09";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 121;
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
              brightness = 121;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 33";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:12:33";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 120;
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
              brightness = 120;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 34";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:12:56";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 119;
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
              brightness = 119;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 35";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:13:20";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 118;
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
              brightness = 118;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 36";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:13:44";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 117;
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
              brightness = 117;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 37";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:14:07";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 116;
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
              brightness = 116;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 38";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:14:31";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 115;
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
              brightness = 115;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 39";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:14:54";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 114;
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
              brightness = 114;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 40";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:15:18";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 113;
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
              brightness = 113;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 41";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:15:41";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 112;
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
              brightness = 112;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 42";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:16:05";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 111;
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
              brightness = 111;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 43";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:16:28";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 110;
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
              brightness = 110;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 44";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:16:52";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 109;
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
              brightness = 109;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 45";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:17:15";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 108;
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
              brightness = 108;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 46";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:17:39";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 107;
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
              brightness = 107;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 47";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:18:02";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 106;
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
              brightness = 106;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 48";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:18:26";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 105;
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
              brightness = 105;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 49";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:18:49";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 104;
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
              brightness = 104;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 50";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:19:13";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 103;
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
              brightness = 103;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 51";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:19:36";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 102;
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
              brightness = 102;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 52";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:20:00";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 101;
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
              brightness = 101;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 53";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:20:24";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 100;
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
              brightness = 100;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 54";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:20:47";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 99;
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
              brightness = 99;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 55";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:21:11";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 98;
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
              brightness = 98;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 56";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:21:34";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 97;
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
              brightness = 97;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 57";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:21:58";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 96;
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
              brightness = 96;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 58";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:22:21";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 95;
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
              brightness = 95;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 59";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:22:45";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 94;
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
              brightness = 94;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 60";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:23:08";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 93;
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
              brightness = 93;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 61";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:23:32";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 92;
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
              brightness = 92;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 62";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:23:55";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 91;
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
              brightness = 91;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 63";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:24:19";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 90;
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
              brightness = 90;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 64";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:24:42";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 89;
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
              brightness = 89;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 65";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:25:06";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 88;
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
              brightness = 88;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 66";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:25:29";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 87;
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
              brightness = 87;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 67";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:25:53";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 86;
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
              brightness = 86;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 68";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:26:16";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 85;
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
              brightness = 85;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 69";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:26:40";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 84;
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
              brightness = 84;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 70";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:27:04";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 83;
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
              brightness = 83;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 71";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:27:27";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 82;
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
              brightness = 82;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 72";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:27:51";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 81;
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
              brightness = 81;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 73";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:28:14";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 80;
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
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 74";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:28:38";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 79;
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
              brightness = 79;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 75";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:29:01";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 78;
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
              brightness = 78;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 76";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:29:25";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 77;
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
              brightness = 77;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 77";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:29:48";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 76;
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
              brightness = 76;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 78";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:30:12";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 75;
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
              brightness = 75;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 79";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:30:35";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 74;
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
              brightness = 74;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 80";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:30:59";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 73;
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
              brightness = 73;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 81";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:31:22";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 72;
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
              brightness = 72;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 82";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:31:46";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 71;
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
              brightness = 71;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 83";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:32:09";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 70;
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
              brightness = 70;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 84";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:32:33";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 69;
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
              brightness = 69;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 85";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:32:56";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 68;
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
              brightness = 68;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 86";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:33:20";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 67;
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
              brightness = 67;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 87";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:33:44";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 66;
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
              brightness = 66;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 88";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:34:07";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 65;
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
              brightness = 65;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 89";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:34:31";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 64;
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
              brightness = 64;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 90";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:34:54";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 63;
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
              brightness = 63;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 91";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:35:18";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 62;
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
              brightness = 62;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 92";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:35:41";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 61;
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
              brightness = 61;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 93";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:36:05";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 60;
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
              brightness = 60;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 94";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:36:28";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 59;
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
              brightness = 59;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 95";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:36:52";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 58;
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
              brightness = 58;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 96";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:37:15";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 57;
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
              brightness = 57;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 97";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:37:39";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 56;
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
              brightness = 56;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 98";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:38:02";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 55;
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
              brightness = 55;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 99";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:38:26";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 54;
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
              brightness = 54;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 100";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:38:49";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 53;
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
              brightness = 53;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 101";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:39:13";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 52;
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
              brightness = 52;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 102";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:39:36";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 51;
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
              brightness = 51;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 103";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:40:00";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 50;
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
              brightness = 50;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 104";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:40:24";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 49;
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
              brightness = 49;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 105";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:40:47";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 48;
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
              brightness = 48;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 106";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:41:11";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 47;
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
              brightness = 47;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 107";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:41:34";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 46;
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
              brightness = 46;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 108";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:41:58";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 45;
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
              brightness = 45;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 109";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:42:21";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 44;
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
              brightness = 44;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 110";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:42:45";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 43;
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
              brightness = 43;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 111";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:43:08";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 42;
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
              brightness = 42;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 112";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:43:32";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 41;
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
              brightness = 41;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 113";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:43:55";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 40;
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
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 114";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:44:19";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 39;
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
              brightness = 39;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 115";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:44:42";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 38;
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
              brightness = 38;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 116";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:45:06";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 37;
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
              brightness = 37;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 117";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:45:29";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 36;
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
              brightness = 36;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 118";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:45:53";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 35;
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
              brightness = 35;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 119";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:46:16";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 34;
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
              brightness = 34;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 120";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:46:40";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 33;
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
              brightness = 33;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 121";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:47:04";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 32;
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
              brightness = 32;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 122";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:47:27";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 31;
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
              brightness = 31;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 123";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:47:51";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 30;
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
              brightness = 30;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 124";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:48:14";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 29;
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
              brightness = 29;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 125";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:48:38";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 28;
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
              brightness = 28;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 126";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:49:01";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 27;
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
              brightness = 27;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 127";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:49:25";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 26;
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
              brightness = 26;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 128";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:49:48";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 25;
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
              brightness = 25;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 129";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:50:12";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 24;
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
              brightness = 24;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 130";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:50:35";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 23;
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
              brightness = 23;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 131";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:50:59";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 22;
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
              brightness = 22;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 132";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:51:22";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 21;
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
              brightness = 21;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 133";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:51:46";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 20;
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
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 134";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:52:09";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 19;
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
              brightness = 19;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 135";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:52:33";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 18;
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
              brightness = 18;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 136";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:52:56";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 17;
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
              brightness = 17;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 137";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:53:20";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 16;
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
              brightness = 16;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 138";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:53:44";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 15;
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
              brightness = 15;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 139";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:54:07";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 14;
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
              brightness = 14;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 140";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:54:31";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 13;
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
              brightness = 13;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 141";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:54:54";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 12;
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
              brightness = 12;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 142";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:55:18";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 11;
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
              brightness = 11;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 143";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:55:41";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 10;
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
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 144";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:56:05";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 9;
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
              brightness = 9;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 145";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:56:28";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 8;
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
              brightness = 8;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 146";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:56:52";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 7;
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
              brightness = 7;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 147";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:57:15";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 6;
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
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 148";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:57:39";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 5;
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
              brightness = 5;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 149";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:58:02";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 4;
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
              brightness = 4;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 150";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:58:26";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 3;
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
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 151";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:58:49";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 2;
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
              brightness = 2;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 152";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:59:13";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 1;
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
              brightness = 1;
              transition = 23;
            };
          }
        ];
      }
      
      {
        alias = "Samu's room nightlight off 153";
        mode = "single";
        triggers = [
          {
            trigger = "time";
            at = "08:59:36";
          }
        ];
        conditions = [
          {
            condition = "numeric_state";
            entity_id = "light.samu";
            attribute = "brightness";
            above = 0;
          }
          {
            condition = "state";
            entity_id = "light.samu";
            state = "on";
          }
        ];
        actions = [
          {
            action = "light.turn_off";
            target.entity_id = "light.samu";
            data = {
              transition = 23;
            };
          }
        ];
      }
      
      
    ];
  };
}
