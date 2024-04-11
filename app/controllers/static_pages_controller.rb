class StaticPagesController < ApplicationController
  def home
    @imagepost  = current_user.imageposts.build if logged_in?
  end

  def help
  end

  def about
  end
end
