class packetbeat::outputs::file (
  $enabled = $packetbeat::file_enabled,
  $path = $packetbeat::file_path,
) {
  concat::fragment {'output.file':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/outputs/file.erb'),
    order   => 23
  }
}
