require 'rails_helper'

describe ApplicationRecord do

  it('exists') { expect(ApplicationRecord).to be_present }
  it('is abstract') { expect(ApplicationRecord.abstract_class).to be(true) }

end