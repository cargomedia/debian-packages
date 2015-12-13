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
#### wheezy

**gearmand**
 - Version: 1.1.12 (unstable)
 - Packages: libgearman7, libgearman-dev, libgearman7-dbg, libgearman-doc, gearman-job-server, gearman-tools, gearman
 - Debianization via: https://github.com/ssm/pkg-gearmand/

**arcconf**
 - Version: 2.00.21811
 - Packages: arcconf

**storcli**
 - Version: 1.17.08
 - Packages: storcli

**mysql-proxy**
 - Version: 0.8.4
 - Packages: mysql-proxy
 - Debianization via: https://packages.debian.org/wheezy/mysql-proxy

#### vivid

**gstreamer**
 - Version: 1.6.1
 - Packages: gir1.2-gstreamer-1.0, gstreamer1.0-doc, gstreamer1.0-tools, libgstreamer1.0-0, libgstreamer1.0-0-dbg, libgstreamer1.0-dev
 - Debianization via: http://packages.ubuntu.com/source/xenial/gstreamer1.0

**orc**
 - Version: 0.4.24
 - Packages: liborc-0.4-0-dbg_0.4.24 liborc-0.4-dev_0.4.24 liborc-0.4-0_0.4.24 liborc-0.4-doc_0.4.24
 - Debianization via: http://packages.ubuntu.com/source/xenial/orc

**gst-plugins-base**
 - Version: 1.6.1
 - Packages: gir1.2-gst-plugins-base-1.0_1.6.1 gstreamer1.0-alsa_1.6.1 gstreamer1.0-plugins-base-apps_1.6.1 gstreamer1.0-plugins-base-dbg_1.6.1 gstreamer1.0-plugins-base-doc_1.6.1 gstreamer1.0-plugins-base_1.6.1 gstreamer1.0-x_1.6.1 libgstreamer-plugins-base1.0-0_1.6.1 libgstreamer-plugins-base1.0-dev_1.6.1
 - Debianization via: http://packages.ubuntu.com/xenial/libgstreamer-plugins-base1.0-dev

**gst-plugins-ugly**
 - Version: 1.6.1
 - Packages: gstreamer1.0-plugins-ugly-amr_1.6.1 gstreamer1.0-plugins-ugly-dbg_1.6.1 gstreamer1.0-plugins-ugly-doc_1.6.1 gstreamer1.0-plugins-ugly_1.6.1
 - Debianization via: http://packages.ubuntu.com/source/xenial/gst-plugins-ugly1.0

**gst-plugins-good**
 - Version: 1.6.1
 - Packages: gstreamer1.0-plugins-good-dbg_1.6.1 gstreamer1.0-plugins-good-doc_1.6.1 gstreamer1.0-plugins-good_1.6.1 gstreamer1.0-pulseaudio_1.6.1 libgstreamer-plugins-good1.0-0_1.6.1 libgstreamer-plugins-good1.0-dev_1.6.1
 - Debianization via: http://packages.ubuntu.com/source/xenial/gst-plugins-good1.0

**gstreamer1.0-libav**
 - Version: 1.6.1
 - Packages: gstreamer1.0-libav_1.6.1-1_amd64, gstreamer1.0-libav-dbg_1.6.1-1_amd64
 - Built from http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-2.8.3.tar.xz

**arcconf**
 - Version: 2.00.21811
 - Packages: arcconf

**storcli**
 - Version: 1.17.08
 - Packages: storcli

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
