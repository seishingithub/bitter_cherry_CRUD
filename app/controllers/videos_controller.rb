class VideosController < ApplicationController

  def new
    @video = Video.new
  end

  def create
    @video = Video.new
    @video.url = params[:video][:url]
    @video.description = params[:video][:description]
    @video.rating = params[:video][:rating]
    if  @video.save
      redirect_to video_path(@video), notice: "Video Successfully Created"
    else
      render :new
    end
  end

  def show
    @video = Video.find(params[:id])
  end

end
