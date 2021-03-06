require 'spec_helper'

describe NameCard do
  describe :name do
    context '入力値=MAXの場合、正常' do
      subject{ build(:name_card_1, name: 'あ' * 100) }
      its(:valid?){ should be_true }
    end

    context '入力値=MAX+1の場合、異常' do
      subject{ build(:name_card_1, name: 'あ' * (100 + 1)) }
      its(:valid?){ should be_false }
    end

    context '入力値=nilの場合、異常' do
      subject{ build(:name_card_1, name: nil) }
      its(:valid?){ should be_false }
    end
  end

  describe :address do
    context '入力値=MAXの場合、正常' do
      subject{ build(:name_card_1, address: 'あ' * 10000) }
      its(:valid?){ should be_true }
    end

    context '入力値=MAX+1の場合、異常' do
      subject{ build(:name_card_1, address: 'あ' * (10000 + 1)) }
      its(:valid?){ should be_false }
    end

    context '入力値=nilの場合、異常' do
      subject{ build(:name_card_1, address: nil) }
      its(:valid?){ should be_false }
    end
  end

  describe :tel do
    context 'フォーマットエラー(0)の場合、異常' do
      subject{ build(:name_card_1, tel: '0' )}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0)の場合、異常' do
      subject{ build(:name_card_1, tel: '0-0' )}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0-0)の場合、異常' do
      subject{ build(:name_card_1, tel: '0-0-0' )}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0-0-0)の場合、異常' do
      subject{ build(:name_card_1, tel: '0-0-0-0' )}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(00000-00-0000)の場合、異常' do
      subject{ build(:name_card_1, tel: '00000-00-0000')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(000-00000-000)の場合、異常' do
      subject{ build(:name_card_1, tel: '000-00000-000')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0000-00-00)の場合、異常' do
      subject{ build(:name_card_1, tel: '0000-00-00')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(000-00000-00000)の場合、異常' do
      subject{ build(:name_card_1, tel: '000-00000-00000')}
      its(:valid?){ should be_false }
    end

    context '入力値=nilの場合、正常' do
      subject{ build(:name_card_1, tel: nil) }
      its(:valid?){ should be_false }
    end
  end

  describe :fax do
    context 'フォーマットエラー(0)の場合、異常' do
      subject{ build(:name_card_1, fax: '0')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0)の場合、異常' do
      subject{ build(:name_card_1, fax: '0-0')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0-0)の場合、異常' do
      subject{ build(:name_card_1, fax: '0-0-0')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0-0-0)の場合、異常' do
      subject{ build(:name_card_1, fax: '0-0-0-0')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(00000-00-0000)の場合、異常' do
      subject{ build(:name_card_1, fax: '00000-00-0000')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(000-00000-000)の場合、異常' do
      subject{ build(:name_card_1, fax: '000-00000-000')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0000-00-00)の場合、異常' do
      subject{ build(:name_card_1, fax: '0000-00-00')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(000-00000-00000)の場合、異常' do
      subject{ build(:name_card_1, fax: '000-00000-00000')}
      its(:valid?){ should be_false }
    end

    context '入力値=nilの場合、正常' do
      subject{ build(:name_card_1, fax: nil) }
      its(:valid?){ should be_false }
    end
  end

  describe :url do
    context '入力値=nilの場合、正常' do
      subject{ build(:name_card_1, url: nil) }
      its(:valid?){ should be_true }
    end

    context 'httpの場合、正常' do
      subject{ build(:name_card_1, url: 'http://hogehoge')}
      its(:valid?){ should be_true }
    end

    context 'httpsの場合、正常' do
      subject{ build(:name_card_1, url: 'https://hogehoge')}
      its(:valid?){ should be_true }
    end

    context '100文字の場合、正常' do
      subject{ build(:name_card_1, url: 'http://'.concat( ('h' * 93) ))}
      its(:valid?){ should be_true }
    end

    context 'フォーマットエラー(http,https以外)の場合、異常' do
      subject{ build(:name_card_1, url: 'hogehoge')}
      its(:valid?){ should be_false }
    end

    context '101文字以上の場合、異常' do
      subject{ build(:name_card_1, url: 'http://'.concat( ('h' * 94) ))}
      its(:valid?){ should be_false }
    end
  end
end
