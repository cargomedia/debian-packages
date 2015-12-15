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
 - Packages: gstreamer1.0-plugins-good-dbg_1.6.1-1ubuntu1_amd64.deb, libgstreamer-plugins-good1.0-dev_1.6.1-1ubuntu1_amd64.deb, gstreamer1.0-pulseaudio_1.6.1-1ubuntu1_amd64.deb, gstreamer1.0-plugins-good_1.6.1-1ubuntu1_amd64.deb, gstreamer1.0-plugins-good-doc_1.6.1-1ubuntu1_all.deb, libgstreamer-plugins-good1.0-0_1.6.1-1ubuntu1_amd64.deb, 

**graphene**
 - Version: 1.2.10-1
 - Packages: graphene_1.2.10-1_amd64.deb, 

**arcconf**
 - Version: 2.00.21811-vivid1
 - Packages: arcconf_2.00.21811-vivid1_amd64.deb, 

**gst-plugins-ugly1.0**
 - Version: 1.6.1-1ubuntu1
 - Packages: gstreamer1.0-plugins-ugly-dbg_1.6.1-1ubuntu1_amd64.deb, gstreamer1.0-plugins-ugly_1.6.1-1ubuntu1_amd64.deb, gstreamer1.0-plugins-ugly-doc_1.6.1-1ubuntu1_all.deb, gstreamer1.0-plugins-ugly-amr_1.6.1-1ubuntu1_amd64.deb, 

**janus**
 - Version: 0.0.9-1
 - Packages: janus_0.0.9-1_amd64.deb, 

**libsrtp**
 - Version: 1.5.3
 - Packages: libsrtp_1.5.3_amd64.deb, 

**janus-gateway-rtpbroadcast**
 - Version: 0.0.2-ubuntu1
 - Packages: janus-gateway-rtpbroadcast_0.0.2-ubuntu1_amd64.deb, 

**usrsctp**
 - Version: 49335e1-git
 - Packages: usrsctp_49335e1-git_amd64.deb, 

**gst-plugins-bad1.0**
 - Version: 1.6.1-1ubuntu1
 - Packages: gstreamer1.0-plugins-bad-faad_1.6.1-1ubuntu1_amd64.deb, libgstreamer-plugins-bad1.0-dev_1.6.1-1ubuntu1_amd64.deb, libgstreamer-plugins-bad1.0-0_1.6.1-1ubuntu1_amd64.deb, gstreamer1.0-plugins-bad-dbg_1.6.1-1ubuntu1_amd64.deb, gir1.2-gst-plugins-bad-1.0_1.6.1-1ubuntu1_amd64.deb, gstreamer1.0-plugins-bad-videoparsers_1.6.1-1ubuntu1_amd64.deb, gstreamer1.0-plugins-bad-doc_1.6.1-1ubuntu1_all.deb, gstreamer1.0-plugins-bad_1.6.1-1ubuntu1_amd64.deb, 

**janus-gateway-audioroom**
**gstreamer1.0**
 - Version: 1.6.1-1
 - Packages: libgstreamer1.0-dev_1.6.1-1_amd64.deb, libgstreamer1.0-0_1.6.1-1_amd64.deb, gstreamer1.0-tools_1.6.1-1_amd64.deb, gstreamer1.0-doc_1.6.1-1_all.deb, gir1.2-gstreamer-1.0_1.6.1-1_amd64.deb, libgstreamer1.0-0-dbg_1.6.1-1_amd64.deb, 

**gst-libav1.0**
 - Version: 1.6.1-1
 - Packages: gstreamer1.0-libav_1.6.1-1_amd64.deb, 

**gst-entrans**
 - Version: 1.0.3-1
 - Packages: gst-entrans_1.0.3-1_amd64.deb, 

**sas2ircu**
 - Version: 20.00.00.00-vivid1
 - Packages: sas2ircu_20.00.00.00-vivid1_amd64.deb, 

