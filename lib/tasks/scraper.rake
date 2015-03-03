namespace :scraper do
	 desc "Fetch Craigslist posts from 3taps"
	 task scrape: :environment do
	  	require 'open-uri'
		require 'json'
		# Set auth_token
		auth_token = "75568c365f58526b44be35e9bfd2e5fa"
		polling_url = "http://polling.3taps.com/poll"
		
		# Specify request parameters
		
		params = {
			auth_token: auth_token,
			anchor: 1882120544,
			source: "CRAIG",
			category_group: "RRRR",
			category: "RHFR",
			'location.city' => "USA-NYM-BRL",
			retvals: "location,external_url,heading,body,timestamp,price,images,annotations"
		
		}
		
		# Prepare AIP request
		
		uri = URI.parse(polling_url)
		uri.query = URI.encode_www_form(params)
		
		# Submit request
		result = JSON.parse(open(uri).read)
		
		# Display result to screen
		puts JSON.pretty_generate result["postings"]
		# puts result["postings"].first["heading"]
	
		# Store the result
		# result["postings"].each do |posting|
		# 	# Create new post
		# 	@post = Post.new
		# 	@post.heading = posting["heading"]
		# 	@post.body = posting["body"]
		# 	@post.price = posting["price"]
		# 	@post.neighborhood = posting["location"]["locality"]
		# 	@post.external_url = posting["external_url"]
		# 	@post.timestamp = posting["timestamp"]
		# 	#@post.annotation = posting["annotation"]
	
		# 	# Save the post
		# 	@post.save
		# end
	end
	
	  desc "TODO"
	  task destroy_all_posts: :environment do
	  end
end
