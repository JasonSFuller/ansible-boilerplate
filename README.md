# Ansible boilerplate

Boilerplate, docs, and info for Ansible and Ansible Automation Platform (AAP)

## Official docs and helpful links

- [Ansible](https://docs.ansible.com/ansible/latest/)
- [Ansible lint](https://ansible.readthedocs.io/projects/lint/usage/)
- [Ansible navigator](https://ansible.readthedocs.io/projects/navigator/settings/)
- [Ansible builder](https://ansible.readthedocs.io/projects/builder/en/stable/definition/)
- [Red Hat CoP](https://redhat-cop.github.io/) > [Good Practices for Ansible](https://redhat-cop.github.io/automation-good-practices/)

### References

- [List of builtin modules](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/)
- [List of all modules](https://docs.ansible.com/ansible/latest/collections/index_module.html)
- [Jinja builtin tests](https://jinja.palletsprojects.com/en/latest/templates/#builtin-tests)
- [Jinja builtin filters](https://jinja.palletsprojects.com/en/latest/templates/#builtin-filters)

### Writing playbooks

#### Basics

- **[Playbook guide](https://docs.ansible.com/ansible/latest/playbook_guide/)**
- **[Example playbooks](https://github.com/ansible/ansible-examples)**
- [Testing strings and evaluating expressions](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_tests.html)
- [Conditionals](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_conditionals.html)
- [Loops](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_loops.html)
- [Encrypting content](https://docs.ansible.com/ansible/latest/vault_guide/vault_encrypting_content.html)
- [Role directory structure](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html#role-directory-structure)
- [Using roles](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html#using-roles)

#### Advanced

- [Module defaults](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_module_defaults.html)
- [Making variables optional](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_filters.html#making-variables-optional)
- [Advanced playbook syntax](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_advanced_syntax.html)

## Ansible Automation Platform

Ansible is an open source automation tool, and Red Hat Ansible Automation
Platform (AAP) is a web UI and set of tools to support Ansible within an
organization.

> _**Note:**  Red Hat changed the name from "Ansible Tower" to "Ansible
> Automation Platform" to better reflect the expanding toolset, which eventually
> became more than simply the web UI and controller._

### AAP 1.x

- [Ansible Tower User Guide v3.8.6](https://docs.ansible.com/ansible-tower/3.8.6/html/userguide/)

> :warning: **WARNING** -- This version is not recommended.  It's scheduled to
> reach end-of-life on September 29, 2023, and Red Hat will not offer support
> afterwards.

### AAP 2.x

- [Red Hat Ansible Automation Platform Life Cycle](https://access.redhat.com/support/policy/updates/ansible-automation-platform)
- [Red Hat Ansible Automation Platform Planning Guide](https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.4/html/red_hat_ansible_automation_platform_planning_guide)
  - [Chapter 2. Red Hat Ansible Automation Platform Architecture](https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.4/html/red_hat_ansible_automation_platform_planning_guide/aap_architecture)
- [Red Hat Ansible Automation Platform Installation Guide](https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.4/html/red_hat_ansible_automation_platform_installation_guide)
  - [Chapter 3. Installing Red Hat Ansible Automation Platform](https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.4/html/red_hat_ansible_automation_platform_installation_guide/assembly-platform-install-scenario)
- [Reference Architectures](https://access.redhat.com/documentation/en-us/reference_architectures/current) > 2021 > [Deploying Ansible Automation Platform 2.1](https://access.redhat.com/documentation/en-us/reference_architectures/2021/html/deploying_ansible_automation_platform_2.1/overview)
- [Ansible Automation Platform docs](https://docs.ansible.com/automation.html)
  - [Automation Controller user guide](https://docs.ansible.com/automation-controller/latest/html/userguide/)
    - [Builtin credential types](https://docs.ansible.com/automation-controller/latest/html/userguide/credentials.html#credential-types)
    - [Custom credential types](https://docs.ansible.com/automation-controller/latest/html/userguide/credential_types.html)
