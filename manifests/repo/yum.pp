class beats::repo::yum {

  ## This is a freely available repo by packagecloud.  Not maintained
  ## As soon as ES provides upstream packages this repo should be obsoleted
  yumrepo { 'beats':
    ensure   => 'present',
    baseurl  => 'https://packages.elastic.co/beats/yum/el/$basearch',
    descr    => 'ES beats repository',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'http://packages.elastic.co/GPG-KEY-elasticsearch',
  }

}

