defmodule Human do

  defimpl Player, for: Human do
  end

  def take_turn(board) do
    input = get_input
    move = valid_move_loop(input, board)

    Board.place_marker(board, :o, move)
  end

  def get_input do
    IO.gets "Please enter a move"
  end

  def valid_move_loop(input, board) do
    valid_move = 
      input
      |> String.trim
      |> Integer.parse
      |> validate
    result = validate_for_board(valid_move, board)
    cond do
      elem(result, 1) == false -> valid_move_loop(get_input, board)
      elem(result, 1) == true -> elem(result, 0)
    end
  end

  def sanitize(input) do
    input
    |> String.trim
    |> Integer.parse
    |> elem(0)
  end

  def validate(:error) do
    IO.puts "Invalid input detected"
    {:error, false}
  end

  def validate(input) do
    {elem(input,0), true}
  end

  def validate_for_board(input, board) do
    spaces = Board.available_spaces(board)
    if input == {:error, false} do
      input = -1
    else
      input = elem(input, 0)
    end
    result = Enum.reject(spaces, fn(space) -> input != space end)
    if Enum.empty?(result), do: validate(:error), else: {input, true}
  end

  def validate_for_board(false) do
    false
  end

end
