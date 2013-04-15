class Admin::ArticlesController < Admin::BaseController
  main_nav_highlight :articles
  
  protected
    def collection
      @articles ||= end_of_association_chain.with_name(params[:name]).page(params[:page])
    end
end
