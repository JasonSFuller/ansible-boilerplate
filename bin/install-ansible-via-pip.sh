#!/bin/bash

# Install the latest open source Ansible (and tools) via pip.

# Pre-flight
function error { echo "ERROR: $*" >&2; exit 1; }
if [[ "$(id -u)" == '0' ]]; then error "do not run as root"; fi
if [[ ! -f /etc/os-release ]]; then error "missing /etc/os-release"; fi
# shellcheck source=/dev/null
source /etc/os-release
install -m 0755 -d "$HOME/.local/bin" && export PATH="$PATH:$_"

# Install Python3 prerequisites and Podman (or Docker)
case "$ID_LIKE" in
  fedora) # RHEL, CentOS, etc
    sudo  dnf install -y python3{,-pip,-wheel,-setuptools} podman ;;
  debian) # Ubuntu, Pop_OS, Kali, Mint, etc
    sudo DEBIAN_FRONTEND=noninteractive \
      apt-get install -y python3{,-pip,-wheel,-setuptools} docker.io
    sudo systemctl enable --now docker ;;
  *)
    error "unknown distro (ID_LIKE=$ID_LIKE)" ;;
esac

# Update PIP and tools, then install the latest Ansible
python3 -m pip install --upgrade --user pip wheel setuptools
python3 -m pip install --upgrade --user ansible{,-lint,-navigator,-builder}
