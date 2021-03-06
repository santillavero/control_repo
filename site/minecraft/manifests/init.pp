# NEW init.pp

class minecraft (
  $url='https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
  $install_dir='/opt/minecraft',
  $minecraft_world='Universe',
  $minecraft_port=25565,
  $minecraft_seed='',
  $fqdn=$facts['fqdn']
){
  file {$install_dir:
    ensure => directory,
  }
  file {"${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,    
  }
  file {"${install_dir}/eula.txt":
    ensure => present,
    content => 'eula=true',
  }
  file {"${install_dir}/server.properties":
    ensure => file,
    content => epp('minecraft/server.properties',{
      minecraft_world => $minecraft_world,
      minecraft_port => $minecraft_port,
      minecraft_seed => $minecraft_seed,
      fqdn => $fqdn
    }),
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service',{
      install_dir => $install_dir
    }),
  }
  file {"${install_dir}/start.sh":
    ensure => file,
    content => epp('minecraft/start.sh',{
      install_dir => $install_dir
    }),
  }  
  service {'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service'],File["${install_dir}/server.properties"]],
  }
}
