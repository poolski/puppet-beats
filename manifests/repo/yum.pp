# Placeholder for when there are official repos
class beats::repo::yum {

  ## This is a freely available repo by packagecloud.  Not maintained
  ## As soon as ES provides upstream packages this repo should be obsoleted
  yumrepo { 'krisbuytaert_monitoringstuff':
    ensure   => 'present',
    baseurl  => 'https://packagecloud.io/krisbuytaert/monitoringstuff/el/6/$basearch',
    descr    => 'krisbuytaert_monitoringstuff',
    enabled  => '1',
    gpgcheck => '0',
  }


}

