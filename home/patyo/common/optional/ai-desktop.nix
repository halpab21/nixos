{ config, pkgs, lib, ... }:
let
  ollamaPickerScript = pkgs.writeShellScriptBin "ollama-picker" ''
    MODEL=$(curl -s http://localhost:11434/api/tags 2>/dev/null | \
      ${pkgs.jq}/bin/jq -r '.models[].name' | \
      ${pkgs.rofi-wayland}/bin/rofi -dmenu -i -p "Load Model" \
        -theme-str 'window { background-color: #2E3440; border-color: #88C0D0; border: 2px; }' \
        -theme-str 'listview { background-color: #2E3440; }' \
        -theme-str 'element { background-color: #2E3440; text-color: #ECEFF4; }' \
        -theme-str 'element selected { background-color: #3B4252; text-color: #88C0D0; }' \
        -theme-str 'inputbar { background-color: #3B4252; text-color: #ECEFF4; }' \
        -theme-str 'prompt { text-color: #88C0D0; }')

    if [ -n "$MODEL" ]; then
      ${pkgs.alacritty}/bin/alacritty --class ollama-chat -e sh -c "ollama run $MODEL"
    fi
  '';

  promptJournalScript = pkgs.writeShellScriptBin "prompt-journal" ''
    JOURNAL_DIR="$HOME/prompts"
    mkdir -p "$JOURNAL_DIR"
    DATE=$(date +%Y-%m-%d)
    ${pkgs.alacritty}/bin/alacritty --class prompt-journal -e nvim "$JOURNAL_DIR/$DATE.md"
  '';
in
{
  home.packages = [
    ollamaPickerScript
    promptJournalScript
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.95;
        padding = { x = 10; y = 10; };
      };
      colors = {
        primary = {
          background = "#2E3440";
          foreground = "#ECEFF4";
        };
        normal = {
          black = "#3B4252";
          red = "#BF616A";
          green = "#A3BE8C";
          yellow = "#EBCB8B";
          blue = "#81A1C1";
          magenta = "#B48EAD";
          cyan = "#88C0D0";
          white = "#E5E9F0";
        };
        bright = {
          black = "#4C566A";
          red = "#BF616A";
          green = "#A3BE8C";
          yellow = "#EBCB8B";
          blue = "#81A1C1";
          magenta = "#B48EAD";
          cyan = "#8FBCBB";
          white = "#ECEFF4";
        };
      };
      font = {
        size = 12;
      };
    };
  };

  wayland.windowManager.hyprland.extraConfig = ''
    # Unbind existing conflicting keybinds
    unbind = SUPER, SPACE
    unbind = SUPER, RETURN

    # AI Desktop keybinds
    bind = SUPER, SPACE, exec, ags toggle launcher
    bind = SUPER, N, exec, ags toggle notifications
    bind = SUPER, RETURN, exec, [float; size 80% 80%; center] alacritty --class claude-terminal -e claude
    bind = SUPER, O, exec, ollama-picker
    bind = SUPER, P, exec, hyprpicker -a
    bind = SUPER, L, exec, hyprlock
    bind = SUPER SHIFT, P, exec, prompt-journal

    # Window rules for AI terminals
    windowrulev2 = float, class:^(claude-terminal)$
    windowrulev2 = size 80% 80%, class:^(claude-terminal)$
    windowrulev2 = center, class:^(claude-terminal)$
    windowrulev2 = float, class:^(ollama-chat)$
    windowrulev2 = size 60% 70%, class:^(ollama-chat)$
    windowrulev2 = center, class:^(ollama-chat)$
    windowrulev2 = float, class:^(prompt-journal)$
    windowrulev2 = size 50% 60%, class:^(prompt-journal)$
    windowrulev2 = center, class:^(prompt-journal)$

    # AGS autostart
    exec-once = ags run
  '';
}
