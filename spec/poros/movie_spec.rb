require "rails_helper"

RSpec.describe "Movie" do 
  describe "attributes" do 
    it "has attributes" do 
      movie = Movie.new(title: "title", release_date: "2000-01-01", vote_count: 10, vote_average: 10.1, overview: "hello", tmdb_id: 15, genre_id: [2])

      expect(movie.title).to eq("title")
      expect(movie.release_date).to eq("2000-01-01")
      expect(movie.vote_count).to eq(10)
      expect(movie.vote_avg).to eq(10.1)
      expect(movie.overview).to eq("hello")
      expect(movie.tmdb_id).to eq(15)
      expect(move.genre_id).to eq([2])
    end 
  end 
end 