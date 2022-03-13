defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * ((100 - discount) * 0.01)
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate)
    |> Kernel.*(22)
    |> apply_discount(ceil(discount))
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate(hourly_rate)
    |> apply_discount(discount)
    |> (&Kernel./(budget, &1)).() # https://shulhi.com/2016/11/16/piping-to-second-argument-in-elixir/
    |> Float.floor(1)
  end
end
