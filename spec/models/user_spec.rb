require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'パスワードに英文字と数字の両方を含む必要がある' do
        @user.password = 'password123'
        @user.password_confirmation = 'password123'
        expect(@user).to be_valid
      end
      it 'すべて条件をクリアすれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''  # passwordの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'birthが空では登録できない' do
      @user.birth = ''  # birthの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''  # family_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください")
    end
    it 'family_nameに半角文字が含まれていると登録できない' do
      @user.family_name = 'Smith'  # 半角文字を含むfamily_nameを設定
      @user.valid?
      expect(@user.errors.full_messages).to include("名字は不正な値です")
    end
    it 'k_family_nameが空では登録できない' do
      @user.k_family_name = ''  # k_family_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("カナ名字を入力してください")
    end
    it 'k_family_nameにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.k_family_name = '山田'  # カタカナ以外の文字を含むk_family_nameを設定
      @user.valid?
      expect(@user.errors.full_messages).to include("カナ名字は不正な値です")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''  # first_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end
    it 'first_nameに半角文字が含まれていると登録できない' do
      @user.first_name = 'John'  # 半角文字を含むfirst_nameを設定
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は不正な値です")
    end
    it 'k_first_nameが空では登録できない' do
      @user.k_first_name = ''  # k_first_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("カナ名前を入力してください")
    end
    it 'k_first_nameにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.k_first_name = 'やまだ'  # カタカナ以外の文字を含むk_first_nameを設定
      @user.valid?
      expect(@user.errors.full_messages).to include("カナ名前は不正な値です")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000' 
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含む必要があります')
    end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含む必要があります")
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'password'  # 例：英字のみのパスワード
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含む必要があります")
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含む必要があります")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'パスワード123'  # 例：全角文字を含むパスワード
        @user.password_confirmation = 'パスワード123'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含む必要があります")
      end
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
end
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'invalid_email.com'  # @を含まない無効なメールアドレス
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
    end
  end
end