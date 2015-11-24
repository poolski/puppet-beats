class beats::packetbeat::config(
  $ensure               = present,
  $interfaces           = 'any',
  $int_snaplen          = undef,
  $int_sniffer_type     = undef,
  $int_buffer_size      = undef,
  $http_enabled         = true,
  $mysql_enabled        = false,
  $pgsql_enabled        = false,
  $http_ports           = ['80', '8080', '8000'], 
  $http_hide_keywords   = [],
  $http_send_headers    = ['Host', 'Cookie'],
  $http_split_cookie    = true,
  $http_real_ip_header  = 'X-Forwarded-For',
  $http_redact_authorization = false,
  $mysql_protocol       = 'mysql',
  $mysql_ports          = ['3306'],
  $mysql_max_rows       = undef,
  $mysql_max_row_length = undef,
  $pgsql_protocol       = 'pgsql',
  $pgsql_ports          = ['5432'],
  $pgsql_max_rows       = undef,
  $pgsql_max_row_length = undef,
){
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
}