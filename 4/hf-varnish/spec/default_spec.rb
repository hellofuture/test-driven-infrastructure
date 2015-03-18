require 'chefspec'

describe 'hf-varnish::default' do
  %w(12.04 14.04).each do |version|
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: version)
    end

    it 'should install the varnish package' do
      chef_run.converge(described_recipe)
      expect(chef_run).to install_package('varnish')
    end
  end
end
