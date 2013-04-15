class ContactsController < ApplicationController
  skip_before_filter :authenticate_user!
  inherit_resources

  def create
    create! { collection_path }
  end

end
