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
  
end
