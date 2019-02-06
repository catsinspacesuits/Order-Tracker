require 'rails_helper'

describe Order do
  context "all coordinates present" do
    let(:order) { Order.new(start_point: "52.5200, 13.4050", restaurant_location: "52.6200, 13.4050", customer_location: "52.5200, 13.4750" ) }

    it "should return sum of distances" do
      expect(order.total_distance.round(4)).to eq 23203.5267
    end

    it "should return distance to customer only" do
      expect(order.total_distance).to eq "1.5"
    end

    it "should return distance to restaurant only" do
      expect(order.total_distance).to eq "2.3"
    end
  end
  
  context "no coordinates present" do 
    let(:order) { Order.new(start_point: "0", restaurant_location: "0", customer_location: "0" ) }
    
    it "should return nothing" do
      expect(order.total_distance).to eq 0
    end
  end
end