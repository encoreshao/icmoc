# encoding: utf-8

class Member::UsersController < Member::BaseController
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
    if request.put?
      if @user.update_attributes(params[:user])
        redirect_to action: :basic
      else
        render action: :basic
      end
    end
  end

  def details
    @detail = UserDetail.new if @user.detail.blank?
    if request.put?
      if @user.update_attributes params[:user]
        redirect_to action: :details
      else
        render action: :details
      end
    end
  end

  def interests
    @hobby = UserHobby.new if @user.hobby.blank?
    if request.put?
      if @user.update_attributes(params[:user])
        redirect_to action: :interests
      else
        render action: :interests
      end
    end
  end

  def education
    if request.put?
      if @user.update_attributes(params[:user])
        redirect_to action: :education
      else
        render action: :education
      end
    end
  end

  def career
    if request.put?
      if @user.update_attributes(params[:user])
        redirect_to action: :career
      else
        render action: :career
      end
    end
  end

  def portrait
    if request.put?
      if @user.update_attributes (params[:user])
        redirect_to action: :portrait
      else
        render action: :portrait
      end
    end
  end

  private
    def instance_current_user
      @user = current_user
      @sec_nav = params[:action].to_sym
    end

end
