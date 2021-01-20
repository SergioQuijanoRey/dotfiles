# Author:
#   - Sergio Quijano Rey
#   - sergiquijano@gmail.com
# Description:
#   - Script to setup rootless mode for podman
# Version:
#   - v0.1 - 20/01/2020 - First documented version, but not tested yet
# TODO:
#   - Parametrize username

# Change from cgroups v1 to cgroups v2
sudo systctl -w systemd.unified_cgroup_hierarchy=1
sudo sysctl -w kernel.unprivileged_userns_clone=1

# To avoid some weird error on my system
rm -r ~/.config/containers
rm -r ~/.local/share/containers
podman system migrate
podman unshare cat /proc/self/uid_map

# Create needed files for usermod command
sudo touch /etc/subgid
sudo touch /etc/subuid

# Add space to cgroups
sudo usermod --add-subuids 165536-231072 --add-subgids 165536-231072 sergio

# Show that reboot may be needed
echo "Configuration done"
echo "Reboot may be needed"
