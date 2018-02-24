class minecraft (
  $url='https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
  $install_dir='/opt/minecraft'
}{
  file {'/opt/minecraft':
    ensure => directory,
  }
  file {"${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
  }
  package {'java':
    ensure => present,
  }
  file {"${install_dir}/eula.txt":
    ensure => present,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service',{
    install_dir => ${install_dir}
    })
  }
  service {'minecraft':
    ensure => running,
    enable => true,
  }
}
