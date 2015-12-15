debian-packages
===============
Custom DEB packages for the following codenames:
- **wheezy**: Debian 7
- **vivid**: Ubuntu 15.04

Installing the packages
-----------------------
Install signing key:
```
wget -O - http://debian-packages.cargomedia.ch/conf/signing.key | apt-key add -
```

Add to your `sources.list`:
```
deb http://debian-packages.cargomedia.ch <codename> main
```

Available packages
------------------

#### vivid

**gst-plugins-good1.0**
 - Version: 1.6.1-1ubuntu1
 - Packages: gstreamer1.0-plugins-good-dbg, libgstreamer-plugins-good1.0-dev, gstreamer1.0-pulseaudio, gstreamer1.0-plugins-good, gstreamer1.0-plugins-good-doc, libgstreamer-plugins-good1.0-0

**graphene**
 - Version: 1.2.10-1
 - Packages: graphene

**arcconf**
 - Version: 2.00.21811-vivid1
 - Packages: arcconf

**gst-plugins-ugly1.0**
 - Version: 1.6.1-1ubuntu1
 - Packages: gstreamer1.0-plugins-ugly-dbg, gstreamer1.0-plugins-ugly, gstreamer1.0-plugins-ugly-doc, gstreamer1.0-plugins-ugly-amr

**janus**
 - Version: 0.0.9-1
 - Packages: janus

**libsrtp**
 - Version: 1.5.3
 - Packages: libsrtp

**janus-gateway-rtpbroadcast**
 - Version: 0.0.1-1
 - Packages: janus-gateway-rtpbroadcast

**usrsctp**
 - Version: 49335e1-git
 - Packages: usrsctp

**gst-plugins-bad1.0**
 - Version: 1.6.1-1ubuntu1
 - Packages: gstreamer1.0-plugins-bad-faad, libgstreamer-plugins-bad1.0-dev, libgstreamer-plugins-bad1.0-0, gstreamer1.0-plugins-bad-dbg, gir1.2-gst-plugins-bad-1.0, gstreamer1.0-plugins-bad-videoparsers, gstreamer1.0-plugins-bad-doc, gstreamer1.0-plugins-bad

**janus-gateway-audioroom**
**gstreamer1.0**
 - Version: 1.6.1-1
 - Packages: libgstreamer1.0-dev, libgstreamer1.0-0, gstreamer1.0-tools, gstreamer1.0-doc, gir1.2-gstreamer-1.0, libgstreamer1.0-0-dbg

**gst-libav1.0**
 - Version: 1.6.1-1
 - Packages: gstreamer1.0-libav

**gst-entrans**
 - Version: 1.0.3-1
 - Packages: gst-entrans

**sas2ircu**
 - Version: 20.00.00.00-vivid1
 - Packages: sas2ircu

**gst-plugins-base1.0**
 - Version: 1.6.1-1ubuntu1
 - Packages: gstreamer1.0-plugins-base-apps, gstreamer1.0-plugins-base, libgstreamer-plugins-base1.0-dev, gstreamer1.0-x, gir1.2-gst-plugins-base-1.0, gstreamer1.0-plugins-base-doc, gstreamer1.0-alsa, gstreamer1.0-plugins-base-dbg, libgstreamer-plugins-base1.0-0

**orc**
 - Version: 1:0.4.24-1
 - Packages: liborc-0.4-dev, liborc-0.4-doc, liborc-0.4-0-dbg, liborc-0.4-0

**storcli**
 - Version: 1.17.08-vivid1
 - Packages: storcli

**hpacucli**
 - Version: 9.40.12.0-vivid1
 - Packages: hpacucli

**libwebsockets**
 - Version: 1.2.2-1
 - Packages: libwebsockets3-dbg, libwebsockets-test-server, libwebsockets-dev, libwebsockets3

#### wheezy

**arcconf**
 - Version: 2.00.21811-wheezy1
 - Packages: arcconf

**janus**
 - Version: 0.0.9-wheezy1
 - Packages: janus

**libsrtp**
 - Version: 1.5.3-wheezy1
 - Packages: libsrtp

**janus-gateway-rtpbroadcast**
 - Version: 0.0.2-wheezy1
 - Packages: janus-gateway-rtpbroadcast

**usrsctp**
 - Version: 49335e1-git-wheezy1
 - Packages: usrsctp

**janus-gateway-audioroom**
**sas2ircu**
 - Version: 20.00.00.00-wheezy1
 - Packages: sas2ircu

**storcli**
 - Version: 1.17.08-wheezy1
 - Packages: storcli

**hpacucli**
 - Version: 9.40.12.0-wheezy1
 - Packages: hpacucli

**libwebsockets**
 - Version: 1.5.0-wheezy1
 - Packages: libwebsockets-dev, libwebsockets-test-server, libwebsockets3-dbg, libwebsockets3

**gearmand**
 - Version: 1.1.12-1
 - Packages: libgearman-dbg, libgearman-dev, libgearman7, libgearman7-dbg, libgearman-doc, gearman-tools, gearman-job-server, gearman

**mysql-proxy**
 - Version: 0.8.4-2
 - Packages: mysql-proxy




Development
-----------
For signing the repo, the vagrant-provisioner will look for keys in `keys/{private,public}.key`.
Alternatively you might want to create new keys:

#### Creating a signing key
Create key:
```
gpg --gen-key
```

Export private and public key:
```
mkdir -p /vagrant/keys/
gpg --export -a 'Cargo Media' > /vagrant/keys/public.key
gpg --export-secret-key -a 'Cargo Media' > /vagrant/keys/private.key
```

#### Building a package
Start up the box and log in:
```
vagrant up <codename>
vagrant ssh <codename>
```

Build and test a package:
```
/vagrant/build.sh -c <codename> -p <package>
```

Bump version of a package:
```
cd /vagrant/packages/<codename>/<package>
dch -U
```

Build the repo and upload to S3:
```
sudo su
/vagrant/sync.sh
```
