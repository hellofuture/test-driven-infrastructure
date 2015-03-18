require 'serverspec'

set :backend, :exec

describe package('varnish-release'), :if => os[:platform] == 'centos' do
  it { should be_installed }
end

describe package('varnish') do
  it { should be_installed }
end
