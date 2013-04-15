class Admin::ArticleLevelsController < Admin::BaseController
  main_nav_highlight :article_levels

  def create
    create! { collection_path }
  end

  def update
    update! { collection_path }
  end
  
  protected
    def collection
      @article_levels ||= end_of_association_chain.with_name(params[:name]).page(params[:page])
    end
end
