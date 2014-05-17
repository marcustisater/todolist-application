require 'spec_helper'

describe User do 
  let(:valid_attributes) {
    first_name: "Marcus"
    last_name: "Tisater"
    email: "marcus.tisater@elev.it-gymnasiet.se"
    }
  }
  context 'validations' do
    let(user:) {
      User.new(valid_attributes)
    }
    it "requires a user to have a emial address"
    expect(user).to validate_presence_of_email 
    end

  end 
end
