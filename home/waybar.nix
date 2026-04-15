{ ... }:

{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";
      height = 32;
      spacing = 4;

      modules-left   = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right  = [ "pulseaudio" "network" "tray" ];

      "hyprland/workspaces" = {
        format = "{id}";
        on-click = "activate";
      };

      "hyprland/window" = {
        max-length = 60;
      };

      "clock" = {
        format = "  {:%a %d %b   %H:%M}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      "pulseaudio" = {
        format = "{icon}  {volume}%";
        format-muted = "  muted";
        format-icons = { default = [ "" "" "" ]; };
        on-click = "pavucontrol";
      };

      "network" = {
        format-wifi     = "  {signalStrength}%";
        format-ethernet = "  connected";
        format-disconnected = "󰖪  disconnected";
        tooltip-format  = "{essid} ({ifname}) {ipaddr}";
        on-click        = "nm-connection-editor";
      };

      "tray" = {
        spacing = 8;
      };
    }];

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", Inter;
        font-size: 13px;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      window#waybar {
        background: #011627;
        color: #d6deeb;
      }

      #workspaces button {
        padding: 0 8px;
        color: #4d6a86;
        background: transparent;
      }

      #workspaces button.active {
        color: #82aaff;
        background: #1d3b53;
        border-bottom: 2px solid #82aaff;
      }

      #workspaces button:hover {
        color: #d6deeb;
        background: #1d3b53;
      }

      #window {
        color: #7fdbca;
        padding: 0 8px;
      }

      #clock {
        color: #c792ea;
        padding: 0 12px;
        font-weight: bold;
      }

      #pulseaudio {
        color: #addb67;
        padding: 0 10px;
      }

      #pulseaudio.muted {
        color: #575656;
      }

      #network {
        color: #82aaff;
        padding: 0 10px;
      }

      #network.disconnected {
        color: #ef5350;
      }

      #tray {
        padding: 0 8px;
      }
    '';
  };
}
