class RicAddonsController < ApplicationController
  layout 'ric_addons_app'
  #render_ric_app
  #before_filter :login_required #, :except => [:index, :show]
  
  def search
    @query_string = params[:q] || "riccardo"
  end
  
  def index
    
  end
  
end