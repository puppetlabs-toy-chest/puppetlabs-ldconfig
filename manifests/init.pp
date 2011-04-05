# ldconfig
#
# manage ldconfig config files
#
# garrett honeycutt - garrett@puppetlabs.com - 20110405
#
class ldconfig {

  # default directory for snippets
  $basedir = '/etc/ld.so.conf.d'

  package { 'glibc':
    ensure => installed,
    alias  => 'ldconfigPackage',
  } # package

  exec { 'ldconfig-rebuild':
    refreshonly => true,
    path        => '/sbin',
    command     => '/sbin/ldconfig',
  } # exec
} # class ldconfig
