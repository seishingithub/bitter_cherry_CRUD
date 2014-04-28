class VimeoVideosController < ApplicationController
  def index
    @vimeo_videos = VimeoVideo.all
  end

  def new

    @vimeo_video = VimeoVideo.new

  end

  def create
      @vimeo_video = VimeoVideo.new
      @vimeo_video.url = params[:vimeo_video][:url]
      @vimeo_video.description = params[:vimeo_video][:description]
      @vimeo_video.rating = params[:vimeo_video][:rating]
    if  @vimeo_video.save
      redirect_to vimeo_video_path(@vimeo_video), notice: "Video Successfully Created"
    else
      render :new
    end
  end
  def show
    @vimeo_video = VimeoVideo.find(params[:id])
  end


end


