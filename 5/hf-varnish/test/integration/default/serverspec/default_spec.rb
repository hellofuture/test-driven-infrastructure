require 'serverspec'

set :backend, :exec

puts os[:family]

describe package('varnish-release'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('varnish') do
  it { should be_installed }
end
