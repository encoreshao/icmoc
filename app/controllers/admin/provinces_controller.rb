class Admin::ProvincesController < InheritedResources::Base
  main_nav_highlight :provinces
  before_filter :admin_authenticate_user!
  layout 'admin'

  protected
    def collection
      @provinces ||= end_of_association_chain.with_name(params[:name]).page(params[:page])
    end
end
