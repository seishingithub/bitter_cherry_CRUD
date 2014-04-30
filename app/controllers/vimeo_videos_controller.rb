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

    if @vimeo_video.save
      redirect_to vimeo_video_path(@vimeo_video), notice: "Video Successfully Created"
    else
      render :new
    end
  end

  def show
    @vimeo_video = VimeoVideo.find(params[:id])
    @vimeo_video_id = @vimeo_video[:url].split('.com/')[1]
    @vimeo_video_url = '//player.vimeo.com/video/' + @vimeo_video_id
  end

  def edit
    @vimeo_video = VimeoVideo.find(params[:id])
  end

  def update
    @vimeo_video = VimeoVideo.find(params[:id])
    @vimeo_video.update(:url => params[:vimeo_video][:url], :description => params[:vimeo_video][:description], :rating => params[:vimeo_video][:rating])

    redirect_to vimeo_video_path(@vimeo_video), notice: "Video Updated"
  end

  def destroy
    @vimeo_video = VimeoVideo.find(params[:id])
    @vimeo_video.delete

    redirect_to vimeo_videos_path, notice: "Video Deleted"
  end

end
