class ArticlesController < ApplicationController
  skip_before_filter :authenticate_user!

  inherit_resources

  def show
    show!(resource.increment!(:view_count))
  end

  def create
    create! { collection_path }
  end

  protected
    def collection
      @articles ||= end_of_association_chain.with_province(params[:prov]).with_name(params[:name]).page(params[:page])
    end

end
