{ den, ... }:
{
  den.homes.x86_64-linux.vm = {
    aspect = "headless";          # ← uses the composition above
    userName = "azureuser";         # optional
  };

  # Main machines
  den.homes.x86_64-linux.laptop = {
    aspect = "desktop";
  };

  den.homes.x86_64-linux.desktop = {
    aspect = "desktop";
  };

  # Global defaults still apply to all of them
  den.default = {
    homeManager.home.stateVersion = "25.05";
  };
}
