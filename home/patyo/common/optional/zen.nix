{ inputs, config, pkgs, ... }:
{

  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;

    profiles.default = {
      userChrome = ''
        :root {
          --zen-bg: #${config.colorScheme.colors.base00};
          --zen-bg-alt: #${config.colorScheme.colors.base01};
          --zen-fg: #${config.colorScheme.colors.base05};
          --zen-accent: #${config.colorScheme.colors.base0D};
          --zen-error: #${config.colorScheme.colors.base08};
        }

        #navigator-toolbox {
          background-color: var(--zen-bg) !important;
          color: var(--zen-fg) !important;
        }

        .tab-background[selected] {
          background-color: var(--zen-accent) !important;
        }
      '';
    };
  };
}

