# control_repo
1. Install the RPM repository (see the puppet web page)<BR>
<B>rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm</B>

2. Yum install puppetserver<BR>
<B>yum install -y puppetlabs</B>

3. Start the service!<BR>
<B>systemctl start puppetserver<BR>
systemctl enable puppetserver</B>

4. Add the master<BR>
<B>vi /etc/puppetlabs/puppet/puppet.conf
<BR><BR>
[agent]<BR>
server = <hostname_of_puppetserver></B>

5. Install r10k<BR>
<B>gem install r10k</B>

6. Run puppet!<BR>
<B>puppet agent -t</B>

7. r10k config /etc/puppetlabs/r10k/r10k.yaml with<BR>
<B>---<BR>
:cachedir: '/var/cache/r10k'<BR>
<BR>
:sources:<BR>
&nbsp;&nbsp;&nbsp;&nbsp;:my-org:<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;remote: 'GIT_URL_ADDRESS'<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;basedir: '/etc/puppetlabs/code/environments'<BR>
</PRE></B>
8. Run r10k<BR>
<B>r10k deploy environment -p</B>

# Adding a client
1. On the client, install puppet agent (this will fail, because there are no signed certs)<BR>
2. On the puppet master accept the new cert with<BR>
<B>puppet cert sign [ host_names | --all ]</B><BR>
