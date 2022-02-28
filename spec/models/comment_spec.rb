require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "contents,titleがあれば登録できる" do
    expect(FactoryBot.create(:comment)).to be_valid
  end

  it "contentsがなければ登録できない" do
    expect(FactoryBot.build(:comment, contents: "")).not_to be_valid
  end

  it "titleがなければ登録できない" do
    expect(FactoryBot.build(:comment, title: "")).not_to be_valid
  end
end
