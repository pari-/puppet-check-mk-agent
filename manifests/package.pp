class check_mk_agent::package {
  if $check_mk_agent::ensure == 'present' {
    $package_ensure = $check_mk_agent::auto_upgrade ? {
      true  => 'latest',
      false => 'installed',
    }
  } else {
    $package_ensure = 'purged'
  }

  package {$check_mk_agent::package:
    ensure          => $package_ensure,
    provider        => 'aptbpo',
    install_options => { '-t' => 'squeeze-backports' },
  }
}
