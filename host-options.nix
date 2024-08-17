# Joe's dotfiles
# Copyright (C) 2023  Josep Jesus Bigorra Algaba (jjbigorra@gmail.com)

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

{ lib, config, ... }:

let isLightMode = config.masterOptions.raf.lightMode.enable;
in with lib; {
  options.masterOptions = {
    systemLocale = mkOption {
      description = ''
        Locale to use for the system, e.g. "nl_NL.UTF-8"
      '';
      default = "en_US.UTF-8";
    };
	systemExtraLocale = mkOption {
		description = "Auxiliary locale to use for the system";
      default = "pt_BR.UTF-8";
    };
#i18n.extraLocaleSettings.LC_ADDRESS = config.masterOptions.systemLocale;

    systemTimezone = mkOption {
      description = ''
        Timezone to use for the system, e.g. "Europe/Amsterdam"
      '';
      default = "America/Sao_Paulo";
    };
    keyLayout = mkOption {
      description = ''
        Keyboard layout to use
      '';
      default = "br";
    };
	keyVariant = mkOption {
		description = "Keyboard variant to use";
		default = "nodeadkeys";
	};
        keyMap = mkOption {
                description = "Keyboard Map to use";
                default = "br-abnt2";
        };
    defaultSession = mkOption {
      description = ''
        The default session to use when logging in this machine,
        unless you manually select another one in GDM.
      '';
      default = "sway";
    };
    raf = {
      wallpaperPath = mkOption {
        description = ''
          Absolute file path to the wallpaper to use.
        '';
        default =
          "/home/raf/wallpapers/";
      };
      lightMode = { enable = mkEnableOption "light UI mode"; };
      backgroundHexColor = mkOption {
        description = ''
          Background color for many applications and UI in HEX format.
        '';
        default = if isLightMode then "#eff1f5" else "#1e1e2e";
      };
      monospacedFontFamily = mkOption {
        description = ''
          Monospaced font for many applications and UI.
        '';
        default = "JetBrains Mono";
      };
    };
  };
}
