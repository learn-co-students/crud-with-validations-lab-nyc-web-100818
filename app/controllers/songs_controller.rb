class SongsController < ApplicationController

  def song_params(*args)
    params.require(:song).permit(*args)
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by(id: params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :artist_name, :released, :release_year, :genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  def update
    @song = Song.find_by(id: params[:id])
    @song.update(song_params(:title, :artist_name, :released, :release_year, :genre))

    if @song.valid?
      redirect_to song_path
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy

    redirect_to songs_path
  end

end
