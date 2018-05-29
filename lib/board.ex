defmodule Board do
  @moduledoc """
  Board for TTT
  """
  def place_marker(board, marker, space) do
    List.replace_at(board, space - 1, marker)
  end

  def is_empty?(board) do
    Enum.all?(board, fn(space) -> is_integer(space) end)
  end

  def available_spaces(board) do
    Enum.filter(board, fn(space) -> is_integer(space) end)
  end

  def full?(board) do
    Enum.all?(board, fn(space) -> is_atom(space) end)
  end

  def space_available?(board, space) do
    is_integer(Enum.at(board, space - 1))
  end
end
