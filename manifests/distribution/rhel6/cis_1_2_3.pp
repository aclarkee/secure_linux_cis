# @api private
#
class secure_linux_cis::distribution::rhel6::cis_1_2_3 {
  include secure_linux_cis::rules::ensure_gpg_keys_are_configured
}
