class PicturesController < ApplicationController
  def index

  end

  def new
    @picture = Picture.new
  end

  def create
    p params[:picture][:description]
    @picture = Picture.new
    @picture.url = params[:picture][:url]
    @picture.description = params[:picture][:description]
    @picture.rating = params[:picture][:rating]
    @picture.save


    redirect_to picture_path(@picture), notice: "Picture successfully created"
  end

  def show
    @picture = Picture.find(params[:id])
  end
end