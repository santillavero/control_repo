class profile::minecraft {
  class {'minecraft':
    install_dir => '/srv/minecraft',
    minecraft_world => 'Universe',
    minecraft_port => 25565,
    minecraft_seed => '',
    fqdn=> 'Minecraft'    
  }
}
