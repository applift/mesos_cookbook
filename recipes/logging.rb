execute 'rsyslog' do
  command 'service rsyslog restart'
  user 'root'
  action :nothing
end

template '/etc/rsyslog.d/mesos.conf' do
  source 'mesos.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :run, 'execute[rsyslog]', :immediately
end

template '/etc/logrotate.d/mesos' do
  source 'mesos.logrotate.erb'
  owner 'root'
  group 'root'
  mode '0755'
end
