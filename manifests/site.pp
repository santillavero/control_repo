# Default nodes (anything not mentioned below!)
node default {
}

# Master Server
node 'pluto.universe' {
  include role::master_server
  include role::minecraft_server
  file {'/root/README':
    ensure  => file,
    content => "Welcome to ${fqdn} ${processors[count]} CPU\n",
    owner   => 'root',
  }
  file {'/root/INTRO':
    ensure  => file,
    content => "Welcome to ${fqdn} of type ${os[architecture]}\n",
  }
}

# Minecraft
node 'minetest.puppet.vm' {
  include role::minecraft_server
}

# All webservers
node /^web/ {
  include role::app_server
}

# All database servers
node /^db/ {
  include role::db_server
 
 # We do this here ... normally we wouldn't!
 include stdlib
   file_line { 'r1adm1prd':
     path  => '/etc/hosts',
     line  => '10.8.17.165 r1adm1prd r1adm1prd.medibank.local',
     match => '10.8.17.165*',
   }
}
