class GildedRose

  def initialize(items)
    @items = items
  end

  def update_aged_brie(item)
    item.quality += 1 if item.quality < 50
    
    item.sell_in -= 1

    item.quality += 1 if (item.sell_in < 0 && item.quality < 50)
  end

  def update_backstage_passes(item)
    if item.quality < 50
      item.quality = item.quality + 1
      
      if item.sell_in < 11
        item.quality += 1 if item.quality < 50
      end

      if item.sell_in < 6
        item.quality += 1 if item.quality < 50
      end
    end

    item.sell_in -= 1

    item.quality = 0 if item.sell_in < 0
  end
  
  def update_sulfuras(item)
    item.sell_in -= 1
  end

  def update_conjured(item)
    if item.quality == 1
      item.quality = 0 
    elsif item.quality > 0
      item.quality -= 2
    end    
    
    item.sell_in -= 1

    if item.sell_in < 0
      if [1,2,3].include? item.quality
        item.quality = 0
      elsif item.quality > 0
        item.quality -= 2
      end
    end
  end

  def update_generic(item)
    item.quality -= 1 if item.quality > 0

    item.sell_in -= 1

    if item.sell_in < 0
      item.quality -= 1 if item.quality > 0
    end
  end


  def update_quality
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        update_aged_brie(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        update_backstage_passes(item)
      when 'Sulfuras, Hand of Ragnaros'
        update_sulfuras(item)
      when 'Conjured'
        update_conjured(item)
      else
        update_generic(item)
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