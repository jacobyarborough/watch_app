require "rails_helper" 

RSpec.describe "shelf" do 
  before(:each) do 
    shelf = Shelf.new(type: "Movie")
    movie1 = Movie.new(title: "title", release_date: "2000-01-01", vote_count: 10, vote_average: 10.1, overview: "hello", tmdb_id: 15, genre_id: [2])
    movie2 = Movie.new(title: "title2", release_date: "2000-01-02", vote_count: 12, vote_average: 10.3, overview: "hi", tmdb_id: 16, genre_id: [3])
  end 
  describe "attributes" do 
    it "has attributes" do 
      expect(shelf.type).to eq("Movie")
      expect(shelf.contents).to eq([])
    end 
  end 

  describe "instance methods" do 
    describe "#add_movie" do 
      it "adds a movie to the contents array" do 
        shelf.add_movie(movie1)
        shelf.add_movie(movie2)
        
        expect(shelf.contents).to eq([movie1,movie2])
      end 
    end 
  end 
end 