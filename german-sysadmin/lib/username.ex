defmodule Username do
  def sanitize(username) do
    inner_sanitize(username)
  end

  defp inner_sanitize('') do
    ''
  end

  defp inner_sanitize([head | tail]) do
    sanitized = case head do
      ?ß -> 'ss'
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      x when x >= ?a and x <= ?z -> [x]
      ?_ -> '_'
      _ -> ''
    end

    sanitized ++ sanitized(tail)
  end
end
