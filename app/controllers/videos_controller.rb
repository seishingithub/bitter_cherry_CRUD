class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

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
    @youtube_id = @video[:url].split('v=')[1]
    @youtube_url = '//www.youtube.com/embed/' + @youtube_id
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.url = params[:video][:url]
    @video.description = params[:video][:description]
    @video.rating = params[:video][:rating]
    @video.save
    redirect_to video_path(@video)
  end

end
