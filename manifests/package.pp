class packetbeat::package ($version = '1.0.0~Beta1'){
  include ::wget

  case $::osfamily {

    'Debian': {
      class { 'packetbeat::package::dpkg': }
    }

    'RedHat': {
      class { 'packetbeat::package::rpm': }
    }

    default: { fail("${::osfamily} not supported yet") }

  }
}
