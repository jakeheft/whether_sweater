require 'rails_helper'

describe Image do
	it 'exists with attributes' do
		data = {
			id: 'chaqHXlOzYs',
 			created_at: '2018-02-23T17:18:23-05:00',
 			updated_at: '2021-01-18T11:26:34-05:00',
 			promoted_at: nil,
 			width: 6000,
 			height: 4000,
 			color: '#0c2626',
 			blur_hash: 'LRCP|u9F9F%M~qD%IUx]-;MxWBof',
 			description: 'Walking the streets of downtown Denver on a foggy, freezing cold day.',
 			alt_description: 'woman walking on street near SUV during daytime',
 			urls:  {
				 raw: 'https://images.unsplash.com/photo-1519424187720-db6d0fc5a5d2?ixid=MXwxOTg5MTl8MHwxfHNlYXJjaHwxfHxsb2NhdGlvbjolMjBkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1',
   			full: 'https://images.unsplash.com/photo-1519424187720-db6d0fc5a5d2?crop=entropy&cs=srgb&fm=jpg&ixid=MXwxOTg5MTl8MHwxfHNlYXJjaHwxfHxsb2NhdGlvbjolMjBkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1&q=85',
   			regular: 'https://images.unsplash.com/photo-1519424187720-db6d0fc5a5d2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTg5MTl8MHwxfHNlYXJjaHwxfHxsb2NhdGlvbjolMjBkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=1080',
   			small: 'https://images.unsplash.com/photo-1519424187720-db6d0fc5a5d2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTg5MTl8MHwxfHNlYXJjaHwxfHxsb2NhdGlvbjolMjBkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=400',
   			thumb: 'https://images.unsplash.com/photo-1519424187720-db6d0fc5a5d2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTg5MTl8MHwxfHNlYXJjaHwxfHxsb2NhdGlvbjolMjBkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=200'},
 			links:  {
				self: 'https://api.unsplash.com/photos/chaqHXlOzYs', 
				html: 'https://unsplash.com/photos/chaqHXlOzYs', 
				download: 'https://unsplash.com/photos/chaqHXlOzYs/download', 
				download_location: 'https://api.unsplash.com/photos/chaqHXlOzYs/download'
			},
 			categories: [],
 			likes: 136,
 			liked_by_user: false,
 			current_user_collections: [],
 			sponsorship: nil,
 			user:  {
				id: 'R9wpgxVwO48',
   			updated_at: '2021-01-18T00:01:40-05:00',
   			username: 'owencavlys',
   			name: 'Owen Lystrup',
   			first_name: 'Owen',
   			last_name: 'Lystrup',
   			twitter_username: 'owen_lystrup',
   			portfolio_url: 'https://owenlystrup.com',
   			bio: "Photographer, writer, editor, creative director. \r\n See more of my photography here: instagram.com/@owencavlys/  See my writing here: medium.com/cisco-shifted",
   			location: 'Denver, by way of Mojave, San Francisco, and Los Angeles',
   			links:  {
					self: 'https://api.unsplash.com/users/owencavlys',
     			html: 'https://unsplash.com/@owencavlys',
     			photos: 'https://api.unsplash.com/users/owencavlys/photos',
     			likes: 'https://api.unsplash.com/users/owencavlys/likes',
     			portfolio: 'https://api.unsplash.com/users/owencavlys/portfolio',
     			following: 'https://api.unsplash.com/users/owencavlys/following',
					followers: 'https://api.unsplash.com/users/owencavlys/followers'
				},
			}
		}
		location = 'bozeman,mt'
		image = Image.new(data, location)
		
		expect(image.location).to eq('bozeman,mt')
		expect(image.image_url).to eq('https://images.unsplash.com/photo-1519424187720-db6d0fc5a5d2?ixid=MXwxOTg5MTl8MHwxfHNlYXJjaHwxfHxsb2NhdGlvbjolMjBkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1')
		expect(image.photographer).to eq('Owen Lystrup')
		expect(image.photographer_url).to eq('https://unsplash.com/@owencavlys')
		expect(image.site_credit).to eq('Image from Unsplash')
	end
end