# Devmachine

A collection of [Ansible](https://www.ansible.com) playbooks to automate common
tasks on my development machines. These are used on MacOS (Big Sur), Ubuntu, and
Ubuntu via WSL.

__You probably don't want to use this directly because it's highly specific to
my current workflow. The best way to use these would be to fork and modify or
to scan and steal the bits you need.__

## Features

* Syncing dotfiles
* MacOS settings configuration
* Creating SSH key and linking it to GitHub
* Installing binaries, pulling source code repos, and placing configuration files
* Install VS Code and VS Code extensions

## Usage

The GitHub module requires an authentication token from GitHub with permissions
to add/modify ssh keys for the account. You can provide that token by setting
the `GH_TOKEN` environment variable.

Before running, you must create a [user.yaml](vars/user_example.yaml) file in the
`vars/` directory to provide additional values.

```bash
# Only updates dotfiles.
ansible-playbook --tags=dotfiles-only devmachine.yaml

# Updates packages, repos, and binaries installed through these tasks.
ansible-playbook devmachine.yaml

# Bootstrap a new machine, probably only need to run once.
ansible-playbook --tags=all,init --ask-become-password devmachine.yaml
```
