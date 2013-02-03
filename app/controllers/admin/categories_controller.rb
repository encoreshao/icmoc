class Admin::CategoriesController < Admin::BaseController
  main_nav_highlight :categories
  
  protected
    def collection
      @categories ||= end_of_association_chain.with_name(params[:name]).page(params[:page])
    end
end
