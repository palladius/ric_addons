# Include hook code here

$RIC_ADDONS_VER = '0.1b'
$RIC_ADDONS_HISTORY = [
    #VER        #DATE       # Description :)
  [ '0.2.1' ,  '20110121', 'Copied from ric_plugin v0.1b (as it deserved to be copied!)' ] ,
]

require File.dirname(__FILE__) + '/lib/acts_as_carlesso'
require 'ric_addons'

# copied from Chad Fowler book pag.239
puts IO.read( File.join(directory, 'README') ) rescue "Some error"
puts RicAddons.yellow("[RicAddons] This is my SECOND plugin hook v.#{$RIC_ADDONS_VER}, yay!") rescue "ric_addons v#{$RIC_ADDONS_VER}: Errors with yellow :-("
