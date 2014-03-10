define users::del_user {
  user { $name:
    ensure     => absent,
    managehome => true,
  }

}
