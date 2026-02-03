{ config, pkgs, ... }: 
{
   wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod, RETURN, exec, kitty"
        "$mod, BACKSPACE, killactive,"
        "$mod, SPACE, exec, hyprlauncher"
	"CTRL SHIFT, ESCAPE, exec, hyprshutdown"
        "$mod, B, exec, zen"
        ",XF86MonBrightnessUp,exec,light -A 5"
        ",XF86MonBrightnessDown,exec,light -U 5"
      ]
      ++ (
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
             "$mod, code:1${toString i}, workspace, ${toString ws}"
             "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
         )
         9)
     );
  };
}
