require 'rails_helper'

RSpec.describe User, type: :model do
  context 'should validate' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }

    it 'should allow a space in a first name' do
      user = build(:user, first_name: "Mary Beth")
      expect(user.valid?).to be true
    end

    it 'should allow a dash in a first name' do
      user = build(:user, first_name: "Mary-Beth")
      expect(user.valid?).to be true
    end

    it 'should allow a space in a last name' do
      user = build(:user, last_name: "Combined Name")
      expect(user.valid?).to be true
    end

    it 'should allow a dash in a last name' do
      user = build(:user, last_name: "Combined-Name")
      expect(user.valid?).to be true
    end
  end
end
