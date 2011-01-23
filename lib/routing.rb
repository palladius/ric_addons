# From: http://izumi.plan99.net/manuals/creating_plugins-8f53e4d6.html

module RicAddons #:nodoc:
  module Routing #:nodoc:
    module MapperExtensions
      def yaffles
      #def ric_addons_routes
        @set.add_route("/yaffles", {:controller => "yaffles_controller", :action => "index"})
      end
    end
  end
end