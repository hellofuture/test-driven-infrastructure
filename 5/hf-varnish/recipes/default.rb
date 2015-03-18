#
# Cookbook Name:: hf-varnish
# Recipe:: default
#

if node['platform'] == 'centos'

  ver = node['platform_version'].to_i
  if ver == 6
    rpm_url = 'https://repo.varnish-cache.org/redhat/varnish-3.0.el6.rpm'
  else
    fail "#{ver} is an unsupported version of centos"
  end

  path = File.join(Chef::Config[:file_cache_path], '/varnish-3.0.rpm')

  remote_file path do
    source rpm_url
    action :create_if_missing
  end

  rpm_package 'varnish-rpm' do
    source rpm_url
    action :install
  end
end

package 'varnish' do
  action :install
end
