require 'spec_helper'

describe 'beats' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "beats class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('beats') }
          it { is_expected.to contain_class('beats::package') }
          it { is_expected.to contain_class('beats::config') }
          it { is_expected.to contain_class('beats::package').that_comes_before('beats::config') }
          #it { is_expected.to contain_class('beats::service').that_subscribes_to('beats::filebeat') }

          it { is_expected.to contain_file('/etc/beats/').with({
              'ensure' => 'directory',
              'owner'  => 'root',
              'mode'   => '0755',
              'owner'  => 'root',
            })
          }

          #it { is_expected.to contain_service('beats') }
          #it { is_expected.to contain_package('apachetop').with_ensure('installed') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'beats class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('beats') }.to raise_error(Puppet::Error, /Solaris not supported yet/) }
    end
  end
end
