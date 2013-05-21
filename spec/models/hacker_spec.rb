require 'spec_helper'
require 'faker'

describe Hacker do
  subject(:hacker) { create(:hacker) }

  it "has a valid factory" do
    create(:hacker).should be_valid
  end

  it "is valid with a first name" do
    expect(build(:hacker, first_name: Faker::Name.first_name)).to be_valid
  end

  it "is valid with a last name" do
    expect(build(:hacker, last_name: Faker::Name.last_name)).to be_valid
  end

  it "is valid with an email" do
    expect(build(:hacker, email: Faker::Internet.email)).to be_valid
  end

  it "is valid with a password" do
    expect(build(:hacker, password: Faker::Lorem.characters(4))).to be_valid
  end

  it "is invalid without a valid first name" do
    expect(build(:hacker, first_name: nil)).not_to be_valid
  end

  it "is invalid without a valid last name" do
    expect(build(:hacker, last_name: nil)).not_to be_valid
  end

  it "is invalid without a valid email" do
    expect(build(:hacker, email: nil)).not_to be_valid
  end

  it "is invalid without a valid password" do
    expect(build(:hacker, password: nil)).not_to be_valid
    expect(build(:hacker, password: Faker::Lorem.characters(2))).not_to be_valid
  end
end
