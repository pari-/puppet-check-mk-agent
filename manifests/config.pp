class check_mk_agent::config {
  file {$check_mk_agent::config:
    ensure  => 'present',
    content => template('check_mk_agent/check_mk.erb'),
  }

  @@file{"${check_mk_agent::config_dir}/${::hostname}":
    ensure  => directory,
    recurse => true,
    force   => true,
    tag     => $::pari_hash,
  }

  @@file{"${check_mk_agent::config_dir}/${::hostname}/main.mk":
    ensure  => present,
    tag     => $::pari_hash,
    content => template('check_mk_agent/main.mk.erb'),
    require => File["${check_mk_agent::config_dir}/${::hostname}"],
  }

}

