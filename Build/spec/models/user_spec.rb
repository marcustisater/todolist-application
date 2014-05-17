require 'spec_helper'

describe User do
  let(:valid_attributes) {
    {
      first_name: "Marcus",
      last_name: "Tisater",
      email: "Marcus.tisater@gmail.com",
      password: "woopwoop123",
      password_confirmation: "woopwoop123"
    }
  }
  context "validations" do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do 
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email (case insensitive)" do
      user.email = "MARCUS.TISATER@ELEV.IT-GYMNASIET.SE"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires the email address to look like an email" do
      user.email = "marcus"
      expect(user).to_not be_valid
    end
    
  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "MARCUS.TISATER@ELEV.IT-GYMNASIET.SE"))
      expect{ user.downcase_email }.to change{ user.email }.
        from("MARCUS.TISATER@ELEV.IT-GYMNASIET.SE").
        to("marcus.tisater@elev.it-gymnasiet.se")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "daniel.berg@it-gymnasiet.se"
      expect(user.save).to be_true
      expect(user.email).to eq("daniel.berg@it-gymnasiet.se")
    end
  end
end
