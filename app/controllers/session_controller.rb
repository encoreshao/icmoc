class SessionController < ApplicationController
  skip_before_filter :authenticate_user!

  def new
    @user = User.new
    @problem = @user.problems.build
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to member_root_path
    else
      render action: :new
    end
  end

  def index
    unless current_user.blank?
      if current_user.is_admin?
        redirect_to root_path
      else
        redirect_to member_root_path
      end and return 
    end
    @user = User.new
  end

  def login
    @user = User.login_in_with_email_and_password(params[:user][:email], params[:user][:password])
    
    unless @user.blank?
      session[:user_id], referer_path, session[:redirect_to] = @user.id, (session[:redirect_to] || root_path), nil
      @user.reset_login_infomations(request.remote_ip)
      path = @user.is_admin? ? admin_root_path : member_root_path
      redirect_to path, notice: 'login success'
    else
      redirect_to new_session_path, alert: 'Invalid email or password!'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'logout success'
  end
  
end
