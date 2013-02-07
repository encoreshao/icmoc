# encoding: utf-8

class Member::UsersController < Member::BaseController
  before_filter :instance_sec_nav


  def basic
    if request.put?
      if resource.update_attributes(params[:user])
        redirect_to action: :basic
      else
        render action: :basic
      end
    end
  end

  def details
    @detail = UserDetail.new if resource.detail.blank?
    if request.put?
      if resource.update_attributes params[:user]
        redirect_to action: :details
      else
        render action: :details
      end
    end
  end

  def interests
    @hobby = UserHobby.new if resource.hobby.blank?
    if request.put?
      if resource.update_attributes(params[:user])
        redirect_to action: :interests
      else
        render action: :interests
      end
    end
  end

  def education
    if request.put?
      if resource.update_attributes(params[:user])
        redirect_to action: :education
      else
        render action: :education
      end
    end
  end

  def career
    if request.put?
      if resource.update_attributes(params[:user])
        redirect_to action: :career
      else
        render action: :career
      end
    end
  end

  def portrait
    if request.put?
      if resource.update_attributes (params[:user])
        redirect_to action: :portrait
      else
        render action: :portrait
      end
    end
  end

  private
    def resource
      current_user
    end

    def instance_sec_nav
      @sec_nav = params[:action].to_sym
    end

end
