{ ... }:

{
  programs.plasma = {
    enable = true;

    # ---- Workspace ----
    workspace = {
      clickItemTo = "open";
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor.theme = "Bibata-Modern-Ice";
      cursor.size = 32;
    };

    # ---- Shortcuts ----
    shortcuts = {
      # App launchers
      plasmashell."activate application launcher" = [ "Meta" "Alt+F1" ];
      plasmashell."activate task manager entry 1" = "Meta+1";
      plasmashell."activate task manager entry 2" = "Meta+2";
      plasmashell."activate task manager entry 3" = "Meta+3";
      plasmashell."activate task manager entry 4" = "Meta+4";
      plasmashell."activate task manager entry 5" = "Meta+5";
      plasmashell."activate task manager entry 6" = "Meta+6";
      plasmashell."activate task manager entry 7" = "Meta+7";
      plasmashell."activate task manager entry 8" = "Meta+8";
      plasmashell."activate task manager entry 9" = "Meta+9";

      # Launcher apps
      "services/foot.desktop"._launch = "Meta+Return";
      "services/rofi.desktop"._launch = "Meta+Space";

      # Lock screen
      ksmserver."Lock Session" = [ "Meta+L" "Screensaver" ];
      ksmserver."Log Out" = "Ctrl+Alt+Del";

      # Power
      org_kde_powerdevil.powerProfile = [ "Battery" "Meta+B" ];

      # KWin window management
      kwin.Expose = [ "Meta+F9" "Ctrl+F9" ];
      kwin.ExposeAll = [ "Meta+F10" "Launch (C)" "Ctrl+F10" ];
      kwin.ExposeClass = [ "Meta+F7" "Ctrl+F7" ];
      kwin.Overview = "Meta+W";
      kwin."Grid View" = "Meta+G";
      kwin."Edit Tiles" = "Meta+T";
      kwin."Show Desktop" = "Meta+D";
      kwin.WalkThroughWindows = [ "Meta+Tab" "Alt+Tab" ];
      kwin."Walk Through Windows (Reverse)" = [ "Meta+Shift+Tab" "Alt+Shift+Tab" ];
      kwin."Walk Through Windows of Current Application" = [ "Meta+`" "Alt+`" ];
      kwin."Window Close" = "Alt+F4";
      kwin."Window Maximize" = "Meta+PgUp";
      kwin."Window Minimize" = "Meta+PgDown";
      kwin."Window Quick Tile Left" = "Meta+Left";
      kwin."Window Quick Tile Right" = "Meta+Right";
      kwin."Window Quick Tile Top" = "Meta+Up";
      kwin."Window Quick Tile Bottom" = "Meta+Down";
      kwin."Window Operations Menu" = "Alt+F3";
      kwin."Kill Window" = "Meta+Ctrl+Esc";
      kwin."Switch Window Up" = "Meta+Alt+Up";
      kwin."Switch Window Down" = "Meta+Alt+Down";
      kwin."Switch Window Left" = "Meta+Alt+Left";
      kwin."Switch Window Right" = "Meta+Alt+Right";
      kwin."Switch One Desktop Up" = "Meta+Ctrl+Up";
      kwin."Switch One Desktop Down" = "Meta+Ctrl+Down";
      kwin."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
      kwin."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
      kwin."Window to Next Screen" = "Meta+Shift+Right";
      kwin."Window to Previous Screen" = "Meta+Shift+Left";
      kwin."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
      kwin."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
      kwin."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
      kwin."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
      kwin.MoveMouseToCenter = "Meta+F6";
      kwin.MoveMouseToFocus = "Meta+F5";
      kwin.disableInputCapture = "Meta+Shift+Esc";
      kwin.view_zoom_in = [ "Meta++" "Meta+=" ];
      kwin.view_zoom_out = "Meta+-";
      kwin.view_actual_size = "Meta+0";

      # Clipboard
      plasmashell.clipboard_action = "Meta+Ctrl+X";
      plasmashell.show-on-mouse-pos = "Meta+V";
      plasmashell."show dashboard" = "Ctrl+F12";
      plasmashell.cycle-panels = "Meta+Alt+P";

      # Activities
      plasmashell."next activity" = "Meta+A";
      plasmashell."previous activity" = "Meta+Shift+A";

      # Media
      mediacontrol.nextmedia = "Media Next";
      mediacontrol.previousmedia = "Media Previous";
      mediacontrol.playpausemedia = "Media Play";
      mediacontrol.pausemedia = "Media Pause";
      mediacontrol.stopmedia = "Media Stop";
      mediacontrol.seekforwardmedia = "Media Fast Forward";
      mediacontrol.seekbackwardmedia = "Media Rewind";

      # Keyboard layout switching
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";
      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";

      # Accessibility
      kaccess."Toggle Screen Reader On and Off" = "Meta+Alt+S";
    };

    # ---- KWin ----
    kwin = {
      edgeBarrier = 0;
      cornerBarrier = false;
      titlebarButtons.left = [ "close" "minimize" "maximize" ];
      virtualDesktops.number = 1;
      virtualDesktops.rows = 1;
      nightLight.enable = false;
    };

    # ---- Input ----
    input.keyboard.options = [ "caps:escape" ];

    # ---- Shortcuts for apps: foot, rofi, ghostty ----
    hotkeys.commands = {
      "launch-foot" = {
        name = "Launch Foot";
        key = "Meta+Return";
        command = "foot";
      };
      "launch-rofi" = {
        name = "Launch Rofi";
        key = "Meta+Space";
        command = "rofi -show drun";
      };
    };

    # ---- Config files (low-level overrides) ----
    configFile = {
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;

      kwinrc.Xwayland.Scale = 1;

      kwinrc."Tiling/040eafd4-0782-44e3-8b22-dfd06419e06b/972819fa-8d7c-4daa-89c1-28b5940f8138" = {
        padding = 4;
        tiles = ''
          {"layoutDirection":"horizontal","tiles":[{"width":0.25},{"width":0.5},{"width":0.25}]}
        '';
      };

      kwalletrc.Wallet."First Use" = false;

      kdeglobals.KDE = {
        contrast = 4;
        frameContrast = 0.2;
      };

      # WM colors (Tokyo Night inspired)
      kdeglobals.WM = {
        activeBackground = "39,44,49";
        activeBlend = "252,252,252";
        activeForeground = "252,252,252";
        inactiveBackground = "32,36,40";
        inactiveBlend = "161,169,177";
        inactiveForeground = "161,169,177";
      };
    };
  };
}
