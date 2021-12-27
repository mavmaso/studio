defmodule StudioWeb.ChatLive do
  use StudioWeb, :live_view


  def mount(_args, _session, socket) do
    socket = assign(socket, chat: chat(), message: :algo)

   {:ok, socket}
  end

  def handle_params(%{"c" => c}, _url, socket) do
    socket = assign(socket, :id, c)

    {:noreply, socket}
  end

  def handle_event("message", %{"message" => message_params}, socket) do
    msg = %{content: message_params["content"], user: %{name: message_params["user_name"]}}

    old = socket.assigns.chat
    chat = Map.update(old, :messages, 0, fn list ->
      [ msg | list]
    end)

    {:noreply, assign(socket, chat: chat, message: :algo)}
  end

  def chat do
    %{
      messages: [message()]
    }
  end

  def message do
    %{
      user: %{name: "Paulo"},
      content: "ola"
    }
  end
end
