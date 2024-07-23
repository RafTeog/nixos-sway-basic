{ lib,config, pkgs,input, ... }:
 
{

programs= {
	i3status-rust={
		enable=true;
		package=pkgs.i3status-rust;
		bars={default={
  blocks = [
    {
block = "focused_window";
format = " $title.str(max_w:21) |";
}
	{
       block = "disk_space";
       path = "/";
       info_type = "available";
alert_unit = "GB";
alert = 10.0;
warning = 15.0;
format = " $icon $available ";
format_alt = " $icon $available / $total ";
     }
     {
       block = "memory";
	interval=5;
	warning_mem=80;
	critical_mem=90;	
       format = " $icon $mem_used.eng(prefix:Mi)/$mem_total.eng(prefix:Mi)($mem_used_percents.eng(w:2)) ";
     }
     {
       block = "cpu";
      interval = 1;
	format = " $icon $barchart $utilization ";
	format_alt = " $icon $frequency{ $boost|} ";
	info_cpu = 20;
	warning_cpu = 50;
	critical_cpu = 90;
     }
     #{
     #  block = "load";
     #  interval = 1;
     #  format = " $icon 1min avg: $1m.eng(w:4) ";
     #}
	{
	block = "amd_gpu";
	format = " $icon $utilization ";
	format_alt = " $icon MEM: $vram_used_percents ($vram_used/$vram_total) ";
	interval = 1;
	}


       {
    block = "sound";
    format = " $icon $volume ";
	click = [
      {
        button = "left";
        cmd = "pavucontrol";
      }
    ];
  }
{
block = "net";
format = " $icon {$signal_strength $ssid $frequency|Wired} ";
}
{
block = "external_ip";
format = " $version $utc_offset $country_code $country_flag ";
}
     {
       block = "time";
       interval = 60;
       format = " $timestamp.datetime(f:'%a %d/%m %R') ";
     }
  ];
  settings = {
    theme =  {
      theme = "solarized-dark";
      overrides = {
        idle_bg = "#123456";
        idle_fg = "#abcdef";
      };
    };
  };
  icons = "awesome5";
  theme = "gruvbox-dark";
};		
	
};
	};


};

}
