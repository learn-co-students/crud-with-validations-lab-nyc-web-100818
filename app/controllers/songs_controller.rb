class SongsController < ApplicationController
  #helper method for Song.find would be useful
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
      if @song.valid?
        @song.save
        redirect_to song_path(@song.id)
    else render :new
    end
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  #saves
  def update
    @song = Song.find_by(id: params[:id])
    @song.update(song_params)
      if @song.valid?
         redirect_to song_path(@song.id)
      else render :edit
      end
  end

  #test doesn't check for actual functionality, just controller action :(
  def destroy
    @song = Song.find_by(id: params[:id])
    @song.destroy
    redirect_to songs_path
  end

  def show
    @song = Song.find_by(id: params[:id])
    render :show
  end

  #made me v sad
  private
  def song_params
    params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
  end

end
