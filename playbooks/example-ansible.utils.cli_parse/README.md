# Example for `ansible.utils.cli_parse`

## Pre-flight

> [!NOTE] This was tested on CentOS Stream 9.

Install a few prerequisite OS packages.

```shell
sudo dnf install vim git sshpass podman
```

Clone this repo and change directory to this example.

```shell
git clone https://github.com/JasonSFuller/ansible-boilerplate
cd ansible-boilerplate/playbooks/example-ansible.utils.cli_parse
```

Set up a Python virtual environment for Ansible, activate it, and then
install/update PIP and Ansible Navigator.

```shell
python3 -m venv .venv --prompt ansible
source .venv/bin/activate
pip install --upgrade pip
pip install --upgrade ansible-navigator
```

## Usage

```shell
ansible-navigator run playbook.yaml
```
