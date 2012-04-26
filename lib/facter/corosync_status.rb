# Oh, hai. This fact is used to get around http://projects.puppetlabs.com/issues/7165
Facter.add(:corosync_status) do
  setcode do
    if File.exists?('/etc/init.d/corosync') && `service corosync status` =~ /running/
      'running'
    else
      'stopped'
    end
  end
end
