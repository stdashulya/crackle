require "spec_helper"

describe User do

  subject { create :user }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:username) }
  it { should_not allow_value("123").for(:password) }
  it { should allow_value("123123").for(:password) }
end