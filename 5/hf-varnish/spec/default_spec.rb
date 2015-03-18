require 'chefspec'

platforms = {
  'ubuntu' => %w(12.04 14.04),
  'centos' => %w(6.6)
}

describe 'hf-varnish::default' do
  platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform}-#{version}" do
        let(:chef_run) do
          ChefSpec::SoloRunner.new(platform: platform, version: version,
                                   file_cache_path: '/tmp')
        end

        if platform == 'centos'
          it 'should download the repo rpm' do
            chef_run.converge(described_recipe)
            expect(chef_run).to create_remote_file_if_missing('/tmp/varnish-3.0.rpm')
          end

          it 'should install the rpm' do
            chef_run.converge(described_recipe)
            expect(chef_run).to install_rpm_package('varnish-rpm')
          end
        end

        it 'should install the varnish package' do
          chef_run.converge(described_recipe)
          expect(chef_run).to install_package('varnish')
        end
      end
    end
  end
end
