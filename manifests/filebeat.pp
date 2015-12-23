class beats::filebeat (
  $ensure        = present,
  $idle_timeout  = '5s',
  $prospectors   = {},
  $registry_file = '/var/lib/filebeat/registry',
  $spool_size    = '1024',
){

  beats::common::headers {'filebeat':}
  concat::fragment {'filebeat.header':
    target  => '/etc/filebeat/filebeat.yml',
    content => template('beats/filebeat/filebeat.yml.erb'),
    order   => 05,
  }

  include ::apt::update

  package {'filebeat':
    ensure => $ensure,
    require => Class['apt::update']
  }
  service { 'filebeat':
    ensure => running,
    enable => true,
  }
  if ($prospectors.empty? == false) { create_resources('::beats::filebeat::prospector', $prospectors ) }

  Package['filebeat'] -> Concat::Fragment['filebeat.header'] ~> Service['filebeat']
}