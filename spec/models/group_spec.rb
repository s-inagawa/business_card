require 'spec_helper'

describe Group do
  pending "add some examples to (or delete) #{__FILE__}"

  describe :name do
    context '入力値=MAXの場合、正常' do
      subject{ build(:group_1) }
      its(:valid?){ should be_true }
    end

    context '入力値=MAX+1の場合、異常' do
      subject{ build(:group_1, name: 'あ' * (30 + 1)) }
      its(:valid?){ should be_false }
    end

    context '入力値=nilの場合、異常' do
      subject{ build(:group_1, name: nil) }
      its(:valid?){ should be_false }
    end
  end
end
