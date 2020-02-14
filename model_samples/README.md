# Sample Models for Linux Simulink Coder Target

Currently, there is one sample model which can run either on the local machine or can be deployed to a remote architecture target (aarch64 or armhf).

## RT priority
For both samples, the user starting up the application on the target hase to be able to set RT priorities. This capabilty can be added to a user called `username` by adding the following lines to /etc/security/limits.conf
```
username   -  rtprio     95
username   -  memlock    unlimited
```
Alternatively, one can replace `username` by `@sudo` which would add the same capability to all user in sudo group.

## Connection to the remote host
To run the application on the remote target, the host PC connects to the remote target via SSH. To do so, target SSH key has to be either stored in the Simulink model folder under the name `target-ssh-key` or in folder visible by the ssh command.

