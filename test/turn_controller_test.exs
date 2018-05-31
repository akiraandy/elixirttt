defmodule TurnControllerTest do
  use ExUnit.Case
  doctest TurnController
  
  test "gets computer" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert TurnController.get_player(board) == Computer  
  end

  test "gets human" do
    board = [:x, 2, 3, 4, 5, 6, 7, 8, 9]
    assert TurnController.get_player(board) == Human 
  end
end
