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
}
