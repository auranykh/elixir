defmodule KitchenCalculator do
  def get_volume(volume_pair) when is_tuple(volume_pair) and tuple_size(volume_pair) == 2 do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) when is_tuple(volume_pair) and tuple_size(volume_pair) == 2 do
    {type, _} = volume_pair

    case type do
      :cup -> {:milliliter, get_volume(volume_pair) * 240}
      :fluid_ounce -> {:milliliter, get_volume(volume_pair) * 30}
      :teaspoon -> {:milliliter, get_volume(volume_pair) * 5}
      :tablespoon -> {:milliliter, get_volume(volume_pair) * 15}
      :milliliter -> {:milliliter, get_volume(volume_pair)}
      _ -> :unsupported_volume_type
    end
  end

  def from_milliliter(volume_pair, unit)
      when is_tuple(volume_pair) and tuple_size(volume_pair) == 2 and is_atom(unit) do
    case unit do
      :cup -> {unit, get_volume(volume_pair) / 240}
      :fluid_ounce -> {unit, get_volume(volume_pair) / 30}
      :teaspoon -> {unit, get_volume(volume_pair) / 5}
      :tablespoon -> {unit, get_volume(volume_pair) / 15}
      :milliliter -> {unit, get_volume(volume_pair)}
      _ -> :unsupported_volume_type
    end
  end

  def convert(volume_pair, unit)
      when is_tuple(volume_pair) and tuple_size(volume_pair) == 2 and is_atom(unit) do
    base_unit = elem(volume_pair, 0)

    case {base_unit, unit} do
      # from milliliter to milliliter
      {:milliliter, :milliliter} ->
        volume_pair

      # from milliliter to x
      {:milliliter, _} ->
        from_milliliter(volume_pair, unit)

      # from x to milliliter
      {_, :milliliter} ->
        to_milliliter(volume_pair)

      # from x to y
      {_, _} ->
        from_milliliter(to_milliliter(volume_pair), unit)
    end
  end
end
