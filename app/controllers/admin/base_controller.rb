class Admin::BaseController < ApplicationController
  inherit_resources

  before_filter :admin_authenticate_user!
  layout 'admin'

end
