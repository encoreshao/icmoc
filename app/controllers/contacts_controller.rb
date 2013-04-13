class ContactsController < ApplicationController
  inherit_resources

  def create
    create! { root_path }
  end

end
