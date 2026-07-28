{ config, lib, pkgs, ... }:

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

      # Lock screen & session
      ksmserver."Lock Session" = [ "Screensaver" "Meta+L" ];
      ksmserver."Log Out" = "Ctrl+Alt+Del";

      # Power
      org_kde_powerdevil.powerProfile = [ "Battery" "Meta+B" ];

      # KWin window management
      kwin.Expose = [ "Ctrl+F9" "Meta+F9" ];
      kwin.ExposeAll = [ "Launch (C)" "Ctrl+F10" "Meta+F10" ];
      kwin.ExposeClass = [ "Ctrl+F7" "Meta+F7" ];
      kwin.Overview = "Meta+W";
      kwin."Grid View" = "Meta+G";
      kwin."Edit Tiles" = "Meta+T";
      kwin."Show Desktop" = "Meta+D";
      kwin."Walk Through Windows" = [ "Alt+Tab" "Meta+Tab" ];
      kwin."Walk Through Windows (Reverse)" = [ "Alt+Shift+Tab" "Meta+Shift+Tab" ];
      kwin."Walk Through Windows of Current Application" = [ "Alt+`" "Meta+`" ];
      kwin."Walk Through Windows of Current Application (Reverse)" = [ "Alt+~" "Meta+~" ];
      kwin."Window Close" = "Alt+F4";
      kwin."Window Maximize" = "Meta+PgUp";
      kwin."Window Minimize" = "Meta+PgDown";
      kwin."Window Restore" = "Meta+Backspace";
      kwin."Window Quick Tile Left" = "Meta+Left";
      kwin."Window Quick Tile Right" = "Meta+Right";
      kwin."Window Quick Tile Top" = "Meta+Up";
      kwin."Window Quick Tile Bottom" = "Meta+Down";
      kwin."Window Operations Menu" = "Alt+F3";
      kwin."Kill Window" = "Meta+Ctrl+Esc";
      kwin."Activate Window Demanding Attention" = "Meta+Ctrl+A";
      kwin."Switch Window Up" = "Meta+Alt+Up";
      kwin."Switch Window Down" = "Meta+Alt+Down";
      kwin."Switch Window Left" = "Meta+Alt+Left";
      kwin."Switch Window Right" = "Meta+Alt+Right";
      kwin."Switch One Desktop Up" = "Meta+Ctrl+Up";
      kwin."Switch One Desktop Down" = "Meta+Ctrl+Down";
      kwin."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
      kwin."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
      kwin."Switch to Desktop 1" = [ "Ctrl+F1" "Meta+F1" ];
      kwin."Switch to Desktop 2" = [ "Ctrl+F2" "Meta+F2" ];
      kwin."Switch to Desktop 3" = [ "Ctrl+F3" "Meta+F3" ];
      kwin."Switch to Desktop 4" = [ "Ctrl+F4" "Meta+F4" ];
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

      # Audio
      kmix.increase_volume = "Volume Up";
      kmix.decrease_volume = "Volume Down";
      kmix.increase_volume_small = "Shift+Volume Up";
      kmix.decrease_volume_small = "Shift+Volume Down";
      kmix.increase_microphone_volume = "Microphone Volume Up";
      kmix.decrease_microphone_volume = "Microphone Volume Down";
      kmix.mute = "Volume Mute";
      kmix.mic_mute = [ "Microphone Mute" "Meta+Volume Mute" ];

      # Power management keys
      org_kde_powerdevil.PowerDown = "Power Down";
      org_kde_powerdevil.PowerOff = "Power Off";
      org_kde_powerdevil.Sleep = "Sleep";
      org_kde_powerdevil.Hibernate = "Hibernate";
      org_kde_powerdevil."Increase Screen Brightness" = "Monitor Brightness Up";
      org_kde_powerdevil."Decrease Screen Brightness" = "Monitor Brightness Down";
      org_kde_powerdevil."Increase Keyboard Brightness" = "Keyboard Brightness Up";
      org_kde_powerdevil."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
      org_kde_powerdevil."Toggle Keyboard Backlight" = "Keyboard Light On/Off";

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

    # ---- Hotkeys for custom launchers ----
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
      # Disable file indexing
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;

      # Blur
      kwinrc.Plugins.blurEnabled = true;

      # XWayland
      kwinrc.Xwayland.Scale = 1;

      # Tiling layout: 3-column (25/50/25)
      kwinrc."Tiling/040eafd4-0782-44e3-8b22-dfd06419e06b/972819fa-8d7c-4daa-89c1-28b5940f8138" = {
        padding = 4;
        tiles = ''
          {"layoutDirection":"horizontal","tiles":[{"width":0.25},{"width":0.5},{"width":0.25}]}
        '';
      };

      # KWallet
      kwalletrc.Wallet."First Use" = false;

      kdeglobals.Color.Scheme = "CatppuccinMochaFlamingo";
      # Icon theme
      kdeglobals.Icons.Theme = "Papirus";

      # Accent color
      kdeglobals.General = {
        AccentColor = "61,174,233";
        LastUsedCustomAccentColor = "61,174,233";
      };

      # Window decorations contrast
      kdeglobals.KDE = {
        contrast = 4;
        frameContrast = 0.15;
      };

      # Keyboard layout
      kxkbrc.Layout.ResetOldOptions = true;

      # Locale
      plasma-localerc.Formats.LANG = "en_US.UTF-8";
    };
  };
}
