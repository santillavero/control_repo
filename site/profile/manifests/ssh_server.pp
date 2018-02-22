class profile::ssh_server {
  package {'openssh-server':
    ensure => present.
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@pluto.universe':
    ensure => present,
    user => 'root',
    type => 'ssh-rsa',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDS840DKbSwt1AtpytMAkhMOgzWsOYM8L4grw9fToWqNxMltmuhc5McunzdBG47+XgSbGUSs9WdCGve5VrEK7VtDDRxRsy51wZwNhg5xCVIiGdMlN+Uhxo4cxuH8fmjtXhP+DGEMFLdXBElf7kp6rV/Aup1kl0zRt1ev/iJXtkwj/875SMX3BHVdirVAmXF0KbZFpFE0KRL//8MPZM88v70TcCRF4RkeyyJ4cBRDLBrCFK/UAhRiQA547WOo/GTBQ+CRvPf+q3D4ILVvcXOXq8qtRyVh+qNaQKUxJ5T3QbYm+Oiis/qZNpHCBaKuII75apGKMBw9qh6BId+BU9gdX4r',
  }
}
