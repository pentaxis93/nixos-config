{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity # Audio manipulation
    blender # 3D modeling
    gimp # Image manipulation
    shotcut # Video editing
  ];
}
