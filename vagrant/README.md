Demo
====

ONAP demo is created by vagrant. It is verified to work in Ubuntu 16.04 64bit
with 125G memory & 1T disk.

Setup
-----

./run_demo.sh

or

```
sudo apt-get install -y build-essential linux-headers-`uname -r`
sudo apt-get install -y virtualbox
ver=$(apt-cache policy vagrant | grep Installed | cut -d ':' -f 3)
if [[ "$ver" != "2.0.3" ]]; then
    wget --no-check-certificate https://releases.hashicorp.com/vagrant/2.0.3/vagrant_2.0.3_x86_64.deb
    sudo dpkg -i vagrant_2.0.3_x86_64.deb
fi
```

Bring up OpenStack and ONAP
-------

vagrant up

Cleanup
-------

vagrant destroy -f

Proxy
-----

Proxy setup is optional. If setup is behind sock5 proxy, SOCKS5_IP, SOCKS5_PORT
and DNS_SERVER is updated and ./setup_proxy is run before running demo.