**gst-plugins-base1.0**
 - Version: 1.6.1-1ubuntu1
 - Packages: gstreamer1.0-plugins-base-apps_1.6.1-1ubuntu1_amd64.deb, gstreamer1.0-plugins-base_1.6.1-1ubuntu1_amd64.deb, libgstreamer-plugins-base1.0-dev_1.6.1-1ubuntu1_amd64.deb, gstreamer1.0-x_1.6.1-1ubuntu1_amd64.deb, gir1.2-gst-plugins-base-1.0_1.6.1-1ubuntu1_amd64.deb, gstreamer1.0-plugins-base-doc_1.6.1-1ubuntu1_all.deb, gstreamer1.0-alsa_1.6.1-1ubuntu1_amd64.deb, gstreamer1.0-plugins-base-dbg_1.6.1-1ubuntu1_amd64.deb, libgstreamer-plugins-base1.0-0_1.6.1-1ubuntu1_amd64.deb, 

**orc**
 - Version: 1:0.4.24-1
 - Packages: liborc-0.4-dev_0.4.24-1_amd64.deb, liborc-0.4-doc_0.4.24-1_all.deb, liborc-0.4-0-dbg_0.4.24-1_amd64.deb, liborc-0.4-0_0.4.24-1_amd64.deb, 

**storcli**
 - Version: 1.17.08-vivid1
 - Packages: storcli_1.17.08-vivid1_amd64.deb, 

**hpacucli**
 - Version: 9.40.12.0-vivid1
 - Packages: hpacucli_9.40.12.0-vivid1_amd64.deb, 

**libwebsockets**
 - Version: 1.2.2-1
 - Packages: libwebsockets3-dbg_1.2.2-1_amd64.deb, libwebsockets-test-server_1.2.2-1_amd64.deb, libwebsockets-dev_1.2.2-1_amd64.deb, libwebsockets3_1.2.2-1_amd64.deb, 

#### wheezy

**arcconf**
 - Version: 2.00.21811-wheezy1
 - Packages: arcconf_2.00.21811-wheezy1_amd64.deb, 

**janus**
 - Version: 0.0.9-wheezy1
 - Packages: janus_0.0.9-wheezy1_amd64.deb, 

**libsrtp**
 - Version: 1.5.3-wheezy1
 - Packages: libsrtp_1.5.3-wheezy1_amd64.deb, 

**janus-gateway-rtpbroadcast**
 - Version: 0.0.2-wheezy1
 - Packages: janus-gateway-rtpbroadcast_0.0.2-wheezy1_amd64.deb, 

**usrsctp**
 - Version: 49335e1-git-wheezy1
 - Packages: usrsctp_49335e1-git-wheezy1_amd64.deb, 

**janus-gateway-audioroom**
**sas2ircu**
 - Version: 20.00.00.00-wheezy1
 - Packages: sas2ircu_20.00.00.00-wheezy1_amd64.deb, 

**storcli**
 - Version: 1.17.08-wheezy1
 - Packages: storcli_1.17.08-wheezy1_amd64.deb, 

**hpacucli**
 - Version: 9.40.12.0-wheezy1
 - Packages: hpacucli_9.40.12.0-wheezy1_amd64.deb, 

**libwebsockets**
 - Version: 1.5.0-wheezy1
 - Packages: libwebsockets-dev_1.5.0-wheezy1_amd64.deb, libwebsockets-test-server_1.5.0-wheezy1_amd64.deb, libwebsockets3-dbg_1.5.0-wheezy1_amd64.deb, libwebsockets3_1.5.0-wheezy1_amd64.deb, 

**gearmand**
 - Version: 1.1.12-1
 - Packages: libgearman-dbg_1.1.12-1_all.deb, libgearman-dev_1.1.12-1_amd64.deb, libgearman7_1.1.12-1_amd64.deb, libgearman7-dbg_1.1.12-1_amd64.deb, libgearman-doc_1.1.12-1_all.deb, gearman-tools_1.1.12-1_amd64.deb, gearman-job-server_1.1.12-1_amd64.deb, gearman_1.1.12-1_all.deb, 

**mysql-proxy**
 - Version: 0.8.4-2
 - Packages: mysql-proxy_0.8.4-2_amd64.deb, 




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
