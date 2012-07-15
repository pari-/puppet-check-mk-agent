class check_mk_agent (
  $ensure             = $check_mk_agent::params::ensure,
  $package            = $check_mk_agent::params::package,
  $auto_upgrade       = $check_mk_agent::params::auto_upgrade,
  $config             = $check_mk_agent::params::config,
  $service_name       = $check_mk_agent::params::service_name,
  $service_ensure     = $check_mk_agent::params::service_ensure,
  $service_enable     = $check_mk_agent::params::service_enable,
  $config_dir         = $check_mk_agent::params::config_dir,
  $xinetd_type        = $check_mk_agent::params::xinetd_type,
  $xinetd_port        = $check_mk_agent::params::xinetd_port,
  $xinetd_socket_type = $check_mk_agent::params::xinetd_socket_type,
  $xinetd_protocol    = $check_mk_agent::params::xinetd_protocol,
  $xinetd_wait        = $check_mk_agent::params::xinetd_wait,
  $xinetd_user        = $check_mk_agent::params::xinetd_user,
  $xinetd_server      = $check_mk_agent::params::xinetd_server,
  $xinetd_only_from   = $check_mk_agent::params::xinetd_only_from,
  $xinetd_disable     = $check_mk_agent::params::xinetd_disable
) inherits check_mk_agent::params {

  class {'check_mk_agent::package':}
  class {'check_mk_agent::config':}
  class {'check_mk_agent::service':}

  if $ensure == 'present' {
    Class['check_mk_agent::package'] -> Class['check_mk_agent::config'] ~> Class['check_mk_agent::service']
  } else {
    Class['check_mk_agent::service'] -> Class['check_mk_agent::package']
  }
}
