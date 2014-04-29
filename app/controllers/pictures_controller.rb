class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new
    @picture.url = params[:picture][:url]
    @picture.description = params[:picture][:description]
    @picture.rating = params[:picture][:rating]

    if @picture.save
      redirect_to picture_path(@picture), notice: "Picture successfully created"
    else
      render :new
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end
end