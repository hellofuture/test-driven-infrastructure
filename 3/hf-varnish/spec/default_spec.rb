require 'chefspec'

describe 'hf-varnish::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04')
  end

  it 'should install the varnish package' do
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('varnish')
  end
end
