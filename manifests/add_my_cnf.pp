define users::add_my_cnf (
  $dbuser,
  $dbpass,
  $dbhost
) {
  my_cnf { $name:
    ensure   => present,
    dbuser   => $dbuser,
    dbpass   => $dbpass,
    dbhost   => $dbhost,
    require  => File["/home/${name}/.my.cnf"],
  }

}
