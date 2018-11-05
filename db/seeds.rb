10.times do
  Song.create({title: Faker::Music.album, released: true, release_year: Faker::Number.number(4), artist_name: Faker::Music.band, genre: Faker::Music.genre})
end
