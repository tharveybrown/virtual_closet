# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ClothesOutfit.delete_all
Clothe.delete_all
Outfit.delete_all
Closet.delete_all
User.delete_all

user = User.create(email: "tharveybrown@gmail.com", password: "Welcome1")
closet = Closet.create(user_id: user.id)

c = Clothe.create(closet_id: closet.id, clothing_type: "shirt")
c2 = Clothe.create(closet_id: closet.id, clothing_type: "pants")
o = Outfit.create(closet_id: closet.id)
# o.clothes << c 
# o.clothes << c 
o.clothes << c2