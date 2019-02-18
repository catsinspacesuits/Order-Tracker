require 'rails_helper'

describe User do
	context "associations exist"
	describe User, type: :model do
	  it { should have_many(:orders) }
	end

	it 'is an ApplicationRecord' do
	  is_expected.to be_an(ApplicationRecord)
	end

	describe 'database' do

    it 'has columns' do
      is_expected.to have_db_column(:id).of_type(:integer)
      is_expected.to have_db_column(:email).of_type(:string).with_options(default: nil)
      is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(default: nil)
      is_expected.to have_db_column(:remember_created_at).of_type(:datetime)
      is_expected.to have_db_column(:created_at).of_type(:datetime)
      is_expected.to have_db_column(:updated_at).of_type(:datetime)
    end

    it 'has indexes' do
      is_expected.to have_db_index(:email).unique(true)
    end
  end

	  # Devise

  it 'includes Devise modules' do
    modules = [
      Devise::Models::DatabaseAuthenticatable,
      Devise::Models::Recoverable,
      Devise::Models::Registerable,
      Devise::Models::Rememberable,
      Devise::Models::Validatable
    ]
  end
end