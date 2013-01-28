class Member::UsersController < ApplicationController
  layout 'member'
  before_filter :instance_current_user, except: [:new, :create]
  skip_before_filter :authenticate_user!, only: [:new, :create]

  def new
    @user = User.new
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

  def basic
  end

  def details
  end

  def interests
  end

  def education
  end

  def career
  end

  def portrait
  end

  private
    def instance_current_user
      @user = current_user
      @sec_nav = params[:action].to_sym
    end

end
