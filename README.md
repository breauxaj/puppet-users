users
=====

Encapsulate the functionality to simplify user/service/root account management.

Samples
-------
```
include users
```
```
users::add_group { 'deploy': gid => 500 }
```
```
users::add_user { 'deploy': fullname => 'Deploy', gid => '500', groups => 'deploy', password => '', uid => '500' }
users::add_user { 'johnq': fullname => 'John Q Public', gid => '600', groups => '', password => '', uid => '600' }
users::add_user { 'nancys': fullname => 'Nancy Smith', gid => '600', groups => '', password => '', uid => '601' }
users::add_user { 'fredd': fullname => 'Fred Doe', gid => '600', groups => '', password => '', uid => '602' }
```
```
users::add_service { 'auto': gid => 400, groups => '', uid => 400 }
```
```
users::set_root_password { 'default': password => '' }
```
```
users::add_my_cnf { 'deploy':
  dbuser => 'deploy',
  dbpass => 'changeme',
  dbhost => '127.0.0.1',
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
