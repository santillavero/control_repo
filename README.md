# control_repo
1. Install the RPM repository (see the puppet web page)
rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm

2. Yum install puppetserver
yum install -y puppetlabs

3. Start the service!
systemctl start puppetserver
systemctl enable puppetserver

4. Add the master
vi /etc/puppetlabs/puppet/puppet.conf

[agent]
server = <hostname_of_puppetserver>

5. Install r10k
gem install r10k

6. Run puppet!
puppet agent -t

7. r10k config /etc/puppetlabs/r10k/r10k.yaml with

---
:cachedir: '/var/cache/r10k'

:sources:
	:my-org:
		remote: 'https://github.com/santillavero/control_repo.git'
		basedir: '/etc/puppetlabs/code/environments'

8. Run r10k
r10k deploy environment -p

# Adding a client
1. On the client, install puppet agent (this will fail, because there are no signed certs)
2. On the puppet master accept the new cert with
puppet cert sign <host> | --all
