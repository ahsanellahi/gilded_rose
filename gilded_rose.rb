class GildedRose
  QUALITY_UPPER_LIMIT = 50
  QUALITY_LOWER_LIMIT = 0

  attr_accessor :items, :item, :index, :factors

  def initialize(items)
    @items = items
    @factors = Hash.new(1)
  end

  def update_quality
    items.each_with_index do |item, index|
      @item = item
      @index = index

      set_item_sell_in

      case item.name
        when 'Aged Brie' then update_aged_brie_quality
        when 'Backstage passes to a TAFKAL8QUALITY_LOWER_LIMITETC concert' then update_backstage_passes_quality
        when 'Conjured Mana Cake' then update_conjured_quality
        else update_others_quality
      end

      set_item_quality_with_constraint
    end
  end

  private
    def update_aged_brie_quality
      item.quality = item.quality.succ if item.quality <= QUALITY_UPPER_LIMIT && item.quality > QUALITY_LOWER_LIMIT
    end

    def set_item_sell_in
      item.sell_in = item.sell_in - 1 unless item.name == 'Sulfuras, Hand of Ragnaros'
    end

    def update_backstage_passes_quality
      if item.quality <= QUALITY_UPPER_LIMIT && item.quality > QUALITY_LOWER_LIMIT
        item.quality = item.quality.succ
        item.quality = item.quality.succ if item.sell_in < 11 && item.sell_in > 5
        item.quality = item.quality + 2 if item.sell_in < 6
      end
    end

    def update_others_quality
      if item.quality <= QUALITY_UPPER_LIMIT && item.quality > QUALITY_LOWER_LIMIT
        item.quality = item.quality - factors[index]
        factors[index] = factors[index] * 2
      end
    end

    def update_conjured_quality
      if item.quality <= QUALITY_UPPER_LIMIT && item.quality > QUALITY_LOWER_LIMIT
        item.quality = item.quality - factors[index]
        factors[index] = factors[index] * 4
      end
    end

    def set_item_quality_with_constraint
      item.quality = QUALITY_LOWER_LIMIT unless item.quality > QUALITY_LOWER_LIMIT
      item.quality = QUALITY_UPPER_LIMIT if item.quality >= QUALITY_UPPER_LIMIT
    end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
