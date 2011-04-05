define ldconfig::conf_snippet (
  $ensure   = 'present',
  $content  = '',
  $source   = '',
  $filename = ''
) {

  $Realname = $filename ? {
    ''      => $name,
    default => $filename
  } # $Realname

  case $ensure {
    present: {
      case $content {
        '': {
          # no content means we grab a file
          $Realsource = $source ? {
            ''      => "puppet:///modules/ldconfig/$Realname.conf",
            default => $source
          } # $Realsource
          file { "$ldconfig::basedir/$Realname.conf":
            ensure  => present,
            source  => "$Realsource",
            require => Package['ldconfigPackage'],
            notify  => Exec['ldconfig-rebuild'],
          } # file
        } # '':
        default: {
          # use a template to generate the content
          file { "$ldconfig::basedir/$Realname.conf":
            ensure  => present,
            content => $content,
            require => Package['ldconfigPackage'],
            notify  => Exec['ldconfig-rebuild'],
          } # file
        } # default:
      } # case $content
    } # present:
    absent: {
      file { "$ldconfig::basedir/$Realname.conf":
        ensure => absent,
        notify => Exec['ldconfig-rebuild'],
      } # file
    } # absent:
  } # case $ensure
} # define ldconfig::conf_snippet
