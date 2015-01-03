define users::add_ldap_user (
  $gid,
  $groups,
  $uid,
) {
  user { $name:
    ensure => present,
    groups => $groups,
  }

  file { "/home/${name}":
    ensure => directory,
    owner  => $uid,
    group  => $gid,
    mode   => '0700',
  }

  file { "/home/${name}/.gnupg":
    ensure  => directory,
    owner   => $uid,
    group   => $gid,
    mode    => '0700',
    require => File["/home/${name}"],
  }

  file { "/home/${name}/.ssh":
    ensure  => directory,
    owner   => $uid,
    group   => $gid,
    mode    => '0700',
    require => File["/home/${name}"],
  }

  file { "/home/${name}/.ssh/authorized_keys":
    ensure  => present,
    owner   => $uid,
    group   => $gid,
    mode    => '0600',
    require => File["/home/${name}/.ssh"],
  }

  file { "/home/${name}/.my.cnf":
    ensure  => present,
    owner   => $uid,
    group   => $gid,
    mode    => '0600',
    require => File["/home/${name}"],
  }

}
