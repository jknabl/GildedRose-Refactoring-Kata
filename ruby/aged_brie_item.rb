class AgedBrieItem < GenericItem
  def initialize(item)
    super(item)
  end

  def initial_quality_increment
    @item.quality += 1 if @item.quality < 50
  end

  def post_quality_increment
    @item.quality += 1 if (@item.sell_in < 0 && @item.quality < 50)
  end
end