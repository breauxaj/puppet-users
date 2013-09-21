class users {
  $path = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/home',
  }

  file { $path:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}
