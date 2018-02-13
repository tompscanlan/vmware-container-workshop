FROM williamyeh/ansible:ubuntu16.04
RUN apt-get update -qq && apt-get install -y x11vnc xvfb fluxbox python-apt
RUN mkdir ~/.vnc
# Setup a VNC password
RUN x11vnc -storepasswd 1234 /etc/x11vnc.pass
VOLUME /code
ADD . /code
WORKDIR /code
RUN ansible-galaxy install -r external_roles.yml
# These arguments assume the local vault password is already created.
CMD ["site.yml", "-i", "inventory.local", "--vault-password-file", "vault_password"]
ENTRYPOINT ["ansible-playbook"]


