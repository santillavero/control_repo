node default {
}

node 'pluto.universe' {
  include role::master_server
  file {'/root/README':
    ensure  => file,
    content => "Welcome to ${fqdn} of type ${os.family}\n",
    owner   => 'root',
  }
  file {'/root/INTRO':
    ensure  => file,
    content => "Welcome to ${fqdn} of type ${os.family}\n",
  }
}

node /^web/ {
  include role::app_server
}

node /^db/ {
  include role::db_server
}
