class MusicLibraryController

  attr_accessor :path, :files, :alph_song_list, :alph_artist_list, :alph_genre_list

  def initialize(path = "./db/mp3s") 
    
    x = MusicImporter.new(path)
    x.import
  end 

  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    x = gets.strip
    list_songs if x == 'list songs'
    list_artists if x == 'list artists'
    list_genres if x == 'list genres'
    list_songs_by_artist if x == 'list artist'
    list_songs_by_genre if x == 'list genre'
    play_song if x == "play song"
    call if x != "exit"
  end 

  def list_songs 
    @alph_song_list = Song.all.sort_by{|song| song.name}
    y = 1 
    @alph_song_list.each do |song|
      puts "#{y}. #{song}"
      y += 1
    end 
  end
  
  def list_artists 
    
  end 
  
  def list_genres 
    
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    a = gets.strip
    b = Genre.all.find {|genre| genre.name == a}
    if b 
      c = b.songs.sort_by{|song| song.name} 
      y = 1
      c.each do |song|
        puts "#{y}. #{song.artist.name} - #{song.name}"
        y += 1 
      end 
    else 
    end 
  end 
  
  def list_songs_by_artist 
    puts "Please enter the name of an artist:"
    a = gets.strip
    b = Artist.all.find {|artist| artist.name == a}
    if b 
      c = b.songs.sort_by{|song| song.name} 
      y = 1
      c.each do |song|
        puts "#{y}. #{song.name} - #"{song.genre.name}"
        y += 1 
      end 
    else 
    end 
  end 

  
#  def play_song 
#    puts "Which song number would you like to play?"
#    a = gets.strip.to_i 
#    if a > 0 && a <= Song.all.length 
#      puts "Playing #{@alph_song_list[@selected_song_number - 1].name} by #{@alph_song_list[@selected_song_number - 1].artist}"
#    else 
#    end 
#  end 
end 