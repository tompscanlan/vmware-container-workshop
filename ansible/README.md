Container Workshop Ansible
==========================

This is an ansible repo to set up an environment for the container workshop.

Getting Started
---------------

1. Deploy a host for the controller (this might be your development box.)
2. Connect to the controller and perform remaining steps there
3. Install Ansible (http://docs.ansible.com/ansible/)
    * ubuntu 14.04:
        1. `sudo apt-get install -y python-pip python-dev libssl-dev sshpass`
        1. `sudo pip install --upgrade setuptools`
        1. `sudo pip install ansible markupsafe`
1. clone this repository and cd into it
4. Install extra roles ```sudo ansible-galaxy install -r external_roles.yml```
5. Configure hosts (check values in the inventory file, e.g. ```cp inventory.sample inventory``` and edit)
6. Set password and other security
   ```
   echo "$VAULT_PASSWORD" > vault_password
   ```
   Also ensure you have credentials or keys for ssh to all target servers.
   NOTE: You can also manually enter the vault password during execution with ```--ask-vault-pass```
7. Copy `extra_vars.yml.sample` to `extra_vars.yml`, and customize as necessary.
8. You may wish to first run the devtools role targeting your development box
   (e.g. localhost) and perform later steps from there.
   ```
   ansible-playbook site.yml -i inventory --vault-password-file vault_password --extra-vars "@extra_vars.yml" -kK --tags dev
   ```
9. Run site playbook:
   ```
   ansible-playbook site.yml -i inventory --vault-password-file  vault_password --extra-vars "@extra_vars.yml" -kK
   ```
   or
   ```
   ansible-playbook site.yml -i inventory --ask-vault-pass --extra-vars "@extra_vars.yml" -kK
   ```

Running on OSX
--------------

To test basic provisioning on OSX, you have options.  You may wish to
run ansible on the OSX machine, targeting VMs launched via VMware
Fusion, VirtualBox, etc., or you can run a container (see below) on
OSX for the controller.


Local with Containers
---------------------

Installing docker is an exercise for the reader; follow best practices for your platform.

Build the container:
```
docker build -t vmware-esp/espwine-ansible .
```

Run the container interactively for debugging:
```
# For debugging, run the container with VNC so you can debug ansible.
docker run -it -v $PWD:/code -p 5900:5900 --entrypoint x11vnc vmware-esp/espwine-ansible -forever -usepw -create -rfbauth /etc/x11vnc.pass
# You can then connect with VNC to your docker host, port 5900.```

To work in container interactivly:
```
 docker run -it --rm  --entrypoint bash -v $PWD:/code vmware-esp/espwine-ansible
```

Run the container to perform ansible steps:
```
docker run -it -v $PWD:/code vmware-esp/espwine-ansible
```
