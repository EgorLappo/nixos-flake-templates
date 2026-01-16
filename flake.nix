{
  description = "NixOS flake templates";

  outputs = self: rec {

    templates = {
      pixi = {
        path = ./pixi;
        description = "pixi template";
      };

      rust = {
        path = ./rust;
        description = "rust template with naersk";
      };
    };

    defaultTemplate = templates.pixi;

  };
}
