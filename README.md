
The files of this repository are used for setting up [Eureka](https://github.com/eureka-research/Eureka).

```
$ git clone https://github.com/yuta0x89/setup-eureka.git
$ cd ./setup-eureka

$ chmod +x ./setup-ubuntu-desktop.sh
$ chmod +x ./setup-cuda1.sh
$ ./setup-ubuntu-desktop.sh # The system will be rebooted after this command completes execution.
$ ./setup-cuda1.sh # The system will be rebooted after this command completes execution.

# Install CUDA drivers
$ sudo ubuntu-drivers install nvidia:535
$ sudo reboot
```
