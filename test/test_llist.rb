require 'test/unit'
require 'xymesh'

class LListTest < Test::Unit::TestCase
  
  def test_llist_init
    assert_equal 0, XYMesh::LList.new.size
  end

  def test_adding_and_removing_new_elements
    list = XYMesh::LList.new
    list.append("Also")
    list.append("sprach")
    list.append("Zarathustra")

    # We should have three elements
    assert_equal 3, list.size

    # Indexing starts with 1. Verify that.
    assert_equal "Also", list[1].value
    
    # remove first element
    list[1].unlink
    # check that we have two elements now
    assert_equal 2, list.size
    # now the first word should be 'sprach'
    assert_equal "sprach", list[1].value
    # check that also in pretty print
    assert_equal "[sprach,Zarathustra]", list.to_s
  end

end
