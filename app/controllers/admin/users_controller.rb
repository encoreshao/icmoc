class Admin::UsersController < Admin::BaseController
  main_nav_highlight :users

  def create
    create! { collection_path }
  end

  def update
    update! { collection_path }
  end
  
  def mark_as_admin
    user = User.find params[:id]
    user.mark_as_admin!
    redirect_to request.fullpath
  end

  def mark_as_user
    user = User.find params[:id]
    user.mark_as_user!
    redirect_to request.fullpath
  end
  
  protected
    def collection
      @users ||= end_of_association_chain.for_name(params[:name]).page(params[:page])
    end
end
