require 'rails_helper'

describe User do
	context "associations exist"
	describe User, type: :model do
	  it { should have_many(:orders) }
	end
end