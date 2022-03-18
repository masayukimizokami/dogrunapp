require 'rails_helper'

RSpec.describe Dogrun, type: :model do
  it "dogran_name,address,area,prがあれば登録できる" do
    expect(FactoryBot.create(:dogrun)).to be_valid
  end
  
  it "dogrun_nameがなければ登録できない" do
    expect(FactoryBot.build(:dogrun, dogrun_name: "")).not_to be_valid
  end

  it "addressがなければ登録できない" do
    expect(FactoryBot.build(:dogrun, address: "")).not_to be_valid
  end

  it "prがなければ登録できない" do
    expect(FactoryBot.build(:dogrun, pr: "")).not_to be_valid
  end
  it 'prが50文字以下であること' do
    dogrun = Dogrun.new(dogrun_name: "a" * 51)
    expect(dogrun).to be_invalid
  end

  it "areaがなければ登録できない" do
    expect(FactoryBot.build(:dogrun, area: "")).not_to be_valid
  end

  describe 'バリデーションのテスト' do
    # factoriesで作成したダミーデータを使用します。
    let(:user) { FactoryBot.create(:user) }
    let!(:dogrun) { build(:dogrun, user_id: user.id) }

    subject { test_dogrun.valid? }
    let(:test_dogrun) { dogrun }

    context 'dogrun_nameカラム' do
      it '空欄でないこと' do
        test_dogrun.dogrun_name = ''
        is_expected.to eq false;
      end
      it 'dogrun_nameが30文字以下であること' do
        dogrun = Dogrun.new(dogrun_name: "a" * 31)
        expect(dogrun).to be_invalid
      end
    end

    context 'addressカラム' do
      it '空欄でないこと' do
        test_dogrun.address = ''
        is_expected.to eq false;
      end
      it 'addressが50文字以下であること' do
        dogrun = Dogrun.new(address: "a" * 51)
        expect(dogrun).to be_invalid
      end
    end

    context 'prカラム' do
      it '空欄でないこと' do
        test_dogrun.pr = ''
        is_expected.to eq false;
      end
      it 'prが70文字以下であること' do
        dogrun = Dogrun.new(pr: "a" * 71)
        expect(dogrun).to be_invalid
      end
    end

    context 'areaカラム' do
      it '空欄でないこと' do
        test_dogrun.area = ''
        is_expected.to eq false;
      end
    end

  end
  describe 'アソシエーションのテスト' do
    context 'customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Dogrun.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

  end
end
