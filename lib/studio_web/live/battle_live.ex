defmodule StudioWeb.BattleLive do
  use StudioWeb, :live_view

  alias StudioWeb.Endpoint
  alias Studio.ETS

  def mount(_args, session, socket) do
    topic = "battle: #{session["name"]}"
    table = session["name"] |> String.to_atom

    if connected?(socket), do: Endpoint.subscribe(topic)

    socket =
      assign(socket,
        table: table,
        topic: topic,
        role: session["role"],
        valor: ETS.lookup(table, :valor)[:valor] || 0
      )

    {:ok, socket}
  end

  def handle_event("up", _params, %{assigns: values} = socket) do
    topic = values.topic
    valor = values.valor + 10
    ETS.add(values.table, {:valor, valor})

    Endpoint.broadcast(topic, "update", %{valor: valor})

    {:noreply, assign(socket, valor: valor)}
  end

  def handle_event("commence", _params,  %{assigns: values} = socket) do
    table = ETS.new(values.table)
    ETS.add(table, {:valor, 1})

    {:noreply, assign(socket, valor: 1)}
  end

  def handle_info(%{event: "update", payload: state}, socket) do
    {:noreply, assign(socket, state)}
  end
end
