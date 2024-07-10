# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
Animal.destroy_all
User.destroy_all

user = User.create!(email: 'test@test.com', password: '123456')


species_images = {
  'cat' => 'https://static.vecteezy.com/ti/photos-gratuite/p1/7234162-bengale-chat-reposant-sur-le-canape-drole-avec-des-lunettes-photo.jpg',
  'dog' => 'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*',
  'fish' => 'https://disneyinsideblog.files.wordpress.com/2017/03/finding-nemo-17.jpg?w=640',
  'reptile' => 'https://d2csxpduxe849s.cloudfront.net/media/E32629C6-9347-4F84-81FEAEF7BFA342B3/09C4C0B3-A8D5-45A3-985851EB6865483B/98D9CF42-D227-44F8-84567256B6BCFF3D/WebsiteJpg_XL-FARMS_Main%20Visual_Green_Website.jpg',
  'rodent' => 'https://cdn.britannica.com/36/145636-050-586F0C8E/groups-outbreaks-plague-grasshopper-mouse-prairie-dogs.jpg',
  'bird' => 'https://t3.ftcdn.net/jpg/05/63/70/98/360_F_563709848_OdMVkfRpOZbSsy6bFBkthhJzleFxM7Cn.jpg'
}

species_list = species_images.keys

40.times do
  species = species_list.sample
  photo_url = species_images[species]

  Animal.create!(
    nom: Faker::Creature::Animal.name,
    especes: species,
    age: rand(1..15),
    localisation: Faker::Address.city,
    prix: rand(10..100),
    user: user,
    photo_url: photo_url
  )
  puts "Des animaux ont été créés avec l'espèce #{species} et la photo #{photo_url}"
end
