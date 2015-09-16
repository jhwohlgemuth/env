# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define 'web-server' do |server|
    server.vm.provider 'virtualbox' do |vb|
      vb.name = 'techtonic-web-server-' + Time.now.to_i.to_s
      vb.gui = false
    end
    server.vm.box = 'hashicorp/precise32'
    #server.vm.box_url = 'https://atlas.hashicorp.com/hashicorp/boxes/precise32'
    server.vm.network 'private_network', ip: '10.10.10.10'
    server.vm.synced_folder 'vault/', '/home/vagrant/vault'
    server.vm.synced_folder 'bin/', '/home/vagrant/bin'
    server.vm.provision 'shell', inline: $install_web_server
    server.vm.post_up_message = $message
  end
  config.vm.define 'db-server' do |db|
    config.vm.provider 'virtualbox' do |vb|
      vb.name = 'techtonic-db-server-' + Time.now.to_i.to_s
      vb.gui = false
    end
    db.vm.box = 'hashicorp/precise32'
    db.vm.network 'private_network', ip: '10.10.10.11'
    db.vm.synced_folder 'vault/', '/home/vagrant/vault'
    db.vm.synced_folder 'bin/', '/home/vagrant/bin'
    db.vm.network 'forwarded_port', guest: 5984, host: 5984, auto_correct: true
    db.vm.provision 'shell', path: 'bin/install_couchdb.sh'
  end
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
end

$message = <<MSG
░█░█░█▀▀░█▀▄
░█▄█░█▀▀░█▀▄
░▀░▀░▀▀▀░▀▀░
VM Name ---> web-server
IP --------> 10.10.10.10
MySQL Username: root
MySQL Password: 123

░█▀▄░█▀▄
░█░█░█▀▄
░▀▀░░▀▀░
VM Name ---> db-server
IP --------> 10.10.10.11
MSG

$install_web_server = <<WEB
  printf "Installing various items..."
  sudo apt-get update >/dev/null 2>&1
  sudo apt-get install -y make >/dev/null 2>&1
  sudo apt-get install -y figlet >/dev/null 2>&1
  sudo apt-get install -y toilet >/dev/null 2>&1
  sudo apt-get install -y curl >/dev/null 2>&1

  printf "Installing Google Chrome..."
  sudo apt-get install -y libxss1 libappindicator1 libindicator7 >/dev/null 2>&1
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt-get install -f
  sudo dpkg -i google-chrome*.deb

  sudo apt-get install -y gnome-session-flashback >/dev/null 2>&1
  printf "Installing Oh-My-Zsh..."
  sudo apt-get install -y zsh >/dev/null 2>&1
  sudo chsh -s $(which zsh)
  printf "Patching agnoster theme fonts..."
  wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf >/dev/null 2>&1
  wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf >/dev/null 2>&1
  mv PowerlineSymbols.otf ~/.fonts/
  fc-cache -vf ~/.fonts/
  mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

  printf "Installing JRE and JDK..."
  sudo apt-get update >/dev/null 2>&1
  sudo apt-get install -y default-jre >/dev/null 2>&1
  sudo apt-get install -y default-jdk >/dev/null 2>&1

  printf "Preparing to install node.js and npm..."
  curl -sL https://deb.nodesource.com/setup | sudo bash - >/dev/null 2>&1
  printf "Installing node.js and npm..."
  sudo apt-get install -y nodejs >/dev/null 2>&1

  printf "Installing Git..."
  sudo apt-get install -y git >/dev/null 2>&1

  printf "Installing LAMP stack..."
  sudo apt-get update >/dev/null 2>&1
  sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password 123'
  sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 123'
  sudo apt-get -y install lamp-server^ >/dev/null 2>&1

  printf "Creating symlink to /var/www..."
  sudo rm -rf /var/www
  sudo ln -fs /vagrant /var/www
  sudo a2enmod rewrite >/dev/null 2>&1
  sudo sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default >/dev/null 2>&1
  sudo service apache2 restart >/dev/null 2>&1
  # Fix 'Servername error'
  #printf "ServerName localhost" | sudo tee /etc/apache2/conf.d/fqdn >/dev/null 2>&1
  # Restart apache
  sudo service apache2 reload >/dev/null 2>&1

  printf "Installing Atom editor..."
  mkdir ~/git
  cd ~/git
  git clone https://github.com/atom/atom
  cd ~/git/atom
  git fetch -p
  git checkout $(git describe --tags `git rev-list --tags --max-count=1`)
  script/build
  sudo script/grunt install
WEB