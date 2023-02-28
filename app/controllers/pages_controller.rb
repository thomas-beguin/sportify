class PagesController < ApplicationController
  def home
  end

  def terms
  end

  def sitemap
  end

  def privacy
  end

  def faq
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_path if @user != current_user
  end
end
