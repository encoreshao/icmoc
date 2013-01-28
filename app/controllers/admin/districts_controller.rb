class Admin::DistrictsController < InheritedResources::Base
  main_nav_highlight :districts
  before_filter :admin_authenticate_user!
  layout 'admin'

  protected
    def collection
      @districts ||= end_of_association_chain.with_name(params[:name]).page(params[:page])
    end
end
