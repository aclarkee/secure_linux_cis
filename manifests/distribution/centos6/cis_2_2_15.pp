# @api private
#
class secure_linux_cis::distribution::centos6::cis_2_2_15 {
  include secure_linux_cis::rules::ensure_mail_transfer_agent_is_configured_for_local_only_mode
}
