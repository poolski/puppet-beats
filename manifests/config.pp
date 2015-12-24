# Basic config common to all beats
class beats::config() {
  file { '/etc/beats/':
    ensure => 'directory',
    group  => 'root',
    mode   => '0755',
    owner  => 'root',
  }
  create_resources('beats::outputs::logstash', $beats::_outputs_logstash)
  create_resources('beats::outputs::elasticsearch', $beats::_outputs_elasticsearch)
  create_resources('beats::outputs::file', $beats::_outputs_file)
}
