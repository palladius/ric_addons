# Include hook code here

$RIC_ADDONS_HISTORY = [ # Array of Hash style
    #VER        #DATE       # Description :)
    { :ver => '0.2.2',  :date =>'20110122', :desc => 'Great changes ahead. Still I have the bad symlink though :(' } ,
    { :ver => '0.2.1a', :date =>'20110121', :desc => 'Corrected typo' } ,
    { :ver => '0.2.1',  :date =>'20110121', :desc => 'Copied from ric_plugin v0.1b (as it deserved to be copied!)' } ,
]

$RIC_ADDONS_VER  =  $RIC_ADDONS_HISTORY.first[:ver]  # version
$RIC_ADDONS_DATE =  $RIC_ADDONS_HISTORY.first[:date] # version

begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "ric_addons"
    gem.summary = "RicAddons experimental Engine for Rails 3"
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*"]
    # other fields that would normally go in your gemspec
    # like authors, email and has_rdoc can also be included here

  end
rescue
  puts "Jeweler or one of its dependencies is not installed."
end


require File.dirname(__FILE__) + '/lib/acts_as_carlesso'
require 'ric_addons'
require File.dirname(__FILE__) + '/lib/searchable'
#require 'searchable'

### Deprecated...
#require "routing"
#ActionController::Routing::RouteSet::Mapper.send :include, RicAddons::Routing::MapperExtensions

#### controllrs/helpers/views:
%w{ models controllers helpers }.each do |dir|
  path = File.join(directory, 'lib', 'app', dir)
  $LOAD_PATH << path
  Dependencies.load_paths << path
  Dependencies.load_once_paths.delete(path)
end


# copied from Chad Fowler book pag.239
puts IO.read( File.join(directory, 'README') ) rescue "Some error"
puts RicAddons.yellow("Riccardo plugin hook v.#{$RIC_ADDONS_VER} on #{$RIC_ADDONS_DATE}, yay!") rescue "ric_addons v#{$RIC_ADDONS_VER}: Errors with yellow :-("
