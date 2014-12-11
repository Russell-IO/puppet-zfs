#
class zfs::params {

  case $::osfamily {
    'RedHat': {
      $package_dependencies   = ['kernel-devel']
      $package_ensure         = 'installed'
      $package_name           = 'zfs'
      $release_package_name   = 'zfs-release'
      $release_package_source = "http://archive.zfsonlinux.org/epel/zfs-release.el${::operatingsystemmajrelease}.noarch.rpm"
      $service_enable         = true
      $service_ensure         = 'running'
      $service_manage         = true
      $service_name           = 'zfs'
    }
    'Debian': {
      $operatingsystem_real   = downcase($::operatingsystem)
      $package_dependencies   = []
      $package_ensure         = 'installed'
      $package_name           = "${operatingsystem_real}-zfs"
      $release_package_name   = 'zfsonlinux'
      $release_package_source = "http://archive.zfsonlinux.org/debian/pool/main/z/zfsonlinux/zfsonlinux_3~${::lsbdistcodename}_all.deb"
      $service_enable         = true
      $service_ensure         = 'running'
      $service_manage         = true
      $service_name           = 'zfs'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.") # lint:ignore:80chars
    }
  }
}