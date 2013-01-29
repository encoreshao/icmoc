class Admin::CitiesController < Admin::BaseController
  main_nav_highlight :cities

  protected
    def collection
      @cities ||= end_of_association_chain.with_name(params[:name]).page(params[:page])
    end
end
