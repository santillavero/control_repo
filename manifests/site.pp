node default {
  file {'/root/README':
    ensure  => file,
    content => 'This is a readme',
    owner   => 'root',
    }
}
node 'pluto.universe' {
  include role::master_server
}
