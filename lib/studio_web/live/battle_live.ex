defmodule StudioWeb.BattleLive do
  use StudioWeb, :live_view

  alias StudioWeb.Endpoint

  def render(assigns) do
    ~H"""
      <h1><%= @topic %></h1>

      <p><%= @valor %></p>

      <%= if @role == "p1" do%>
        <p> PLAYER ONE </p>

        <button phx-click="up">
          <h3>+10</h3>
        </button>
      <% end %>

      <%= if @role == "p2" do%>
        <p> PLAYER TWO </p>
        <button phx-click="up">
          <h3>+10</h3>
        </button>
      <% end %>
    """
  end

  def mount(_args, session, socket) do
    topic = "battle: #{session["name"]}"
    Endpoint.subscribe(topic)

    socket =
      assign(socket,
        topic: topic,
        valor: 0,
        role: session["role"]
      )

    {:ok, socket}
  end

  def handle_event("up", _params, %{assigns: values} = socket) do
    topic = values.topic
    valor = values.valor + 10

    Endpoint.broadcast(topic, "update", %{valor: valor})

    {:noreply, assign(socket, valor: valor)}
  end

  def handle_info(%{event: "update", payload: state}, socket) do
    {:noreply, assign(socket, state)}
  end
end
