class check_mk_agent::check_types::cpu_loads(
  $warning = 'None',
  $critical = 'None'
) {
  include check_mk_agent

  @@file{"${check_mk_agent::config_dir}/${::hostname}/cpu_loads/cpu_loads.mk":
    ensure  => present,
    content => template('check_mk_agent/check_types/cpu_loads.mk.erb'),
    tag     => $::pari_hash,
    require => File["${check_mk_agent::config_dir}/${::hostname}/cpu_loads"],
  }

  @@file{"${check_mk_agent::config_dir}/${::hostname}/cpu_loads":
    ensure  => directory,
    recurse => true,
    force   => true,
    tag     => $::pari_hash,
  }

}
