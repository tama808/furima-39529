require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''  # passwordの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'birthが空では登録できない' do
      @user.birth = ''  # birthの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''  # family_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'k_family_nameが空では登録できない' do
      @user.k_family_name = ''  # k_family_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("K family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''  # first_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'k_first_nameが空では登録できない' do
      @user.k_first_name = ''  # k_first_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("K first name can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000' 
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードに英文字と数字の両方を含む必要がある' do
        @user.password = 'password123'
        @user.password_confirmation = 'password123'
        expect(@user).to be_valid
      end
      it 'すべて条件をクリアすれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end
