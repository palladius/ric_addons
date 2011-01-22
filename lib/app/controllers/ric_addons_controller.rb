class RicAddonsController < ApplicationController
  #before_filter :login_required #, :except => [:index, :show]
  
  def search
    @query_string = params[:q] || "riccardo"
  end
  
end