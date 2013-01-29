class Admin::PersonalitiesController < Admin::BaseController
  main_nav_highlight :personalities
  
  protected
    def collection
      @personalities ||= end_of_association_chain.with_name(params[:name]).page(params[:page])
    end
end
