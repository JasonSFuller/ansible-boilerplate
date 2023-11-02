#!/bin/bash

# PURPOSE:  Prep a RHEL 7/8/9 system for management via Ansible.
# USAGE:  curl -sSL http://example.com/bootstrap.sh | sudo bash

if [[ "$(id -u)" != "0" ]]; then
  echo "ERROR: must run as root" >&2
  exit 1
fi

################################################################################
#  Required
################################################################################

# This section is deceptively simple and is only intended to be "just enough"
# to allow Ansible access.  This is by design, in order to reduce outside
# dependencies, and is intended for *NEW* builds (kickstart configs, packer
# images, etc) where the number of edge cases is very small.  Afterwards, we
# recommend managing systems with Ansible playbooks, as they're more robust and
# handle idempotency and nuance better than shell scripts.
#
# We also assume basic packages are installed, particularly:
#   - bash
#   - coreutils
#   - shadow-utils
#   - sudo
#   - openssh-server
#
# This is almost always the case, since they are required by the "core" group
# package (auto-added by the installer, even for "minimal" installations), but
# it also assumes key parts of the default configuration hasn't been changed,
# e.g. sshd_config allows public/private key authentication, sudoers includes
# rules from the /etc/sudoers.d/ directory, etc.

# -- Add the Ansible user and configure access ---------------------------------

# Create an Ansible system user and group (locally).
useradd ansible \
  --system \
  --user-group \
  --create-home \
  --home-dir /var/lib/ansible \
  --comment "Ansible" \
  --shell /bin/bash

# Allow the Ansible user to sudo without a password.
install -o root -g root -m 0440 \
  <(echo 'ansible ALL=(ALL:ALL) NOPASSWD: ALL') \
  /etc/sudoers.d/ansible

# Set the public SSH keys allowed for the Ansible user.
read -r -d '' keys << EOF
ssh-rsa AAAAB3NzaC1yc2EAAAA... ansible@example.com
ssh-rsa AAAAB3NzaC1yc2FAAAA... user1@example.com
ssh-rsa AAAAB3NzaC1yc2GAAAA... user2@example.com
EOF

# Create the Ansible user's SSH config directory and authorized_keys file.
install -o ansible -g ansible -m 0755 -d ~ansible/.ssh
install -o ansible -g ansible -m 0644 <(echo "${keys}") ~ansible/.ssh/authorized_keys



################################################################################
#  Optional
################################################################################

# IMPORTANT:  Only use these when absolutely required, and try to keep it simple
#   by eliminating anything not needed.  Many tasks are more complicated than
#   they initially seem.  For example, when installing packages, IP connectivity
#   could be limited, repos might not be available (or configured), certificate
#   errors can cause failures, etc.

# -- Certificates --------------------------------------------------------------

# Install the prerequisites for SSL connections and certificate management.
yum install -y openssl ca-certificates

# Add a static certificate, e.g. an internal CA.
cat << 'EOF' > /etc/pki/ca-trust/source/anchors/internal-ca.example.com.pem
-----BEGIN CERTIFICATE-----
MIIFYjCCBEqgAwIBAgIQd70NbNs2+RrqIQ/E8FjTDTANBgkqhkiG9w0BAQsFADBX
MQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEQMA4GA1UE
AAWcAdMg4AeEE5WASY0RfJAyZq+vclC1rztGpD4RhA1KAAABg3kcRYMAAAQDAEcw
...[snip]...
RQIgHYUZ0IyEaQb13P6JREjPg9UdbCE+Qw35dIJ2eIjn2f0CIQCGlVXxfMivJvH8
d0lIKO2d1xozclOzgjXPYovJJIultzkMu34qQb9Sz/yilrbCgj8=
-----END CERTIFICATE-----
EOF

# Sometimes the easiest way to trust a certificate is to simply ask the SSL
# service for it.  This command is particularly handy when your internal CA
# isn't in place yet.  Again, follow up with a playbook, as this first-time
# contact with the remote service is potentially risky, i.e. similar to ssh
# fingerprinting.
openssl s_client -showcerts -connect ad.example.com:636 \
  &>/etc/pki/ca-trust/source/anchors/ad.example.com.pem <<< ''

# Once the above sources are in place, re-scan and update the consolidated
# certificate configs.
update-ca-trust

# -- SSH services --------------------------------------------------------------

# Install, enable, and start sshd.
yum install -y openssh-server
systemctl enable --now sshd.service

# Install, enable, and start firewalld.
yum install -y firewalld
systemctl enable --now firewalld.service

# Add the SSH rules to firewalld's config and reload.
firewall-offline-cmd --add-service ssh
firewall-cmd --reload
