# Distributed builds
The following README is a guide to setup a distributed build system for ardupilot targeted towards ChibiOS build.

## Server Side Setup 

There are two schemes that can be used on the server side:

* SSH based

Under this scheme all user needs is distcc installed on the server side, there is no need for docker for this scheme. Do note that this method is slower than the IP based scheme, but slightly quicker to setup.

Considering that you have SSH configured on remote and local, following are the steps that are needs to happen:

* Install latest distcc 3.3.3+ are recommended. I didn't have any luck with distcc 3.1 supplied over apt-get in Ubuntu 18.04. If needed compile and install the latest version from here: https://github.com/distcc/distcc . For Ubuntu 20.04 and above simply doing following will do:
```
sudo apt-get install distcc
```
* Edit `~/.ssh/environment` to contain following vars:
```
DISTCC_CMDLIST_NUMWORDS=1
DISTCC_CMDLIST=/home/<user>/.distcc/DISTCC_CMDLIST
```
* Add file `/home/<user>/.distcc/DISTCC_CMDLIST` with following content:
```
/usr/lib/ccache/arm-none-eabi-g++
/usr/lib/ccache/arm-none-eabi-gcc
```
---
**NOTE**

You can add more compilers to above list, also note that above list uses ccache version of compilers. You can edit this to redirect towards compiler directly as well.

---

## TCP/IP based

Under this scheme distcc works over TCP/IP networking, this scheme is faster than ssh method and recommended for most application.

Note that following setup assumes that you have docker installed on the server.

* Pull latest ardupilot-dev-distccd docker
```
docker pull ardupilot/ardupilot-dev-distccd
```
* Run docker using following command
```
docker run -d -p 3632:3632 -p 3633:3633 ardupilot/ardupilot-dev-distccd --jobs <Max number of jobs>
```
* If you have firewall enabled ensure that you connection over ports 3632 and 3633. For ubuntu following commands can be used:
```
sudo ufw allow from 172.27.0.0/16 to 172.27.124.34 port 3632 proto tcp
sudo ufw allow from 172.27.0.0/16 to 172.27.124.34 port 3633 proto tcp
```
`172.27.124.34` can be replaced with server IP and `172.27.0.0/16` with subnet you want to allow connection from.

The above setup is good enough when dealing over local networking. For servers on remote location following setup can be considered:

### Zerotier Setup

I found this to be the best and quickest way to setup a Virtual Private Network for this purpose.

* Create an account at https://www.zerotier.com
* Setup on both host and server https://www.zerotier.com/download/
* Setup Network on your account
* Join the network on each server and host using network id
* You will need to accept the accounts and give the name under members list.

For more info please refer Zerotier docs.

## Host Side setup

Following steps assume that you have ccache configured and tested working.

* macos

    * Install distcc using `brew install distcc`
    * For building from source ensure you run `./configure --without-libiberty` at configure step.
    * add following lines to your `~/.bash_profile`
    ```
    export DISTCC_HOSTS="<hostname or address>/<max number of jobs>,cpp,lzo"
    export CCACHE_PREFIX="distcc"
    ```
    * `DISTCC_HOSTS` is space separated list of supported servers.
    * you can add hostnames in `/etc/hosts` files for better management, the list shall contain all the servers setup using Server side setup.
    * Run build using `./waf <build-target> -j$(distcc -j)`

* ubuntu

    * Install distcc using `sudo apt-get install distcc`
    * add following lines to your `~/.bashrc`
    ```
    export DISTCC_HOSTS="<hostname or address>/<max number of jobs>,cpp,lzo"
    export CCACHE_PREFIX="distcc"
    ```
    * `DISTCC_HOSTS` is space separated list of supported servers.
    * you can add hostnames in `/etc/hosts` files for better management, the list shall contain all the servers setup using Server side setup.
    * For better monitoring a tool called `distccmon-gnome` can be installed `sudo apt-get install distccmon-gnome`
    * Run build using `./waf <build-target> -j$(distcc -j)`

## Additional Notes

Following are the key points one can play with to come up with optimised setup:

* If you want to push every part of compilation to remote server including preprocessing one can use `pump ./waf <build-target> -j$(distcc -j)`. This can be very handy when your local machine is very slow, and you have a significant bandwidth to the remote server.

* For debugging on server side you can run the docker in interactive mode like this:
`docker run -it -p 3632:3632 -p 3633:3633 ardupilot/ardupilot-dev-distccd --jobs <Max number of jobs>`

* For debugging on host side simply `export DISTCC_VERBOSE=1`

* There is no ccache on the server side docker, so as to limit the storage consumption on the remote machine. But your local ccache will still be in play even when using `pump`. If one wants, they can create a copy of docker with ccache setup, it should be trivial.

* Please set `--jobs` to be `CPU_COUNT + 2` by default docker allocates 5 jobs. Other parameters available are `--nice` and `--allow`

* When using remote TCP/IP setup ensure that firewall is setup correctly to stop access to distcc port outside of your private network.

* You can also simplify you waf command by declaring something like this in your bashrc/bash_profile:
```
waf() {
  pump ./waf -j$(distcc -j) $@
}
```

* To monitor server side status you can open http page `http://<server-ip/name>:3633` if server is healthy and working the counts should increase.