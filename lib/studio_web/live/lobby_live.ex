defmodule StudioWeb.LobbyLive do
  use StudioWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Create a Arena</h1>
    <div class="form-group">
    <%= form_for @form, "#", [phx_submit: :create], fn _f -> %>
      <%= text_input :create, :room, placeholder: "Nome da sala" %>
      <%= select  :create, :role, [p1: "player one", p2: "player two", guest: "guest"], prompt: [key: "Choose your role", disabled: true]  %>
      <%= submit "submit" %>
    <% end %>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: :form)}
  end

  def handle_event("create", params, socket) do
    IO.inspect params

    {:noreply, socket}
  end
end
