require 'rails_helper'

RSpec.describe Dogrun, type: :model do
  
  it "dogran_name,address,area,prがあれば登録できる" do 
    expect(FactoryBot.create(:dogrun)).to be_valid
  end 

  it "dogrun_nameがなければ登録できない" do 
    expect(FactoryBot.build(:dogrun, dogrun_name: "")).to_not be_valid 
  end 

  it "addressがなければ登録できない" do 
    expect(FactoryBot.build(:dogrun, address: "")).to_not be_valid 
  end 

  it "prがなければ登録できない" do 
    expect(FactoryBot.build(:dogrun, pr: "")).to_not be_valid 
  end 

  it "areaがなければ登録できない" do 
    expect(FactoryBot.build(:dogrun, area: "")).to_not be_valid 
  end 
end
