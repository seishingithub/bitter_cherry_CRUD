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

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.url = params[:picture][:url]
    @picture.description = params[:picture][:description]
    @picture.rating = params[:picture][:rating]

    if @picture.save
      redirect_to picture_path(@picture)
    else
      render :edit
    end
  end

  def destroy
    Picture.find(params[:id]).destroy
    redirect_to pictures_path, notice: "Picture successfully deleted"
  end
end