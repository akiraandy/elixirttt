defmodule GameLoopTest do
  use ExUnit.Case
  doctest GameLoop


  test "exits if game is in terminal state" do
    finished_board = [:x, :x, :x, 4, 5, 6, 7, 8, 9]
    assert GameLoop.play(finished_board) == finished_board
  end

  test "it plays the last round" do
    board = [ :x, :o, :x, :o, :x, :o, :o, :x, 9]
    assert GameLoop.play(board) == [ :x, :o, :x, :o, :x, :o, :o, :x, :x]
  end
end
