class beats::config() {
  file { '/etc/beats/':
    ensure => 'directory',
    group  => 'root',
    mode   => '0755',
    owner  => 'root',
  }
  create_resources('beats::outputs::logstash', $beats::outputs_logstash)
  create_resources('beats::outputs::elasticsearch', $beats::outputs_elasticsearch)
  create_resources('beats::outputs::file', $beats::outputs_file)
}
