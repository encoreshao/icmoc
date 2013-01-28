class ApplicationController < ActionController::Base
  protect_from_forgery
  layout proc { |controller| controller.request.xhr? ? nil : 'application' }

  helper_method :current_user
  before_filter :authenticate_user!

  def self.main_nav_highlight(name)
    before_filter { |c| c.instance_variable_set(:@main_nav, name) }
  end
  
  private
    def authenticate_user!
      if current_user.blank?
        session[:redirect_to] = request.fullpath if !request.xhr?
        redirect_to new_session_path
      end
    end

    def admin_authenticate_user!
      authenticate_user!
      
      redirect_to member_root_path unless current_user.is_admin?
    end

    def current_user
      session[:user_id].blank? ? nil : staff_user
    end

    def staff_user
      if user = User.find_by_id(session[:user_id])
        user
      else
        session[:user_id] = nil
      end
    end    

end
