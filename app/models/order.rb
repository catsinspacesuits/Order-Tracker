class Order < ApplicationRecord
	belongs_to :user
	validates :start_point, :restaurant_location, :customer_location, presence: { message: ": PLEASE FILL IN THIS FIELD!" }
	
	def start_to_restaurant_distance
	  Geolocation.new.distance(
	    start_point.split(',').map! { |e| e.to_f },
	    restaurant_location.split(',').map! { |e| e.to_f }
	  )
	end

	def restaurant_to_customer_distance
	  Geolocation.new.distance(
	    restaurant_location.split(',').map! { |e| e.to_f },
	    customer_location.split(',').map! { |e| e.to_f }
	  )
	end

	def total_distance
		start_to_restaurant_distance + restaurant_to_customer_distance
	end

	# allows for downloading of table
	def self.to_csv(options = {}) 
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |order|
				csv << order.attributes.values_at(*column_names)
			end
		end
	end
end
