#
# Cookbook Name:: gvm
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

%w(bison curl git).each do |pkg|
  package pkg do
    action :install
  end
end

bash 'install gvm' do
  user node['gvm']['user']
  group node['gvm']['group']
  cwd node['gvm']['home']
  environment('HOME' => node['gvm']['home'])
  code <<-BASH
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
  BASH
  creates "#{node['gvm']['home']}/.gvm/scripts/gvm"
end

bash 'install go1.4.2' do
  user node['gvm']['user']
  group node['gvm']['group']
  code <<-BASH
    source #{node['gvm']['home']}/.gvm/scripts/gvm
    gvm install go1.4.2
  BASH
  creates "#{node['gvm']['home']}/.gvm/gos/go1.4.2"
end

# go1.5 require another go to bootstrap it
bash 'install go1.5' do
  user node['gvm']['user']
  group node['gvm']['group']
  code <<-BASH
    source #{node['gvm']['home']}/.gvm/scripts/gvm
    export GOROOT_BOOTSTRAP=#{node['gvm']['home']}/.gvm/gos/go1.4.2
    gvm install go1.5
    gvm use go1.5 --default
  BASH
  creates "#{node['gvm']['home']}/.gvm/gos/go1.5"
end

file "#{node['gvm']['home']}/.bash_profile" do
  content '[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"'
  owner node['gvm']['user']
  group node['gvm']['group']
  mode 0755
end
