# Filebeat config
class beats::filebeat::config{

  $shipper_data_template = {
    shipper => {
      ignore_outgoing       => true,
      name                  => $::fqdn,
      refresh_topology_freq => '10',
    }
  }
  $shipper= deep_merge($shipper_data_template, $beats::shipper_data)
  $prospectors = $beats::filebeat::prospectors
  $outputs = $beats::filebeat::outputs

  $filebeat_conf = merge($prospectors,$outputs,$shipper)

  file {'/etc/filebeat/filebeat.yml':
    ensure  => present,
    content => inline_template('<%= @filebeat_conf.to_yaml %>'),
    }
}
