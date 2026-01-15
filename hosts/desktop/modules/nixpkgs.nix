{ ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;

      # Used for running LLM models, and getting GPU info for things like btop
      # TODO: delete if not used (big package)
      rocmSupport = true;
    };
  };
}
