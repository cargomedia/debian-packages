Vagrant.configure('2') do |config|

  config.vm.provision 'shell', inline: [
    'sudo apt-get install -y build-essential debhelper devscripts dh-make unp equivs',
    'sudo apt-get install -y reprepro s3cmd',
  ].join(' && ')

  config.vm.provision 'shell', inline: [
    'sudo apt-get install -y gnupg gnupg-agent',
    'sudo gpg --list-keys', # initialize config-file
    'sudo sed -i -e "s/#\s*\(use-agent\)/\1/" ~/.gnupg/gpg.conf', # Enable agent
  ].join(' && ')

  config.vm.provision 'shell', inline: [
    'sudo gpg --import /vagrant/keys/public.key /vagrant/keys/private.key',
    'cp /vagrant/keys/public.key /vagrant/repo/conf/signing.key'
  ].join(' && ')

  config.vm.define 'wheezy' do |wheezy|
    wheezy.vm.box = 'cargomedia/debian-7-amd64-plain'
  end

  config.vm.define 'vivid' do |vivid|
    vivid.vm.box = 'cargomedia/ubuntu-1504-default'
  end
end
