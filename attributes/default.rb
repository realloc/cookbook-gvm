default['gvm']['user'] = 'vagrant'
default['gvm']['group'] = node['gvm']['user']
default['gvm']['home'] = "/home/#{node['gvm']['user']}"
