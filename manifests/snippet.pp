define ldconfig::snippet (
  $ensure  = 'present',
  $content = '',
  $source  = ''
) {
  ldconfig::conf_snippet { "snippet-$name":
    ensure   => $ensure,
    content  => $content,
    source   => $source,
    filename => $name,
    require  => Package['ldconfigPackage'],
  } # ldconfig::conf_snippet
} # define ldconfig::snippet
