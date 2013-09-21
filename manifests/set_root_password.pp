define users::set_root_password (
  $password
) {
  user { 'root':
    ensure   => present,
    password => $password,
  }

}
