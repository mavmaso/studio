defmodule StudioWeb.ChatLive do
  use StudioWeb, :live_view

  alias StudioWeb.Endpoint

  defp topic(chat_id), do: "chat:#{chat_id}"

  def mount(args, _session, socket) do
    table = unless connected?(socket), do: start(), else: :arena_um
    Endpoint.subscribe(topic(args["c"]))

    socket =
      assign(socket,
        chat: chat(),
        message: :algo,
        table: table,
        topic: topic(args["c"]),
        deck: deck()
      )

    {:ok, socket}
  end

  def handle_params(%{"c" => c, "player" => player}, _url, socket) do
    socket = assign(socket, id: c, user: %{player:  player || false})

    {:noreply, socket}
  end

  def handle_params(_params, _url, socket) do
    socket = assign(socket, id: 0, user: %{player: false})

    {:noreply, socket}
  end

  def handle_event("message", %{"message" => message_params}, socket) do
    msg = %{content: message_params["content"], user: message_params["user_name"]}
    topic = socket.assigns.topic
    old = socket.assigns.chat

    chat =
      Map.update(old, :messages, 0, fn list ->
        [msg | list]
      end)

    Endpoint.broadcast_from(self(), topic, "message", %{chat: chat})

    {:noreply, assign(socket, chat: chat, message: :algo)}
  end

  def handle_info(%{event: "message", payload: state}, socket) do
    {:noreply, assign(socket, state)}
  end

  defp start, do: :ets.new(:arena_um, [:set, :named_table])

  def chat do
    %{
      messages: [message()]
    }
  end

  def message do
    %{
      user: "Paulo",
      content: "ola"
    }
  end

  def deck do
    [
      %{name: "soco", points: 10},
      %{name: "chute", points: 14},
      %{name: "escudo", points: -8}
    ]
  end
end
