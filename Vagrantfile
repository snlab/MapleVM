# This Vagrantfile installs a CENTOS VM and configures the network adapter.
# This Vagrantfile does not install perfSONAR
# TODO: include shell scripts to install and configure perfSONAR level-1 package

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "box-cutter/ubuntu1404-desktop" # 

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  #config.vm.network "private_network", type: "dhcp"
  config.vm.network "private_network", ip: "192.168.56.10", :netmask => "255.255.255.0"
  # config.vm.network "private_network", ip: "192.168.1.100", :netmask => "255.255.255.0"
  # config.vm.network "private_network", ip: "192.168.56.100", :netmask => "255.255.255.0"
  
  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
  
  config.vm.provider "virtualbox" do |vb|
      vb.cpus = 2
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
  end

  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :shell, :path => "bootstrap-maple.sh"  
  # config.vm.provision :shell, :path => "normal.sh", privileged: false
end
