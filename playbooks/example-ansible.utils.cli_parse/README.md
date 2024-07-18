# Example for `ansible.utils.cli_parse`

## Pre-flight

Set up a Python virtual environment for Ansible, activate it, and then
install/update PIP and Ansible.

```shell
# Tested on CentOS Stream 9
sudo dnf install vim git sshpass podman
python3 -m venv .venv --prompt ansible
source .venv/bin/activate
pip install --upgrade pip
pip install --upgrade ansible-navigator
```

## Usage


```shell
ansible-navigator run playbook.yaml
```
