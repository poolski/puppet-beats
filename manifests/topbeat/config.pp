# Configure topbeat class
class beats::topbeat::config inherits beats::topbeat {
  beats::common::headers {'topbeat':}
  concat::fragment {'topbeat.header':
    target  => '/etc/topbeat/topbeat.yml',
    content => template('beats/topbeat/topbeat.yml.erb'),
    order   => '06',
  }
}