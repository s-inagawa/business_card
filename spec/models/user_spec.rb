require 'spec_helper'

describe User do
  describe :name do
    context '入力値=MAXの場合、正常' do
      subject{ build(:user_1, name: 'あ' * 100) }
      its(:valid?){ should be_true }
    end

    context '入力値=MAX+1の場合、異常' do
      subject{ build(:user_1, name: 'あ' * (100 + 1)) }
      its(:valid?){ should be_false }
    end

    context '入力値=nilの場合、異常' do
      subject{ build(:user_1, name: nil) }
      its(:valid?){ should be_false }
    end
  end

  describe :tel do
    context 'フォーマットエラー(0)の場合、異常' do
      subject{ build(:user_1, tel: '0' )}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0)の場合、異常' do
      subject{ build(:user_1, tel: '0-0' )}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0-0)の場合、異常' do
      subject{ build(:user_1, tel: '0-0-0' )}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0-0-0)の場合、異常' do
      subject{ build(:user_1, tel: '0-0-0-0' )}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(00000-00-0000)の場合、異常' do
      subject{ build(:user_1, tel: '00000-00-0000')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(000-00000-000)の場合、異常' do
      subject{ build(:user_1, tel: '000-00000-000')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0000-00-00)の場合、異常' do
      subject{ build(:user_1, tel: '0000-00-00')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(000-00000-00000)の場合、異常' do
      subject{ build(:user_1, tel: '000-00000-00000')}
      its(:valid?){ should be_false }
    end

    context '入力値=nilの場合、正常' do
      subject{ build(:user_1, tel: nil) }
      its(:valid?){ should be_false }
    end
  end

  describe :mail do
    conetext '入力値=nilの場合、正常' do
      subject{ build(:user_1, mail: nil) }
      its(:valid?){ should be_true }
    end

    conetext '入力値=6文字未満の場合、異常' do
      subject{ build(:user_1, mail: 'a@a.j') }
      its(:valid?){ should be_true }
    end

    conetext '入力値=MAXの場合、正常' do
      subject{ build(:user_1, mail: ('a' * 88) + '@example.com') }
      its(:valid?){ should be_true }
    end

    conetext '入力値=MAX+1の場合、正常' do
      subject{ build(:user_1, mail: ('a' * 89) + '@example.com') }
      its(:valid?){ should be_false }
    end

    conetext 'ドメインがない場合、異常' do
      subject{ build(:user_1, mail: '@example.com') }
      its(:valid?){ should be_false }
    end

    conetext '@がない場合、異常' do
      subject{ build(:user_1, mail: 'aexample.com') }
      its(:valid?){ should be_false }
    end

    conetext 'ホストがない場合、異常' do
      subject{ build(:user_1, mail: 'a@') }
      its(:valid?){ should be_false }
    end

    conetext 'ホストが不正な場合、異常' do
      subject{ build(:user_1, mail: 'a@example') }
      its(:valid?){ should be_false }
    end

    conetext '入力値=6文字未満の場合、異常' do
      subject{ build(:user_1, mail: 'a@a.j') }
      its(:valid?){ should be_true }
    end
  end
end
