defmodule StudioWeb.ArenaController do
  use StudioWeb, :controller

  import Phoenix.LiveView.Controller

  def battle(conn, %{"data" => data}) do
    p1 = "WIP-1"
    p2 = "WIP-2"

    # table = :ets.new(form["name"] |> String.to_atom, [:set, :named_table])
    # :ets.insert(table, {:valor, 0})

    live_render(conn, StudioWeb.BattleLive, session: %{
      "name" => data["name"],
      "role" => data["role"],
      "host" => p1,
      "rival" => p2
    })
  end
end
