{
  programs.pnpm = {
    enable = true;
    globalBinDir = "~/.local/bin"; # Or any directory of your choice
  };
  environment.variables.PNPM_HOME = "~/.local/bin";
}
