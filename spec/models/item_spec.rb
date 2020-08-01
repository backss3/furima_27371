require 'rails_helper'

describe Item do
  describe '#create' do
    it "全て入力されていればOK" do
      item = create(:item)
      expect(item).to be_valid
    end
    it "nameが空ならNG" do
      item = build(:item, name: nil)
      item.valid?
      expect(iten.errors[:name]).to include("can't be blank")
    end
    it "explainが空ならNG" do
      item = build(:item, explain: nil)
      item.valid?
      expect(item.errors[:explain]).to include("can't be blank")
    end
    it "priceが空ならNG" do
      item = build(:item, price: nil)
      item.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
    it "priceがinteger以外ならNG" do
      item = build(:item, price: "３００")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
    it "priceが300円未満ならNG" do
      item = build(:item, price: "290")
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end
    it "priceが9999999円よりも高額ならNG" do
      item = build(:item, price: "19999999")
      item.valid?
      expect(item.errors[:price]).to include("は9999999以下の値にしてください")
    end
  end
end