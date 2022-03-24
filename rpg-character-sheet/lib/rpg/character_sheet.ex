defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    name = IO.gets("What is your character's name?\n")
    String.trim(name)
  end

  def ask_class() do
    class = IO.gets("What is your character's class?\n")
    String.trim(class)
  end

  def ask_level() do
    level = IO.getn("What is your character's level?\n")
    String.to_integer(level)
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    IO.inspect %{name: name, class: class, level: level}, label: "Your character"
  end
end
