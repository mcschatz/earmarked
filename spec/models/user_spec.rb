require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {
    User.create(first_name: "Donald", last_name: "Trump", email: "trump@luxury.com", username: "therealtrump", password: "password", password_confirmation: "password")
  }
  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid without a first name" do
    user.first_name = nil
    expect(user).to be_invalid
  end

  it "is invalid without a last name" do
    user.last_name = nil
    expect(user).to be_invalid
  end

  it "is invalid without a email" do
    user.email = nil
    expect(user).to be_invalid
  end

  it "is invalid without a username" do
    user.username = nil
    expect(user).to be_invalid
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user).to be_invalid
  end

  it "is invalid with a matching confirmation password" do
    user.password_confirmation = nil
    expect(user).to be_invalid
  end

  it "is invalid with short password" do
    user.password = "fail"
    expect(user).to be_invalid
  end

  it "is invalid with random string for email" do
    user.email = "asdlkfjalgalwrg"
    expect(user).to be_invalid
  end

  it "must have a reference an order" do
    user.orders.build(total: 200, user_id: user.id, status: "completed")
    expect(user.orders.map(&:total)).to eq([200])
    expect(user.orders.map(&:status)).to eq(['completed'])
    expect(user.orders.map(&:user_id)).to eq([user.id])
  end
end
