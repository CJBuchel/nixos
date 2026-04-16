{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [ "~/Pictures/wallpaper.jpg" ];
      wallpaper = [
        {
          monitor = "";
          path = "~/Pictures/wallpaper.jpg";
        }
      ];
    };
  };
}
