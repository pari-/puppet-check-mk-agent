class check_mk_agent::service {
  service {$check_mk_agent::service_name:
    ensure     => $check_mk_agent::service_ensure,
    enable     => $check_mk_agent::service_enable,
    hasstatus  => false,
    hasrestart => true,
  }
}
