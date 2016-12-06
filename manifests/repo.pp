# Set up repos
class beats::repo {
  case $::osfamily {

    'Debian': {
      class { '::beats::repo::apt': }
    }

    'RedHat': {
      class { '::beats::repo::yum': }
    }

    default: { fail("${::osfamily} not supported yet") }
  }
}
