# 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (Scored)
#
#
# Description:
# Configure SELINUX to be enabled at boot time and verify that it has not been overwritten by the grub boot parameters.
#
# @summary 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_6_1_1
class secure_linux_cis::redhat7::cis_1_6_1_1 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'cmdline_def_default':
      path   => '/etc/default/grub',
      line   => 'GRUB_CMDLINE_LINUX_DEFAULT="quiet"',
      match  => '^GRUB_CMDLINE_LINUX_DEFAULT=',
      notify => Exec['1_6_1_1 update grub cfg'],
    }

    file_line { 'cmdline_def':
      path   => '/etc/default/grub',
      line   => 'GRUB_CMDLINE_LINUX="crashkernel=auto rd.lvm.lv=vg0/root rd.lvm.lv=vg0/swap rhgb quiet audit=1"',
      match  => '^GRUB_CMDLINE_LINUX=',
      notify => Exec['1_6_1_1 update grub cfg'],
    }

    exec { '1_6_1_1 update grub cfg':
      path        => '/bin:/sbin:/usr/bin:/usr/sbin',
      command     => 'grub2-mkconfig -o /boot/grub2/grub.cfg',
      refreshonly => true,
      logoutput   => true,
    }

  }
}
