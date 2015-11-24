class beats::packetbeat::config inherits beats::packetbeat () {
  beats::common::headers {'packetbeat':}
  concat::fragment {'packetbeat.header':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/packetbeat/packetbeat.yml.erb'),
    order   => 05,
  }
  concat::fragment {'protocols.header':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/protocols.header.erb'),
    order   => 10,
  }
  if $http_enabled { include ::beats::protocols::http }
  if $mysql_enabled { include ::beats::protocols::mysql }
  if $pgsql_enabled { include ::beats::protocols::pgsql }

  # Setup index template:
  exec { 'index-template':
    command => "/usr/bin/curl -XPUT 'http://${beats::es_host}:${beats::es_port}/_template/packetbeat' -d@/etc/packetbeat/packetbeat.template.json",
    unless  => ["/usr/bin/curl -sqI -XGET http://${beats::es_host}:${beats::es_port}/_template/packetbeat|grep 200"]
  }
  # outputs
  if has_key($outputs, 'elasticsearch') {
    beats::outputs::elasticsearch {$title:}
  }
  if has_key($outputs, 'logstash') {
    beats::outputs::logstash {$title:}
  }
}