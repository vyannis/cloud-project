# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "srv-ansible" do |machine|
      machine.vm.hostname = "srv-ansible"
      machine.vm.box = "geerlingguy/centos7"
      machine.vm.box_check_update = false
      machine.vm.network "private_network", ip: "192.168.56.81"
      # machine.vm.network :public_network, bridge: "eno1", ip: "192.168.1.8", use_dhcp_assigned_default_route: true
      # config.vm.provision "shell",
      #   run: "always",
      #   inline: "ip route del default via 10.0.2.2 || true"
      # config.vm.provision "shell",
      #   run: "always",
      #   inline: "ip route add default via 192.168.1.1"
      machine.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--name", "srv-ansible"]
        v.customize ["modifyvm", :id, "--groups", "/S8-cloud"]
        v.customize ["modifyvm", :id, "--cpus", "1"]
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
      end
      machine.vm.provision "shell", path: "install_ansible.sh"
    end
  end