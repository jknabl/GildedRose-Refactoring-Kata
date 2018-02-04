require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class TestGildedRose < Test::Unit::TestCase
  def test_foo
    items = [Item.new("foo", 0, 0)]
    GildedRose.new(items).update_quality()
    assert_equal('foo', items[0].name)
  end

  def test_quality_degrades_twice_after_sell_by 
    items = [Item.new('foo', 1, 50)]
    GildedRose.new(items).update_quality
    assert_equal(49, items[0].quality)

    GildedRose.new(items).update_quality
    assert_equal(47, items[0].quality)
  end

  def test_quality_cannot_be_negative
    items = [Item.new('foo', 0, 0)]
    GildedRose.new(items).update_quality
    assert_equal 0, items[0].quality
  end

  def test_quality_cannot_be_over_50
    items = [Item.new('Aged Brie', -1, 50)]
    GildedRose.new(items).update_quality
    assert_equal 50, items[0].quality
  end

  def test_aged_brie_increases_quality_with_age
    items = [Item.new('Aged Brie', 1, 40)]
    GildedRose.new(items).update_quality
    assert_equal 41, items[0].quality
  end

  def test_aged_brie_increases_quality_2x_with_age
    items = [Item.new('Aged Brie', 0, 40)]
    GildedRose.new(items).update_quality
    assert_equal 42, items[0].quality
  end

  def test_sulfuras_does_not_decrease_quality
    items = [Item.new('Sulfuras, Hand of Ragnaros', -5, 40)]
    GildedRose.new(items).update_quality
    assert_equal 40, items[0].quality
  end

  def test_backstage_passes_increase_by_1_when_sellby_greater_than_10
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 40)]
    GildedRose.new(items).update_quality
    assert_equal 41, items[0].quality
  end

  def test_backstage_passes_increase_by_3_when_sellby_between_10_and_6_inclusive
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 7, 40)]
    GildedRose.new(items).update_quality
    assert_equal 42, items[0].quality
  end

  def test_backstage_passes_increase_by_5_when_sellby_between_5_and_0_inclusive
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 40)]
    GildedRose.new(items).update_quality
    assert_equal 43, items[0].quality
  end

  def test_backstage_passes_quality_zero_past_sell_date
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 40)]
    GildedRose.new(items).update_quality
    assert_equal 0, items[0].quality
  end
end