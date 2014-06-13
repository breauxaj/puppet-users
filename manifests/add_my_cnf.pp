define users::add_my_cnf (
  $username,
  $dbuser,
  $dbpass,
  $dbhost
) {
  my_cnf { $name:
    ensure  => present,
    dbuser  => $dbuser,
    dbpass  => $dbpass,
    dbhost  => $dbhost,
    require => File["/home/${username}/.my.cnf"],
  }

}
