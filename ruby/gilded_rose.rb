class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        ItemFactory.new(item).update
      when 'Backstage passes to a TAFKAL80ETC concert'
        ItemFactory.new(item).update
      when 'Sulfuras, Hand of Ragnaros'
        ItemFactory.new(item).update
      when 'Conjured'
        ItemFactory.new(item).update
      else
        ItemFactory.new(item).update
      end
    end
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