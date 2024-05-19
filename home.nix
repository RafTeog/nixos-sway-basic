{ lib,config, pkgs,input, ... }:
let modifier = config.wayland.windowManager.sway.config.modifier;

in 
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "raf";
  home.homeDirectory = "/home/raf";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
	kitty
	firefox
	dmenu
	#nwg-look
    	#qt5ct
    	#catppuccin-qt5ct
    	#lxappearance
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

wayland.windowManager.sway={
	enable=true;
	wrapperFeatures={
		gtk=true;
		base=true;
	};
	xwayland=true;
	package=pkgs.sway;
        #extraPackages=  with pkgs; [
        #	swaylock swayidle foot dmenu wmenu 
        #        ];	
	config = rec {
		modifier = "Mod4";
		
		terminal = "kitty";
		startup = [{always=false; command="firefox";}];
		down="j";
		bars=[{	colors={
  			background = "#5f676a";
			focusedBackground="#5f676a";
			focusedSeparator="#444444";
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
			command="/nix/store/96ryr7v08zmp2xrz62rcq23r8c4wi4sq-sway-1.9/bin/swaybar";
			hiddenState="show";
        		mode="dock";
        		position="top";
        		statusCommand="/nix/store/c10ircljnj76p4j1wkh9pfyycq10yl4d-i3status-2.14/bin/i3status";
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
		"${modifier}+d" = lib.mkOptionDefault "exec /nix/store/xs78ggqicsw19yqpacgm3syv996x3p6y-dmenu-5.3/bin/dmenu_path | /nix/store/xs7>";
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
		};
		left="h";
		menu="\${pkgs.dmenu}/bin/dmenu_path | \${pkgs.dmenu}/bin/dmenu | \${pkgs.findutils}/bin/xargs swaymsg exec --";
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
    			bg = "#AABBCC solid_color";
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

programs= {
	i3status={
		enable=true;
		enableDefault=false;
		package=pkgs.i3status;
		general={
  			colors = true;
  			color_good = "#e0e0e0";
  			color_degraded = "#d7ae00";
  			color_bad = "#f69d6a";
  			interval = 1;
		};
		modules={
        		"volume master"={
        		enable=true;
				position=lib.mkDefault 1;
				settings={
					format = "♪: %volume";
        				format_muted = "♪: muted (%volume)";
        				device = "pulse:1";
        				mixer = "Master";
        				mixer_idx = 0;
				};
			};
				#ipv6 = { 
				#	enable=false;
				#	position = lib.mkDefault 1; 
				#};

        			#"wireless _first_" = {
        			#	enable=false;  
				#	position = lib.mkDefault 2;
          			#	settings = {
            			#		format_up =lib.mkDefault "W: (%quality at %essid) %ip";
            			#		format_down = lib.mkDefault "W: down";
          			#	};
        			#};
        		"ethernet _first_" = {
        			enable=true; 
	 			position = lib.mkDefault 2;
          			settings = {
            				#format_up = lib.mkDefault "E: %ip (%speed)";
            				format_up = lib.mkDefault "E: (%speed)";
					format_down = lib.mkDefault "E: down";
          			};
        		};
        			#"battery all" = {
        			#	enable=false;  
				#	position = lib.mkDefault 4;
          			#	settings = { 
				#		format = lib.mkDefault "%status %percentage %remaining"; };
        			#};
        		"disk /" = {
         			enable=true;
				position = lib.mkForce 3;
          			settings = { 
					format = lib.mkForce "%avail"; 
				};
        		};
        		"load" = {
          			enable=true;
				position = lib.mkDefault 4;
          			settings = { 
					format = lib.mkDefault "%1min"; 
				};
        		};
        		"memory" = {
          			enable=true;
				position = lib.mkDefault 5;
          			settings = {
            				format = lib.mkDefault "%used | %available";
            				threshold_degraded = lib.mkDefault "1G";
            				format_degraded = lib.mkDefault "MEMORY < %available";
          			};
        		};
        		"tztime local" = {
          			enable=true;
				position = lib.mkDefault 6;
          			settings = { 
					format = lib.mkDefault "%Y-%m-%d %H:%M:%S"; 
				};
			};
       		};
	};
};



/*gtk = {
	enable = true;
	font = {
      		name = "Cantarell";
      		size = 11;
      		package = pkgs.cantarell-fonts;
    	};
    	cursorTheme = {
     	# name = "Bibata-Modern-Ice";
      		name = "Bibata-Modern-Classic";
      		size = 24;
      		package = pkgs.bibata-cursors;
    	};
    	iconTheme = {
      	# name = "Vivid-Dark-Icons";
      		name = "Papirus-Dark";
      		package = pkgs.papirus-icon-theme;
    	};

    	catppuccin = {
      		enable = true;
      		accent = "teal";
      		size = "standard";
      		tweaks = [ "normal" ];
      		cursor = {
        		enable = false;
        		accent = "teal";
        		flavour = "macchiato";
      		};
    	};

	gtk4.extraConfig = {
      		gtk-application-prefer-dark-theme = true;
    	};

};
*/


  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/raf/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
