defmodule ComputerTest do
  use ExUnit.Case
  doctest Computer

  test "returns best score" do
    map = %{2 => 5, 1 => 3, 3 => 2}
    assert Computer.best_score(map) == 5
  end

  test "returns the best move" do
    map = %{2 => 5, 1 => 3, 3 => 2}
    assert Computer.best_move(map) == 2
  end

  test "gives back positive score for computer" do
    board = [:x, :o, :o, 4, :x, 6, 7, 8, :x]
    assert Computer.heuristic_value(board) == -1
  end

  test "gives negative score for human" do
    board = [:x, :o, :x, :x, :o, 6, 7, :o, 9]
    assert Computer.heuristic_value(board) == -1
  end

  test "gives neutral score for tie" do
    board = [:x, :o, :x, :o, :o, :x, :x, :x, :o]
    assert Computer.heuristic_value(board) == 0
  end

  test "swaps player" do
    assert Computer.swap_player(:x) == :o
    assert Computer.swap_player(:o) == :x
  end

  test "minimax will block opponent from winning" do
    board = [:x, :o, :x, 4, :o, 6, 7, 8, 9]
    assert Computer.minimax(board, 0, :x) == 8
    board = [:o, 2, 3, 4, :x, 6, :o, 8, 9]
    assert Computer.minimax(board, 0, :x) == 4
  end

  test "minimax will win for maximizing player" do
    board = [:o, :o, 3, :x, :x, 6, :o, 8, 9]
    assert Computer.minimax(board, 0, :x) == 6
  end

  test "take_turn will return a new board" do
    board = [:o, :o, 3, :x, :x, 6, :o, 8, 9]
    assert Computer.take_turn(board) == [:o, :o, 3, :x, :x, :x, :o, 8, 9]
  end
end
