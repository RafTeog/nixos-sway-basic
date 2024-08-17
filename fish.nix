{
  inputs,
  pkgs,
  ...
}: {
#	programs.bash = {
#  interactiveShellInit = ''
#    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
#    then
#      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
#      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
#    fi
#  '';
#};
  programs.fish = {
    enable = true;
	package=pkgs.fish;	
    functions = {
      fish_prompt = {
        body = ''
          string join "" -- (set_color red) "[" (set_color yellow) $USER (set_color green) "@" (set_color blue) $hostname (set_color magenta) " " $(prompt_pwd) (set_color red) ']' (set_color normal) "\$ "
        '';
      };

      hst = {
        body = ''
          history | uniq | ${pkgs.fzf}/bin/fzf | ${pkgs.wl-clipboard}/bin/wl-copy -n
        '';
      };
    };

    shellInit = ''
      set fish_greeting

      set -x EDITOR nano

    '';

    shellAliases = {
      lf = "lfcd";
      os = "nh os";
    };

    # setup vi mode
    interactiveShellInit = ''
      fish_vi_key_bindings
    '';
  
	loginShellInit="";
	plugins=[];
	shellAbbrs={};
	shellInitLast="";
};
}
