define users::del_user {
  user { $name:
    ensure => absent,
  }

  file { "/home/${name}":
    ensure => absent,
    force => true,
  }

}
