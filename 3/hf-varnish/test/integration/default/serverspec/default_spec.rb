require 'serverspec'

set :backend, :exec

describe package('varnish') do
  it { should be_installed }
end
