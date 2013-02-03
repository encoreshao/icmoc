# encoding: utf-8

module ApplicationHelper

  # A helper that renders the sec navigation highlight
  def main_nav(name, options = {}, &block)
    if @main_nav == name
      if options[:class]
        options[:class] += " active"
      else
        options[:class] = "active"
      end
    end
    content = capture(&block)
    content_tag(:li, content, options)
  end

  def sec_nav(name, options = {}, &block)
    if @sec_nav == name
      if options[:class]
        options[:class] += " active"
      else
        options[:class] = "active"
      end
    end
    content = capture(&block)
    content_tag(:li, content, options)
  end

  def passport_options(options)
    options.collect{|a| [a[:name], a[:value].to_i] }
  end

  def show_flash_message
    msg, css_class =
      if flash[:notice]
      [flash[:notice], 'notice']
    elsif flash[:alert]
      [flash[:alert], 'alert']
    end
    if msg
      content_tag :p, msg, :class => css_class
    end
  end

  def terms_text
<<-EOS
    换客(icmoc.com)服务条款
1、欢迎您加入换客，并进行物品交换；
2、本网站为个人网站，免费提供交换平台，不对信息的真实性、完整性，承担任何责任，请谨慎交换，以免交换失败造成损失；
3、我们推荐在网上发布信息，然后在进行同城交换，同城交换时，最好在人多商场等附近，如果是女生，最好有人陪同；
4、异地交换风险比较大，请千万小心，我们不鼓励异地之间进行物品交换；
5、为了进一步提高网站信息的真实准确性，您注册后，可以提交身份实名认证信息，同时，你在进行交换时，尽量跟已经进行实名认证的会员交换，但我们仍不敢确实经过实名认证的会员，就一定是以真实身份注册登记的。
明确这些风险之后，你再确定是否注册会员，并进行网上交换，一旦您确认，您自己对整个交换行为负责。
EOS
  end
  
end
