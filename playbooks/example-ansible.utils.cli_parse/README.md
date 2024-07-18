# Example for ansible.utils.cli_parse

## Pre-flight

Set up a Python virtual environment for Ansible, activate it, and then
install/update PIP and Ansible.

```shell
python3 -m venv .venv --prompt ansible
source .venv/bin/activate
pip install --upgrade pip
pip install --upgrade ansible
```

## Usage

```shell
ansible-playbook playbook.yaml
```
