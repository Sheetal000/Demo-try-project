require 'rails_helper'

RSpec.describe User, type: :model do
    it "should have belongs_to account" do
      t = User.reflect_on_association(:posts)
      expect(t.macro).to eq(:has_many)
    end

    it "is not valid without a account_id" do
    subject.name=nil
    expect(subject).to_not be_valid
    end
  
end
  