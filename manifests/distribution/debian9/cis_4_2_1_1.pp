# @api private
#
class secure_linux_cis::distribution::debian9::cis_4_2_1_1 {
  include secure_linux_cis::rules::ensure_rsyslog_service_is_enabled
}
