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

  context 'RedHat/CentOS 6 operaton system' do
    describe 'beats class without any parameters on RedHat/CentOS 6' do
       let (:facts) {{
         :osfamily                  => 'RedHat',
         :operatingsystem           => 'RedHat',
         :operatingsystemmajrelease => '6',
         :architecture              => 'x86_64',
       }}
       it {
         is_expected.to contain_class('beats::repo::yum')
         is_expected.to contain_class('beats::repo::yum').that_comes_before('beats::package')

         is_expected.to contain_package('GeoIP').with_ensure('latest')
         is_expected.to contain_package('libpcap').with_ensure('installed')
       }
    end
  end

  context 'Debian operation system' do
    describe 'beats class without any parameters on Debian' do
       let (:facts) {{
         :osfamily                  => 'Debian',
         :lsbdistid                 => 'Debian'
       }}
       it {
         is_expected.to contain_class('beats::repo::apt')
         is_expected.to contain_class('beats::repo::apt').that_comes_before('beats::package')

         is_expected.to contain_package('geoip-database-contrib').with_ensure('latest')
         is_expected.to contain_package('apt-transport-https').with_ensure('latest')
         is_expected.to contain_package('libpcap0.8').with_ensure('installed')
       }
    end
  end

  context 'Ubuntu operation system' do
    describe 'beats class without any parameters on Ubuntu' do
       let (:facts) {{
         :osfamily                  => 'Debian',
         :lsbdistid                 => 'Ubuntu'
       }}
       it {
         is_expected.to contain_class('beats::repo::apt')
         is_expected.to contain_class('beats::repo::apt').that_comes_before('beats::package')

         is_expected.to contain_package('geoip-database-contrib').with_ensure('latest')
         is_expected.to contain_package('apt-transport-https').with_ensure('latest')
         is_expected.to contain_package('libpcap0.8').with_ensure('installed')
       }
    end
  end

end

