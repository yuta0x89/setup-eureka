
The files of this repository are used for setting up [Eureka](https://github.com/eureka-research/Eureka).

## Confirure remote desktop
```
$ git clone https://github.com/yuta0x89/setup-eureka.git
$ cd ./setup-eureka

$ chmod +x ./*.sh
$ ./setup-ubuntu-desktop.sh # The system will be rebooted after this command completes execution.
```

Configure the Chrome Remote Desktop service and Connect to your Ubuntu Desktop according to [here](https://ubuntu.com/blog/launch-ubuntu-desktop-on-google-cloud)

## Configure cuda driver
```
$ ./setup-cuda1.sh # The system will be rebooted after this command completes execution.

# Install CUDA drivers
$ sudo ubuntu-drivers install nvidia:535
$ sudo reboot

$ ./setup-cuda2.sh
```

## Install miniconda

```
$ ~/setup-eureka/setup-miniconda.sh
$ ~/miniconda3/bin/conda init bash
```

## Install Isaac Gym
Copy the isaacgym directory from the local machine to the VM.

```
(local)$ scp -r /path/to/local/directory username@vm-ip-address:~/
scp -i ~/.ssh/id_rsa_eureka -r ~/Documents/AI/isaacgym azureuser@20.57.128.221:~/
```

```
conda create -n eureka python=3.8
conda activate eureka
cd ~/isaacgym/python
pip install -e .
```

