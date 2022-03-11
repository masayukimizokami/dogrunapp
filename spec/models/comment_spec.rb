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

  describe 'バリデーションのテスト' do
    # factoriesで作成したダミーデータを使用します。
    let(:user) { FactoryBot.create(:user) }
    let!(:comment) { build(:comment, user_id: user.id) }

    subject { test_comment.valid? }
    let(:test_comment) { comment }

    context 'titleカラム' do
      it '空欄でないこと' do
        test_comment.title = ''
        is_expected.to eq false;
      end
      it 'titleが20文字以下であること' do
        comment = Comment.new(title: "a" * 21)
        expect(comment).to be_invalid
      end
    end

    context 'contentsカラム' do
      it '空欄でないこと' do
        test_comment.contents = ''
        is_expected.to eq false;
      end
      it 'contentsが100文字以下であること' do
        comment = Comment.new(contents: "a" * 101)
        expect(comment).to be_invalid
      end
    end

    describe 'アソシエーションのテスト' do
      context 'customerモデルとの関係' do
        it 'N:1となっている' do
          expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
        end
      end
    end
  end
end
