defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  test "places a marker" do
    assert Board.place_marker([1, 2, 3, 4, 5, 6, 7, 8, 9], :x, 1) == [:x, 2, 3, 4, 5, 6, 7, 8, 9] 
  end

  test "checks if board is empty" do
    assert Board.is_empty?([1, 2, 3, 4, 5, 6, 7, 8, 9]) == true
    assert Board.is_empty?([:x, :o, 3, 4, 5, :x, 7, 8, 9]) == false
  end

  test "returns list of available spaces" do
    assert Board.available_spaces([1, 2, 3, 4, 5, 6, 7, 8, 9]) == [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert Board.available_spaces([:x, :o, 3, 4, 5, 6, 7, 8, 9]) == [3, 4, 5, 6, 7, 8, 9]
    assert Board.available_spaces([:x, :o, :x, :o, :x, :o, :x, :o, :x]) == []
  end

  test "checks if board is full" do
    assert Board.full?([1, 2, 3, 4, 5, 6, 7, 8, 9]) == false 
    assert Board.full?([:x, 2, :o, 4, 5, 6, 7, 8, 9]) == false
    assert Board.full?([:x, :o, :o, :o, :x, :x, :x, :o, :o]) == true
  end

  test "checks if space is empty" do
    assert Board.space_available?([1, 2, 3, 4, 5, 6, 7, 8, 9], 1) == true
    assert Board.space_available?([1, 2, 3, :o, 5, 6, 7, 8, 9], 4) == false
  end
end
