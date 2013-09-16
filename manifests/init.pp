class users {

}

define users::add_user ( $fullname,
                  $gid,
                  $groups,
                  $password,
                  $shell = '/bin/bash',
                  $uid ) {
  user { "$name":
    ensure           => present,
    comment          => $fullname,
    gid              => $gid,
    groups           => $groups,
    home             => "/home/$name",
    password         => $password,
    password_max_age => '99999',
    password_min_age => '0',
    shell            => $shell,
    managehome       => true,
    uid              => $uid,
  }

  file { "/home/$name/.ssh":
    ensure  => directory,
    owner   => $uid,
    group   => $gid,
    mode    => 700,
    require => User["$name"],
  }
    
  file { "/home/$name/.ssh/authorized_keys":
    ensure  => present,
    owner   => $uid,
    group   => $gid,
    mode    => 600,
    require => File["/home/$name/.ssh"],
  }

}

define users::add_service ( $gid,
                     $groups,
                     $home = '/var/lib',
                     $uid ) {
  user { "$name":
    ensure     => present,
    comment    => '',
    gid        => $gid,
    groups     => $groups,
    home       => "$home/$name",
    shell      => '/sbin/nologin',
    managehome => true,
    uid        => $uid,
  }

}

define users::add_group ( $gid ) {
  group { "$name":
    ensure => present,
    gid    => $gid,
  }
    
}

define users::add_ssh_key ( $key,
                     $type ) {
  ssh_authorized_key { "$name":
    ensure  => present,
    key     => $key,
    type    => $type,
    user    => $name,
    require => File["/home/$name/.ssh/authorized_keys"],
  }

}

define users::set_root_password ( $password ) {
  user { 'root':
    ensure   => present,
    password => $password,
  }

}
