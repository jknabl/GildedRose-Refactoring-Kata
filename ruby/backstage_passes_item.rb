class BackstagePassesItem < GenericItem
  def initialize(item)
    super(item)
  end

  def initial_quality_increment
    if @item.quality < 50
      @item.quality = @item.quality + 1
      @item.quality += 1 if (@item.quality < 50 && @item.sell_in < 11)
      @item.quality += 1 if (@item.quality < 50 && @item.sell_in < 6)
    end
  end

  def post_quality_increment
    @item.quality = 0 if @item.sell_in < 0
  end
end