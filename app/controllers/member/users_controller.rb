# encoding: utf-8

class Member::UsersController < Member::BaseController
  before_filter :instance_second_nav
  before_filter :ajax_remote, except: [:destroy_career]

  def basic
  end

  def details
    @detail = UserDetail.new if resource.detail.blank?
  end

  def interests
    @hobby = UserHobby.new if resource.hobby.blank?
  end

  def education
    @educational = UserEducational.new if resource.educationals.blank?
  end

  def destroy_education
    educational = resource.educationals.where(indexing: params[:index]).first
    if educational.destroy
      render json: {status: 200}
    else
      render json: {status: 204}
    end
  end

  def career
  end

  def destroy_career
    work = resource.works.where(indexing: params[:index]).first
    if work.destroy
      render json: {status: 200}
    else
      render json: {status: 204}
    end
  end

  def portrait
  end

  private
    def resource
      current_user
    end

    def instance_second_nav
      @sec_nav = params[:action].to_sym
    end

    def ajax_remote
      if request.put?
        params[:user][:skip_password] = true
        if resource.update_attributes(params[:user])
          flash[:notice] = '用户信息修改成功.'
          redirect_to action: params[:action].to_sym
        else
          render action: params[:action].to_sym
        end
      end
    end

end