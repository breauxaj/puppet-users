define users::root_my_cnf (
  $dbuser,
  $dbpass,
  $dbhost
) {

  file { '/root/.my.cnf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
  }

  my_cnf { $name:
    ensure   => present,
    dbuser   => $dbuser,
    dbpass   => $dbpass,
    dbhost   => $dbhost,
    require  => File["/${name}/.my.cnf"],
  }

}
