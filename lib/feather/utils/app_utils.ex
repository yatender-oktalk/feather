defmodule Feather.AppUtils do
  @moduledoc """
  App Utility methods which will we used throughout the app
  """
  def generate_random_code, do:
    Ecto.UUID.generate |> binary_part(0,8) |> String.upcase

  def generate_promos(total_promos) do
    total_num = total_promos + 100
    #1000 just to be sure so that code doesn't get repeated
    1..total_num
    |> Enum.map(fn _ ->
        generate_random_code()
    end)
    |> Enum.uniq()
    |> Enum.take(total_promos)
  end

  def convert_to_int(value) do
    case is_binary(value) do
      false ->
        case is_float(value) do
          false ->
            case Decimal.decimal?(value) do
              true -> value |> Decimal.round() |> Decimal.to_integer()
              _ -> value
            end

          _ ->
            Kernel.trunc(value)
        end

      _ ->
        {usr, _} = Integer.parse(value)
        usr
    end
  end

end