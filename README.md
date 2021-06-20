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

## Bootstrapping

### Ubuntu 20+

```bash
sudo apt-get install unzip ansible # Installs requirements
ansible-galaxy collection install -r requirements.yaml

# Set GH_TOKEN environment variable from secret.
# export GH_TOKEN=XXXXXXXX
export XDG_CONFIG_HOME=$HOME/.config

# Bootstrap a new machine, probably only need to run once.
ansible-playbook --tags=all,init --ask-become-password devmachine.yaml
```

## Usage

The GitHub module requires an authentication token from GitHub with permissions
to add/modify ssh keys for the account. You can provide that token by setting
the `GH_TOKEN` environment variable.

Before running, you must create a [user.yaml](vars/user_example.yaml) file in the
`vars/` directory to provide additional values.

```bash
# Install collection dependencies.
ansible-galaxy collection install -r requirements.yaml

# Only updates dotfiles.
ansible-playbook --tags=dotfiles-only devmachine.yaml

# Updates packages, repos, and binaries installed through these tasks.
ansible-playbook devmachine.yaml
```

## Customization

You can provide a `POST-INSTALL.sh` script in the root directory of this repo in
order to do some additional configuration that will run each time the dotfiles
sync.

For example, you could use it to update personal git information.

```bash
#!/usr/bin/env bash

git config --global user.name "John Doe"
git config --global user.email "johndoe@example.com"
git config --global user.signingkey "XXXXXXXXXXXXXX"
```

## Notes
