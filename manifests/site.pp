# Default nodes (anything not mentioned below!)
node default {
}

# Master Server
node 'pluto.universe' {
  include role::master_server
  file {'/root/README':
    ensure  => file,
    content => "Welcome to ${fqdn} of type ${family}\n",
    owner   => 'root',
  }
  file {'/root/INTRO':
    ensure  => file,
    content => "Welcome to ${fqdn} of type ${family}\n",
  }
}

# All webservers
node /^web/ {
  include role::app_server
}

# All database servers
node /^db/ {
  include role::db_server
}
