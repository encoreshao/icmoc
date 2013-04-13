class Admin::ContactsController < Admin::BaseController
  main_nav_highlight :contacts
  
  protected
    def collection
      @contacts ||= end_of_association_chain.for_name(params[:name]).page(params[:page])
    end
end
