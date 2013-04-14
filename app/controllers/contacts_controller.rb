class ContactsController < ApplicationController
  skip_before_filter :authenticate_user!
  inherit_resources

  def create
    create! { root_path }
  end

end
