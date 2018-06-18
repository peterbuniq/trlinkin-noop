# Function to test the value of a union of the noop scope from the command
# line and the agent config file.
#
# @summary return true for noop scope enabled (ie. do nothing) and false
# for no noop in the agent config or from the cli.
#
# This function can be used with the trlinkin-noop code to ensure that we
# only ever apply catalog changes if we've set the noop scope for a module
# to false and have no overriding noop on the agent or cli side.
#
# true or true = true
# true or false = true
# false or false = false
#
function noop::agent_noop_state() {

  $overall_scope = $facts['noop_cli_value'] or $facts['$clientnoop']
  $overall_scope ? {
    true    => true,
    undef   => false,
    default => false,
  }
}
