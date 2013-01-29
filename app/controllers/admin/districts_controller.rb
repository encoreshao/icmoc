class Admin::DistrictsController < Admin::BaseController
  main_nav_highlight :districts
  
  protected
    def collection
      @districts ||= end_of_association_chain.with_name(params[:name]).page(params[:page])
    end
end
