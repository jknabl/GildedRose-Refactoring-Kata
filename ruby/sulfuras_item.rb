class SulfurasItem < GenericItem
  def initialize(item)
    super(item)
  end

  def initial_quality_increment
    nil
  end

  def post_quality_increment
    nil
  end
end