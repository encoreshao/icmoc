class Admin::UsersController < Admin::BaseController
  main_nav_highlight :users

  def create
    create! { collection_path }
  end

  def update
    if params.key?(:event)
      if resource.send("#{params[:event]}!")

        redirect_to :back, notice: 'Operation Success'
      else
        render :edit
      end
    else
      params[:user][:skip_password] = true if params[:user][:password].blank?


      update! do |success, failure|
        success.html {
          redirect_to collection_path, notice: "Update #{resource.name} Successed."
        }
        failure.html {
          render :edit
        }
      end
    end
  end
  
  protected
    def collection
      @users ||= end_of_association_chain.for_name(params[:name]).page(params[:page])
    end
end
