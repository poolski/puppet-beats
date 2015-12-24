# Create header blocks for beats
define beats::common::headers (
  $agentname             = $beats::agentname,
  $tags                  = $beats::tags,
  $refresh_topology_freq = $beats::refresh_topology_freq,
  $ignore_outgoing       = $beats::ignore_outgoing,
  $uid                   = $beats::uid,
  $gid                   = $beats::gid,
  $geoip_paths           = ['/usr/share/GeoIP/GeoIPCity.dat'],
) {
  concat { "/etc/${title}/${title}.yml":
    group   => 'root',
    mode    => '0755',
    owner   => 'root',
    order   => 'numeric',
    require => Package[$title],
  }
  concat::fragment {"${title}-commoon-shipper-config":
    target  => "/etc/${title}/${title}.yml",
    content => template('beats/shipper.erb'),
    order   => 01,
  }
  if $uid and $gid {
    concat::fragment {"${title}-common-runopts":
      target  => "/etc/${title}/${title}.yml",
      content => template('beats/runopts.erb'),
      order   => 02,
    }
  }
  concat::fragment {"${title}-common-output-header":
    target  => "/etc/${title}/${title}.yml",
    content => template('beats/outputs/output.header.erb'),
    order   => 20
  }
}