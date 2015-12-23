define beats::filebeat::prospector(
  $paths                 = [],
  $fields                = {},
  $encoding              = 'plain',
  $input_type            = 'log',
  $ignore_older          = '24h',
  $document_type         = 'log',
  $scan_frequency        = '10s',
  $harvester_buffer_size = '16384',
  $tail_files            = true,
  $backoff               = '1s',
  $max_backoff           = '10s',
  $backoff_factor        = '2',
  $partial_line_waiting  = '5s',
  $force_close_files     = false,
){
  concat::fragment {"prospector-$title":
    target  => '/etc/filebeat/filebeat.yml',
    content => template('beats/filebeat/prospector.yml.erb'),
    order   => 15,
    notify  => Service['filebeat'],
  }
}