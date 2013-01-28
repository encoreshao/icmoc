class Admin::CitiesController < InheritedResources::Base
  main_nav_highlight :cities
  before_filter :admin_authenticate_user!
  layout 'admin'

  protected
    def collection
      @cities ||= end_of_association_chain.with_name(params[:name]).page(params[:page])
    end
end
