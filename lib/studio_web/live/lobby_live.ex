defmodule StudioWeb.LobbyLive do
  use StudioWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Create a Arena</h1>
    <div class="form-group">

      <.form let={f} for={@form}
      url={Routes.arena_path(@socket, :battle)}
      phx-submit="create" %>
        <%= text_input f, :name, placeholder: "Nome da sala" %>
        <%= select  f, :role, [p1: "player one", p2: "player two", guest: "guest"], prompt: [key: "Choose your role", disabled: true]  %>
        <div>
          <%= submit "submit",  phx_disable_with: "Registering..." %>
        </div>
      </.form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: :form)}
  end

  # <.form for={@form} Routes.arena_path(@socket, :battle) phx-trigger-action={false} %>

  def handle_event("create", %{"form" => params}, socket) do
    IO.inspect params, label: "PARAMS do CREATE"
    socket = assign(socket, %{battle: params})
    {:noreply, socket}
  end
end
