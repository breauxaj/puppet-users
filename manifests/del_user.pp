define users::del_user {
  user { $name:
    ensure => absent,
    force  => true,
  }

  file { "/home/${name}":
    ensure => absent,
    force => true,
  }

}
