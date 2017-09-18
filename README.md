# Vagrant on VMWare for Docker

This is a Debian-based container with Vagrant installed and VMWare as the
available provider.

VMWare modules and services need to be installed and running on your host.

VT-x will be required if using this image on a VM. In order to use VMWare
this container must be run with the `--privileged` and `--net=host` parameters.
Please be aware of the security implications of this.

The default command is a script that calls 'vagrant up' and then waits until
the VM is no longer running before terminating. This ensures that the
container does not stop until the VM is finished with.

To run additional commands in the vagrant environment, use `docker exec`.

Vagrant is run from the /vagrant directory by default. You should mount your
directory containing your Vagrantfile to this folder.

Example:
```
    docker run -t -v ~/my/vagrant/project:/vagrant --privileged symbols/vagrant-vmware
```
and then, in another terminal:
```
    docker exec -ti my_container vagrant ssh
    # ...
    docker exec -t my_container vagrant destroy
```

