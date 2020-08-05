require 'rails_helper'

describe Item do
  describe '#create' do
    before do
      @item = build(:item)
    end

    it '全て入力されていればOK' do
      item = create(:item)
      expect(item).to be_valid
    end
    it 'nameが空ならNG' do
      @item.name = nil
      @item.valid?
      expect(@item.errors[:name]).to include("can't be blank")
    end
    it 'explainが空ならNG' do
      @item.description = nil
      @item.valid?
      expect(@item.errors[:description]).to include("can't be blank")
    end
    it 'priceが空ならNG' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end
    it 'priceが300円未満ならNG' do
      @item.price = '290'
      @item.valid?
      expect(@item.errors[:price]).to include('は300以上の値にしてください')
    end
    it 'priceが9999999円よりも高額ならNG' do
      @item.price = '19999999'
      @item.valid?
      expect(@item.errors[:price]).to include('は9999999以下の値にしてください')
    end
  end
end
