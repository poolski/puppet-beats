# Filebeat config
class beats::filebeat::config inherits beats::filebeat {
  beats::common::headers {'filebeat':}
  concat::fragment {'filebeat.header':
    target  => '/etc/filebeat/filebeat.yml',
    content => template('beats/filebeat/filebeat.yml.erb'),
    order   => 05,
  }
if $::prospectors {
  create_resources('::beats::filebeat::prospector', $::prospectors )
  }
}
