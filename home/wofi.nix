{ ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      width = 600;
      height = 400;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 32;
      gtk_dark = true;
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", Inter;
        font-size: 14px;
      }

      window {
        background-color: #1a1b26;
        border: 1px solid #3b4261;
        border-radius: 12px;
      }

      #input {
        background-color: #16161e;
        color: #c0caf5;
        border: 1px solid #3b4261;
        border-radius: 8px;
        padding: 8px 12px;
        margin: 8px;
        outline: none;
      }

      #input:focus {
        border-color: #7aa2f7;
      }

      #input::placeholder {
        color: #414868;
      }

      #scroll {
        margin: 0 8px 8px 8px;
      }

      #inner-box {
        background: transparent;
      }

      #outer-box {
        padding: 8px;
        background: transparent;
      }

      #entry {
        padding: 8px 12px;
        border-radius: 8px;
        margin: 2px 0;
        color: #a9b1d6;
        background: transparent;
        transition: all 0.15s ease;
      }

      #entry:selected {
        background-color: #292e42;
        color: #c0caf5;
        outline: none;
      }

      #entry:selected #text {
        color: #7aa2f7;
      }

      #text {
        margin-left: 8px;
        color: #a9b1d6;
      }

      #img {
        border-radius: 6px;
        margin-right: 4px;
      }
    '';
  };
}
