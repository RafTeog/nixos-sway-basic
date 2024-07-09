{ lib,config, pkgs, ... }:
let modifier = config.wayland.windowManager.sway.config.modifier;
in 
{
wayland.windowManager.sway={
	enable=true;
	wrapperFeatures={
		gtk=true;
		base=true;
	};
	xwayland=true;
	package=pkgs.sway;
        #extraPackages=  with pkgs; [
        	#swayidle foot dmenu wmenu 
        #        ];	
	config = rec {
		modifier = "Mod4";
		
		terminal = "kitty";
		startup = [	#{always=false; 
				#command="firefox";}
				{command = "swaybg -i $HOME/github/nixos-sway-basic/background.png";}	
			];
		down="j";
		bars=[{	colors={
  			background = "#5f676a";
			focusedBackground="#002776";
			focusedSeparator="#ff2800";
			#focusedStatusline="#002776";
			separator="#444444";
			#statusline="002776";
			bindingMode={
  				background = "#900000";
  				border = "#2f343a";
  				text = "#ffffff";
				};
			activeWorkspace={
  				background = "#000000";
  				border = "#333333";
  				text = "#ffffff";
				};
			focusedWorkspace={
 				 background = "#ffdf00";
  				border = "#4c7899";
  				text = "#444444";
				};
			
			inactiveWorkspace={
  				background = "#009c3b";
  				border = "#333333";
  				text = "#ffffff";
				};
			
			urgentWorkspace={
  				background = "#900000";
  				border = "#2f343a";
  				text = "#ffffff";
				};
			};
			fonts={
                        	names = [ "DejaVu Sans Mono" "FontAwesome5Free" ];
                        	style = "Bold Semi-Condensed";
                        	size = 10.0;
                        };
			command="${pkgs.sway}/bin/swaybar";
			hiddenState="show";
        		mode="dock";
        		position="top";
        		statusCommand="${pkgs.i3status}/bin/i3status";
        		trayPadding=2;
        		workspaceButtons=true;
        		workspaceNumbers=true;
		}];
		fonts={
  			names = [ "DejaVu Sans Mono" "FontAwesome5Free" ];
  			style = "Bold Semi-Condensed";
  			size = 11.0;
			};
	
		colors={
			background="#ffdf00";
			focused={
 				 background = "#285577";
  				border = "#4c7899";
  				childBorder = "#285577";
  				indicator = "#2e9ef4";
  				text = "#ffffff";
				};
		focusedInactive={
 			 background = "#5f676a";
  			border = "#333333";
  			childBorder = "#5f676a";
  			indicator = "#484e50";
  			text = "#ffffff";
			};
		placeholder={
 			 background = "#0c0c0c";
  			border = "#000000";
  			childBorder = "#0c0c0c";
  			indicator = "#000000";
  			text = "#ffffff";
			};
		
		unfocused={
 			 background = "#222222";
  			border = "#333333";
  			childBorder = "#222222";
  			indicator = "#292d2e";
  			text = "#888888";
			};
		urgent={
  			background = "#900000";
  			border = "#2f343a";
  			childBorder = "#900000";
  			indicator = "#900000";
  			text = "#ffffff";
			};				
		};
		defaultWorkspace="workspace number 1";
		floating={
			border=2;
			criteria=[
  				{
    				title = "Steam - Update News";
  				}
  				{
    				class = "Pavucontrol";
  				}
				];
			modifier="Mod4";
			titlebar=true;	
		};
		focus={
			followMouse="yes";
			wrapping="no";
			mouseWarping=true;
			newWindow="focus";		
		};
		gaps={
			bottom=1;
			horizontal=2;
			inner=3;
			left=1;
			outer=3;
			right=1;
			smartBorders="off";
			smartGaps=false;
			top=2;
			vertical=2;
		};
		input={
			"type:keyboard"={
                        	xkb_layout="br";
                        	xkb_variant= "nodeadkeys";
                	};	
		};
	
		keybindings={
	#"${modifier}+Return" =lib.mkOptionDefault  "exec ${pkgs.kitty}/bin/kitty";
  	#"${modifier}+Shift+q" = lib.mkOptionDefault "kill";
  	#"${modifier}+d" = lib.mkOptionDefault "exec ${pkgs.dmenu}/bin/dmenu_path | ${pkgs.dmenu}/bin/dmenu | ${pkgs.findutils}/bin/xargs swaymsg exec --";
		"${modifier}+0" = lib.mkOptionDefault "workspace number 10";
		"${modifier}+1" = lib.mkOptionDefault "workspace number 1";
		"${modifier}+2" = lib.mkOptionDefault "workspace number 2";
		"${modifier}+3" = lib.mkOptionDefault "workspace number 3";
		"${modifier}+4" = lib.mkOptionDefault "workspace number 4";
		"${modifier}+5" = lib.mkOptionDefault "workspace number 5";
		"${modifier}+6" = lib.mkOptionDefault "workspace number 6";
		"${modifier}+7" = lib.mkOptionDefault "workspace number 7";
		"${modifier}+8" = lib.mkOptionDefault "workspace number 8";
		"${modifier}+9" = lib.mkOptionDefault "workspace number 9";
		"${modifier}+Down" = lib.mkOptionDefault "focus down";
		"${modifier}+Left" = lib.mkOptionDefault "focus left";
		"${modifier}+Up" = lib.mkOptionDefault "focus up";
		"${modifier}+Return" = lib.mkOptionDefault "exec kitty";
		"${modifier}+Right" = lib.mkOptionDefault "focus right";
		"${modifier}+Shift+0" = lib.mkOptionDefault "move container to workspace number 10";
		"${modifier}+Shift+1" = lib.mkOptionDefault "move container to workspace number 1";
		"${modifier}+Shift+2" = lib.mkOptionDefault "move container to workspace number 2";
		"${modifier}+Shift+3" = lib.mkOptionDefault "move container to workspace number 3";
		"${modifier}+Shift+4" = lib.mkOptionDefault "move container to workspace number 4";
		"${modifier}+Shift+5" = lib.mkOptionDefault "move container to workspace number 5";
		"${modifier}+Shift+6" = lib.mkOptionDefault "move container to workspace number 6";
		"${modifier}+Shift+7" = lib.mkOptionDefault "move container to workspace number 7";
		"${modifier}+Shift+8" = lib.mkOptionDefault "move container to workspace number 8";
		"${modifier}+Shift+9" = lib.mkOptionDefault "move container to workspace number 9";
		"${modifier}+Shift+Down" = lib.mkOptionDefault "move down";
		"${modifier}+Shift+Left" = lib.mkOptionDefault "move left";
		"${modifier}+Shift+Right" = lib.mkOptionDefault "move right";
		"${modifier}+Shift+Up" = lib.mkOptionDefault "move up";
		"${modifier}+Shift+c" = lib.mkOptionDefault "reload";
		"${modifier}+Shift+e" = lib.mkOptionDefault "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exi>";
		"${modifier}+Shift+h" = lib.mkOptionDefault "move left";
		"${modifier}+Shift+j" = lib.mkOptionDefault "move down";
		"${modifier}+Shift+k" = lib.mkOptionDefault "move up";
		"${modifier}+Shift+l" = lib.mkOptionDefault "move right";
		"${modifier}+Shift+minus" = lib.mkOptionDefault "move scratchpad";
		"${modifier}+Shift+q" = lib.mkOptionDefault "kill";
		"${modifier}+Shift+space" = lib.mkOptionDefault "floating toggle";
		#"${modifier}+Up" = lib.mkOptionDefault "focus up";
		"${modifier}+a" = lib.mkOptionDefault "focus parent";
		"${modifier}+b" = lib.mkOptionDefault "splith";
		"${modifier}+d" = lib.mkOptionDefault "exec ${pkgs.wmenu}/bin/wmenu-run";
		"${modifier}+e" = lib.mkOptionDefault "layout toggle split";
		"${modifier}+f" = lib.mkOptionDefault "fullscreen toggle";
		"${modifier}+h" = lib.mkOptionDefault "focus left";
		"${modifier}+j" = lib.mkOptionDefault "focus down";
		"${modifier}+k" = lib.mkOptionDefault "focus up";
		"${modifier}+l" = lib.mkOptionDefault "focus right";
		"${modifier}+minus" = lib.mkOptionDefault "scratchpad show";
		"${modifier}+r" = lib.mkOptionDefault "mode resize";
		"${modifier}+s" = lib.mkOptionDefault "layout stacking";
		"${modifier}+space" = lib.mkOptionDefault "focus mode_toggle";
		"${modifier}+v" = lib.mkOptionDefault "splitv";
		"${modifier}+w" = lib.mkOptionDefault "layout tabbed";
		#Audio
		"XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +10%";
        	"XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -10%";
		"XF86AudioMute" = "exec set-volume toggle-mute";
        	#"XF86AudioStop" = "exec ${pkgs.playerctl}/bin/playerctl stop";
        	#"XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        	#"XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        	#"XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";

        	"XF86MonBrightnessDown" = "exec brightnessctl set 15%-";
        	"XF86MonBrightnessUp" =  "exec brightnessctl set +15%";
		};
		left="h";
		menu="\${pkgs.wmenu}/bin/wmenu_path | \${pkgs.wmenu}/bin/wmenu | \${pkgs.findutils}/bin/xargs swaymsg exec --";
		modes={
  			resize = {
    				Down = "resize grow height 10 px";
    				Escape = "mode default";
    				Left = "resize shrink width 10 px";
    				Return = "mode default";
    				Right = "resize grow width 10 px";
    				Up = "resize shrink height 10 px";
    				h = "resize shrink width 10 px";
    				j = "resize grow height 10 px";
    				k = "resize shrink height 10 px";
    				l = "resize grow width 10 px";
  				};
			};
		output={
  			HDMI-A-1 = {
    			#bg = "#AABBCC solid_color";
  			};
		};
        	right="l";
        	seat={"*" = {hide_cursor = "when-typing enable";};};
		up="k";
		window={
			border=3;
			commands=[{
    				command = "border pixel 2";
    				criteria = {
  					title = "x200: ~/work";
  					floating = true;
				};
  			}];
		hideEdgeBorders="smart";
		titlebar=true;
		};
		workspaceAutoBackAndForth=true;
		workspaceLayout="default";		
		};
		extraConfig=''
			#input "type:keyboard" {
			#	xkb_layout br
			#	xkb_variant nodeadkeys
			#}
		'';
		extraConfigEarly=''
		'';
		extraOptions=[
  			"--verbose"
  			"--debug"
  			#"--unsupported-gpu"
  			#"--my-next-gpu-wont-be-nvidia"
		];
		extraSessionCommands=''
  			export SDL_VIDEODRIVER=wayland
  			# needs qt5.qtwayland in systemPackages
  			export QT_QPA_PLATFORM=wayland
  			export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
  			# Fix for some Java AWT applications (e.g. Android Studio),
  			# use this if they aren't displayed properly:
  			export _JAVA_AWT_WM_NONREPARENTING=1	      
      			export XDG_CURRENT_DESKTOP=sway
		'';
		swaynag={
			enable=true;
			settings={
  				"<config>" = {
    					edge = "bottom";
    					font = "Dina 12";
  					};

  				green = {
    					edge = "top";
    					background = "00AA00";
    					text = "FFFFFF";
    					button-background = "00CC00";
    					message-padding = 10;
  				};
			};
		};
		systemd={
			enable=true;
			extraCommands=[
  				"systemctl --user start sway-session.target"
			];		
			variables=[
  				"DISPLAY"
  				"WAYLAND_DISPLAY"
  				"SWAYSOCK"
  				"XDG_CURRENT_DESKTOP"
  				"XDG_SESSION_TYPE"
  				"NIXOS_OZONE_WL"
  				"XCURSOR_THEME"
  				"XCURSOR_SIZE"
				#"-all"
				];
			xdgAutostart=false;	
		};
	};

}

