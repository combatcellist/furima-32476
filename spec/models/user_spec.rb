require 'rails_helper'

describe User do
 before do
   @user = FactoryBot.build(:user)
 end

  it "nicknameがない場合は登録できない" do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it "emailがない場合は登録できない" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it "emailに@がなければ登録できない" do
    @user.email = "example.com"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end

  it "重複したemailが存在する場合は登録できない" do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end
  
  it "passwordがない場合は登録できない" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it "password_confirmationが不一致の場合は登録できない" do
    @user.password = "123456"
    @user.password_confirmation = "1234567"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "passwordが５文字以下なら登録できない" do
    @user.password = "12345"
    @user.password_confirmation = "12345"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  it "family_nameがない場合は登録できない" do
    @user.family_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name can't be blank")
  end

  it "family_name_kanaがない場合は登録できない" do
    @user.family_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana can't be blank")
  end

  it "family_nameが全角入力でなければ登録できない" do
    @user.family_name = "ｱｲｳｴｵ"
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name is invalid")
  end
  

  it "first_nameがない場合は登録できない" do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it "first_name_kanaがない場合は登録できない" do
    @user.family_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana can't be blank")
  end

  it "birth_dateがない場合は登録できない" do
    @user.birth_date = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth date can't be blank")
  end






end
