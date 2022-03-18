defmodule BirdCount do
  def today([]) do
    nil
  end

  def today([head | _tail]) do
    head
  end

  def increment_day_count([]) do
    [1]
  end

  def increment_day_count(list) do
    [head | tail] = list
    [head + 1 | tail]
  end

  def has_day_without_birds?(list) do
    inner_hdwb?(list, false)
  end

  defp inner_hdwb?(_list, bool) when bool == true do
    true
  end

  defp inner_hdwb?([], bool) when bool == false do
    false
  end

  defp inner_hdwb?([head | tail], bool) when bool == false do
    if head == 0 do
      inner_hdwb?(tail, true)
    else
      inner_hdwb?(tail, false)
    end
  end

  def total(list) do
    inner_total(list, 0)
  end

  defp inner_total([head | tail], acc) do
    inner_total(tail, head + acc)
  end

  defp inner_total([], acc) do
    acc
  end

  def busy_days(list) do
    inner_busy_days(list, 0)
  end

  defp inner_busy_days([head | tail], acc) when head >= 5 do
    inner_busy_days(tail, acc + 1)
  end

  defp inner_busy_days([head | tail], acc) when head < 5 do
    inner_busy_days(tail, acc)
  end

  defp inner_busy_days([], acc) do
    acc
  end
end
