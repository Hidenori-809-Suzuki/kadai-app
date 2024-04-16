class ImagepostsController < ApplicationController
  # before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
  end

  def create
    @imagepost = current_user.imageposts.build(imagepost_params)
    @imagepost.image.attach(params[:imagepost][:image])
    if @imagepost.save
      flash[:success] = "画像をアップロードしました"
      redirect_to root_url
    else
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  private

    def imagepost_params
      params.require(:imagepost).permit(:content, :image)
    end

    def correct_user
      @imagepost = current_user.imageposts.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @imagepost.nil?
    end
end
