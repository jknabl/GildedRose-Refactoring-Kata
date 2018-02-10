class GenericItem
  def initialize(item)
    @item = item
  end

  def initial_quality_increment
    @item.quality -= 1 if @item.quality > 0
  end

  def sell_in_increment
    @item.sell_in -= 1
  end

  def post_quality_increment
    @item.quality -= 1 if (@item.quality > 0 && @item.sell_in < 0)
  end

  def update
    initial_quality_increment
    sell_in_increment
    post_quality_increment
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
end