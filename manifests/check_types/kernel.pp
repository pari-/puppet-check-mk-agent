class check_mk_agent::check_types::kernel(
  $items
) {
  include check_mk_agent

  @@file{"${check_mk_agent::config_dir}/${::hostname}/kernel/kernel.mk":
    ensure  => present,
    content => template('check_mk_agent/check_types/kernel.mk.erb'),
    tag     => $::pari_hash,
    require => File["${check_mk_agent::config_dir}/${::hostname}/kernel"],
  }


  @@file{"${check_mk_agent::config_dir}/${::hostname}/kernel":
    ensure  => directory,
    recurse => true,
    force   => true,
    tag     => $::pari_hash,
  }

}
