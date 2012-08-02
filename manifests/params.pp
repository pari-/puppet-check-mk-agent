class check_mk_agent::params {
  $ensure = 'present'
  $auto_upgrade = false
  $service_ensure = 'running'
  $service_enable = true

  $xinetd_type = 'UNLISTED'
  $xinetd_port = '6556'
  $xinetd_socket_type = 'stream'
  $xinetd_protocol = 'tcp'
  $xinetd_wait = 'no'
  $xinetd_user = 'root'
  $xinetd_server = '/usr/bin/check_mk_agent'
  $xinetd_only_from = '127.0.0.1'
  $xinetd_disable = 'no'

  case $::operatingsystem {
    'Debian': {
      $package = [ 'check-mk-agent', 'xinetd' ]
      $config = '/etc/xinetd.d/check_mk'
      $service_name = 'xinetd'
      $config_dir = '/etc/check_mk/conf.d'
    }
    'CentOS': {
      $package = [ 'check_mk-agent', 'xinetd' ]
      $config = '/etc/xinetd.d/check_mk'
      $service_name = 'xinetd'
      $config_dir = '/etc/check_mk/conf.d'
    }
    default: {
      fail("\"${module_name}\" is not supported on \"${::operatingsystem}\"")
    }
  }

}
