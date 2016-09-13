# vagrant configure
Vagrant.configure(2) do |config|
  # select the box
  config.vm.box = 'ubuntu/trusty64'

  # should we ask about box updates?
  config.vm.box_check_update = false

  config.vm.provider 'virtualbox' do |vb|
    # machine cpus count
    vb.cpus = 1
    # machine memory size
    vb.memory = 512
    # machine name (for VirtualBox UI)
    vb.name = "sphann-box"
  end

  # machine name (for vagrant console)
  config.vm.define "sphann-box"

  # machine name (for guest machine console)
  config.vm.hostname = "sphann-box"

  # network settings
  config.vm.network 'private_network', ip: "192.168.83.101"

  # sync: folder 'intelliad_services' (host machine) -> folder '/app' (guest machine)
  config.vm.synced_folder './', '/app', owner: 'vagrant', group: 'vagrant'

  # disable folder '/vagrant' (guest machine)
  config.vm.synced_folder '.', '/vagrant', disabled: true

  # hosts settings (host machine)
  config.vm.provision :hostmanager
  config.hostmanager.enabled            = true
  config.hostmanager.manage_host        = true
  config.hostmanager.ignore_private_ip  = false
  config.hostmanager.include_offline    = true
  config.hostmanager.aliases            = "sphann-box"

  # provisioners
  config.vm.provision 'shell', path: './vagrant/provision/once-as-root.sh', args: ["Europe/Berlin"]
  config.vm.provision 'shell', path: './vagrant/provision/once-as-vagrant.sh', args: [], privileged: false

  # post-install message (vagrant console)
  config.vm.post_up_message = "Ready to run!"
end
