# Include hook code here

$RIC_ADDONS_HISTORY = [ # Array of Hash style
    #VER        #DATE       # Description :)
    { :ver => '0.2.1a', :date =>'20110121', :desc => 'Corrected typo' } ,
    { :ver => '0.2.1',  :date =>'20110121', :desc => 'Copied from ric_plugin v0.1b (as it deserved to be copied!)' } ,
]
#$RIC_ADDONS_HISTORY = [  # Array of Array style
#    #VER        #DATE       # Description :)
#    [ '0.2.1a' ,  '20110121', 'Corrected typo' ] ,
#    [ '0.2.1' ,  '20110121', 'Copied from ric_plugin v0.1b (as it deserved to be copied!)' ] ,
#]
$RIC_ADDONS_VER  =  $RIC_ADDONS_HISTORY.first[:ver]  # version
$RIC_ADDONS_DATE =  $RIC_ADDONS_HISTORY.first[:date] # version


require File.dirname(__FILE__) + '/lib/acts_as_carlesso'
require 'ric_addons'

# copied from Chad Fowler book pag.239
puts IO.read( File.join(directory, 'README') ) rescue "Some error"
puts RicAddons.yellow("Riccardo plugin hook v.#{$RIC_ADDONS_VER} on #{$RIC_ADDONS_DATE}, yay!") rescue "ric_addons v#{$RIC_ADDONS_VER}: Errors with yellow :-("
