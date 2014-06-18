debian-packages
===============
Custom debian packages

Installing the packages
-----------------------

Add to your `sources.list`:
```
deb http://debian-packages.cargomedia.ch wheezy main
```

Development
-----------

For signing the repo, the vagrant-provisioner will look for keys in `keys/{private,public},key`.
Alternatively you might want to create new keys:

### Creating a signing key
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
