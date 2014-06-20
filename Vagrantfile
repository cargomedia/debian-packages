Vagrant.configure('2') do |config|
  config.vm.box = 'cargomedia/debian-7-amd64-plain'

  config.vm.provision 'shell', inline: [
    'sudo apt-get install -y build-essential debhelper devscripts dh-make unp',
    'sudo apt-get install -y reprepro s3cmd',
  ].join(' && ')

  config.vm.provision 'shell', inline: [
    'sudo apt-get install -y gnupg-agent',
    'sudo sed -i -e "s/#\s*\(use-agent\)/\1/" ~/.gnupg/gpg.conf',
  ].join(' && ')

  config.vm.provision 'shell', inline: [
    'sudo gpg --import /vagrant/keys/public.key',
    'sudo gpg --allow-secret-key-import /vagrant/keys/private.key',
    'cp /vagrant/keys/public.key /vagrant/repo/conf/signing.key'
  ].join(' && ')
end
