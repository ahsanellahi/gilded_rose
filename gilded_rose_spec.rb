require './gilded_rose.rb'

describe GildedRose do
  describe '# update_quality' do
    it 'Test Other Items' do
      items = [Item.new(name ='+5 Dexterity Vest', sell_in = 3, quality = 20), Item.new(name ='+5 Dexterity Vest', sell_in = 3, quality = 15), Item.new(name ='Elixir of the Mongoose', sell_in = 3, quality = 2)]

      gilded_rose = GildedRose.new(items)

      gilded_rose.update_quality
      expect(items[0].quality).to eq 19
      expect(items[1].quality).to eq 14
      expect(items[2].quality).to eq 1

      gilded_rose.update_quality
      expect(items[0].quality).to eq 17
      expect(items[1].quality).to eq 12
      expect(items[2].quality).to eq 0
    end

    it 'test Aged Brie' do
      items = [
        Item.new(name ='Aged Brie', sell_in = 3, quality = 20),
        Item.new(name ='Aged Brie', sell_in = 3, quality = 0)
      ]

      gilded_rose = GildedRose.new(items)

      gilded_rose.update_quality
      expect(items[0].quality).to eq 21
      expect(items[1].quality).to eq 1
    end

    it 'test Sulfuras, Hand of Ragnaros' do
      items = [
        Item.new(name ='Sulfuras, Hand of Ragnaros', sell_in = 3, quality = 20),
        Item.new(name ='Sulfuras, Hand of Ragnaros', sell_in = 3, quality = 0)
      ]

      gilded_rose = GildedRose.new(items)

      gilded_rose.update_quality
      expect(items[0].quality).to eq 20
      expect(items[1].quality).to eq 0
    end

    it 'test Backstage passes to a TAFKAL80ETC concert' do
      items = [
        Item.new(name ='Backstage passes to a TAFKAL80ETC concert', sell_in = 3, quality = 20),
        Item.new(name ='Backstage passes to a TAFKAL80ETC concert', sell_in = 7, quality = 20),
        Item.new(name ='Backstage passes to a TAFKAL80ETC concert', sell_in = 12, quality = 20),
        Item.new(name ='Backstage passes to a TAFKAL80ETC concert', sell_in = 3, quality = 0)
      ]

      gilded_rose = GildedRose.new(items)

      gilded_rose.update_quality
      expect(items[0].quality).to eq 23
      expect(items[1].quality).to eq 22
      expect(items[2].quality).to eq 21
      expect(items[3].quality).to eq 3

    end

    it 'test Conjured Mana Cake' do
      items = [
        Item.new(name ='Conjured Mana Cake', sell_in = 3, quality = 20),
        Item.new(name ='Conjured Mana Cake', sell_in = 3, quality = 0)
      ]

      gilded_rose = GildedRose.new(items)

      gilded_rose.update_quality
      expect(items[0].quality).to eq 19
      expect(items[1].quality).to eq 0
      gilded_rose.update_quality
      expect(items[0].quality).to eq 15
      expect(items[1].quality).to eq 0
    end
  end
end
