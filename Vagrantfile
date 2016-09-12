Vagrant.configure('2') do |config|

  config.librarian_puppet.puppetfile_dir = 'puppet'
  config.librarian_puppet.placeholder_filename = '.gitkeep'
  config.librarian_puppet.resolve_options = {:force => true}

  config.vm.provision :puppet do |puppet|
    puppet.environment_path = 'puppet/environments'
    puppet.environment = 'development'
    puppet.module_path = ['puppet/modules']
  end

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
    wheezy.vm.box = 'cargomedia/debian-7-amd64-default'
  end

  config.vm.define 'vivid' do |vivid|
    vivid.vm.box = 'cargomedia/ubuntu-1504-default'
  end

  config.vm.define 'jessie' do |jessie|
    jessie.vm.box = 'cargomedia/debian-8-amd64-default'
  end
end
