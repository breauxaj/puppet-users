define users::add_user (
  $fullname,
  $gid,
  $groups,
  $password,
  $uid,
  $shell = '/bin/bash'
) {
  user { $name:
    ensure           => present,
    comment          => $fullname,
    gid              => $gid,
    groups           => $groups,
    home             => "/home/${name}",
    password         => $password,
    password_max_age => '99999',
    password_min_age => '0',
    shell            => $shell,
    managehome       => true,
    uid              => $uid,
  }

  file { "/home/${name}/.gnupg":
    ensure  => directory,
    owner   => $uid,
    group   => $gid,
    mode    => '0700',
    require => User[$name],
  }

  file { "/home/${name}/.ssh":
    ensure  => directory,
    owner   => $uid,
    group   => $gid,
    mode    => '0700',
    require => User[$name],
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
    require => User[$name],
  }

}
