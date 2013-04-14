class ArticlesController < ApplicationController
  skip_before_filter :authenticate_user!

  inherit_resources

  def create
    create! { collection_path }
  end

  protected
    def collection
      @articles ||= end_of_association_chain.with_name(params[:name]).page(params[:page])
    end

end
