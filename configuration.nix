# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{lib, config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
	inputs.home-manager.nixosModules.default
	./services.nix
	./host-options.nix
    ];

	#system boot name
	system.nixos.label = "RTsway"; 
   
	networking.hostName = "nixraf"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
# Enable Flakes
#nix.settings.experimental-features=["nix-command" "flakes"];
nix={
	
	settings = {
      		experimental-features = "nix-command flakes";
      		auto-optimise-store = true;
		};
  
};
#Sway
programs.sway.enable=true;
# Sway on Home Manager
security.polkit.enable=true;
#hardware.opengl.enable=true;
hardware = {
	enableAllFirmware = true;
    	cpu.amd.updateMicrocode = true;
    	#bluetooth.enable = true;
    	graphics = {
      		enable = true;
      		enable32Bit = true;
      	#driSupport = true;
      		extraPackages = with pkgs; [
        	amdvlk
	 #	vulkan-tools
        #	vulkan-headers
        #	vulkan-loader
        #	vulkan-validation-layers
        #	vulkan-tools-lunarg
      ];
    };
  };

  # Set your time zone.
  time.timeZone = config.masterOptions.systemTimezone;
  #hardware.pulseaudio.enable = true;
  # Select internationalisation properties.
  i18n.defaultLocale = config.masterOptions.systemLocale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = config.masterOptions.systemExtraLocale;
    LC_IDENTIFICATION = config.masterOptions.systemExtraLocale;
    LC_MEASUREMENT = config.masterOptions.systemExtraLocale;
    LC_MONETARY = config.masterOptions.systemExtraLocale;
    LC_NAME = config.masterOptions.systemExtraLocale;
    LC_NUMERIC = config.masterOptions.systemExtraLocale;
    LC_PAPER = config.masterOptions.systemExtraLocale;
    LC_TELEPHONE = config.masterOptions.systemExtraLocale;
    LC_TIME = config.masterOptions.systemExtraLocale;
  };

  # Configure keymap in X11
  services={
	libinput.enable = true;
	xserver = {
	 	videoDrivers = ["amdgpu"];
    		xkb={
			layout =lib.mkForce config.masterOptions.keyLayout;
    			variant =lib.mkForce config.masterOptions.keyVariant;
			};
  		};
	};
  # Configure console keymap
  console={
	#font="ter-124b";
	keyMap =config.masterOptions.keyMap;
	#packages= with pkgs;[
	#	terminus_font	
	#];
	
};
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

#to enable vendor fish completions provided by Nixpkgs
programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.raf = {
    isNormalUser = true;
    description = "raf";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell=pkgs.fish;
    #ignoreShellProgramCheck = true;
  };
home-manager={
	extraSpecialArgs={inherit inputs;};
	users={
		"raf" = import ./home.nix;
	};
};

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	wget
	git
	pulseaudio
	discord
	wl-clipboard
  ];
 # sound.enable = true;
#  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # lowLatency.enable = true;
  };

  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME    = "$HOME/.local/bin";
    PATH = [ 
      "${XDG_BIN_HOME}"
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
