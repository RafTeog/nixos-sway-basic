{ lib,config, pkgs,input, ... }:
 
{

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
					format = " %volume";
   					format_muted = " %volume";
        				device = "default";
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

}
