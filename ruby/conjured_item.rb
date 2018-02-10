class ConjuredItem < GenericItem
  def initialize(item)
    super(item)
  end

  def initial_quality_increment
    if @item.quality == 1
      @item.quality = 0
    elsif @item.quality > 0
      @item.quality -= 2
    end
  end

  def post_quality_increment
    if @item.sell_in < 0
      if [1,2,3].include? @item.quality
        @item.quality = 0
      elsif @item.quality > 0
        @item.quality -= 2
      end
    end
  end
end