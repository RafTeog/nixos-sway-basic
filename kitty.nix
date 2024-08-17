{
  inputs,
  pkgs,
  ...
}: {
  programs.kitty = {
    	enable = true;
	package=pkgs.kitty;
	environment={};
	extraConfig="";
	font={
		package=pkgs.dejavu_fonts;
		name="DejaVu Sans";
		size=10;	
	};
	keybindings={
  		"ctrl+c" = "copy_or_interrupt";
  		"ctrl+f>2" = "set_font_size 20";
	};
	settings={
  		scrollback_lines = 10000;
  		enable_audio_bell = false;
  		update_check_interval = 0;
	};
	shellIntegration={
		enableBashIntegration=false;
		enableFishIntegration=true;
		enableZshIntegration=false;
		mode= "no-rc";
	};
	theme= "Space Gray Eighties";   
};
}
