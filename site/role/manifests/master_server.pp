class role::master_server {
  include profile::base
  include profile::agent_nodes

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
