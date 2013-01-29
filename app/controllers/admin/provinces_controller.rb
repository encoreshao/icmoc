class Admin::ProvincesController < Admin::BaseController
  main_nav_highlight :provinces
  
  protected
    def collection
      @provinces ||= end_of_association_chain.with_name(params[:name]).page(params[:page])
    end
end
