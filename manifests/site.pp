node default {
  file {'/root/README':
    ensure  => file,
    content => "Welcome to ${fqdn} of type ${os.type}",
    owner   => 'root',
    }
}
node 'pluto.universe' {
  include role::master_server
}
node /^web/ {
  include role::app_server
}
node /^db/ {
  include role::db_server
}
