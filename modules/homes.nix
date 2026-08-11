{ den, ... }:
{
  den.homes.x86_64-linux.vm = {
    aspect = den.aspects.headless;
    userName = "azureuser";
    home.homeDirectory = "/home/azureuser";
  };

  # Main machines
  den.homes.x86_64-linux.laptop = {
    aspect = den.aspects.desktop;
    userName = "blauzin";
    home.homeDirectory = "/home/blau";
  };

  den.homes.x86_64-linux.desktop = {
    aspect = den.aspects.desktop;
    userName = "blau";
    home.homeDirectory = "/home/blau";
  };

  # Global defaults still apply to all of them
  den.default = {
    homeManager = { home, ... }: {
      home.username = home.userName;
      home.homeDirectory = "/home/${home.userName}";
      home.stateVersion = "26.05";
    };
  };
}
