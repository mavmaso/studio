defmodule Studio.ETS do

  def new(table) do
    try do
      :ets.new(table, [:set, :named_table, :public])
    rescue
      _ -> table
    end
  end

  def lookup(table, key) do
    try do
      :ets.lookup(table, key)
    rescue
      _ -> nil
    end
  end

  def add(table, key_valor) do
    :ets.insert(table, key_valor)
  end
end
