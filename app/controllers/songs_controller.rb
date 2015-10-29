class SongsController < ApplicationController

  #its going to look for a folder called songs in the view
  #then its going to look for a file in that folder called index,
  #show, etc

  def index
    #if there is nothing here, it will try to find a view.  If there is no, view, it will error w/ missing template
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path
    else
      flash.now[:errors] = "Do it right!"
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    #find the song
    #replace the old params
    @song = Song.find(params[:id])
    if @song.update(song_params) #<--called strong params
      redirect_to @song
    else
      flash.now[:errors] = @song.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    song = Song.destroy(params[:id])
    song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    #this is called 'strong params'.  take the pramas, from the #params, require the key song and permit.  in this case, title
    #and artist
    params.require(:song).permit(:title, :artist)
  end


end
