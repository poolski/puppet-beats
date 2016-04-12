# Define::filebeat::prospector
# Creates prospectors for filebeat
define beats::filebeat::prospector (
  $paths                 = [],
  $fields                = {},
  $encoding              = undef,
  $ignore_older          = undef,
  $scan_frequency        = undef,
  $harvester_buffer_size = undef,
  $tail_files            = true,
  $backoff               = undef,
  $max_backoff           = undef,
  $backoff_factor        = undef,
  $partial_line_waiting  = undef,
  $force_close_files     = false,
)
{
concat::fragment {"prospector-${title}":
  target  => '/etc/filebeat/filebeat.yml',
  content => template('beats/filebeat/prospector.yml.erb'),
  order   => 17,
  }
}