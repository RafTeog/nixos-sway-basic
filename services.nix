{pkgs,...}:{
services.displayManager={
	defaultSession="sway";
	sddm={
		package=pkgs.plasma5Packages.sddm;
		enable=true;
	
		settings={};
		wayland={
			enable=true;
			#compositor="";
		};
		theme="maldives";
		stopScript="";
		extraPackages=[];
		enableHidpi=true;
		autoNumlock=true;
		autoLogin={
			relogin=false;
			minimumUid=1000;
		};
	};
};

}
