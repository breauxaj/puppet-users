define users::del_user {
  user { $name:
    ensure => absent,
    force  => true,
  }

}
