{ ... }:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Video
      "video/mp4"         = "mpv.desktop";
      "video/mkv"         = "mpv.desktop";
      "video/webm"        = "mpv.desktop";
      "video/x-matroska"  = "mpv.desktop";
      "video/avi"         = "mpv.desktop";

      # Images
      "image/png"         = "imv.desktop";
      "image/jpeg"        = "imv.desktop";
      "image/gif"         = "imv.desktop";
      "image/webp"        = "imv.desktop";
      "image/svg+xml"     = "imv.desktop";

      # Folders
      "inode/directory"   = "thunar.desktop";

      "text/html"                 = "firefox.desktop";
      "x-scheme-handler/http"     = "firefox.desktop";
      "x-scheme-handler/https"    = "firefox.desktop";
      "x-scheme-handler/about"    = "firefox.desktop";
      "x-scheme-handler/unknown"  = "firefox.desktop";
    };
  };
}
