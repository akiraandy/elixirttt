defmodule RulesTest do
  use ExUnit.Case
  doctest Rules

  test "checks if there is a winner or not" do
    assert Rules.winner?([1, 2, 3, 4, 5, 6, 7, 8, 9]) == false
    assert Rules.winner?([:x, :x, :x, 4, 5, 6, 7, 8, 9]) == true
    assert Rules.winner?([1, 2, 3, :o, :o, :o, 7, 8, 9]) == true
    assert Rules.winner?([1, 2, 3, 4, 5, 6, :x, :x, :x]) == true
    assert Rules.winner?([:o, 2, 3, :o, 5, 6, :o, 8, 9]) == true
    assert Rules.winner?([1, :x, 3, 4, :x, 6, 7, :x, 9]) == true
    assert Rules.winner?([1, 2, :x, 4, 5, :x, 7, 8, :x]) == true
    assert Rules.winner?([:x, 2, 3, 4, :x, 6, 7, 8, :x]) == true
    assert Rules.winner?([1, 2, :x, 4, :x, 6, :x, 8, 9]) == true
  end

  test "checks if there is a tie" do
    assert Rules.tie?([1, 2, 3, 4, 5, 6, 7, 8, 9]) == false
    assert Rules.tie?([:x, :x, :x, 4, 5, 6, 7, 8, 9]) == false
    assert Rules.tie?([:x, :o, :x, :o, :o, :x, :x, :x, :o]) == true
  end

  test "returns the winner" do
    assert Rules.winner([:x, :o, 3, 4, :x, :o, 7, 8, :x]) == :x
    assert Rules.winner([:o, :x, 3, :o, :x, 6, :o, 8, 9]) == :o
    assert Rules.winner([1, 2, 3, 4, 5, 6, 7, 8, 9]) == nil
  end

  test "checks whether the game is over" do
    assert Rules.game_over?([:x, :o, 3, 4, 5, 6, 7, 8, 9]) == false
    assert Rules.game_over?([:x, :o, :x, :o, :o, :x, :x, :x, :o]) == true
    assert Rules.game_over?([:x, :o, 3, 4, :x, :o, 7, 8, :x]) == true
    assert Rules.game_over?([1, 2, 3, 4, 5, 6, 7, 8, 9]) == false
  end
end
