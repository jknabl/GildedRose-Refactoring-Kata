class ItemFactory
  def initialize(item)
    @klass = determine_item_class(item)
    @item = @klass.new(item)
  end

  def name
    @item.name
  end

  def sell_in
    @item.sell_in
  end

  def quality
    @item.quality
  end

  def initial_quality_increment
    @item.initial_quality_increment
  end

  def sell_in_increment
    @item.sell_in_increment
  end

  def post_quality_increment
    @item.post_quality_increment
  end

  def update
    @item.update
  end

  def determine_item_class(item)
    case item.name
      when 'Aged Brie'
        AgedBrieItem
      when 'Backstage passes to a TAFKAL80ETC concert'
        BackstagePassesItem
      when 'Sulfuras, Hand of Ragnaros'
        SulfurasItem
      when 'Conjured'
        ConjuredItem
      else
        GenericItem
    end
  end
end