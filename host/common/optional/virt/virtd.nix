{user, ...}: {
  virtualisation.libvirtd.enable = true;
  users.groups = {
    libvirtd.members = [user];
    kvm.members = [user];
  };
}
