defmodule StudioWeb.ServerLive do
  use StudioWeb, :live_view

  alias Studio.Servers

  def render(assigns) do
    ~H"""
    <h1>Servers</h1>
    <div id="servers">
      <div class="sidebar">
        <nav>
          <%= for server <- @servers do %>
            <%= live_patch server.name, to: Routes.live_path(@socket, __MODULE__, id: server.id) %>
          <% end %>
        </nav>
      </div>
      <div class="main">
        <div class="wrapper">
          <div class="card">
            <div class="header">
              <h2><%= @selected_server.name %></h2>
              <span class={@selected_server.status}>
                <%= @selected_server.status %>
              </span>
            </div>
            <div class="body">
              <h3>Git Repo</h3>
              <div class="repo">
                <%= @selected_server.git_repo %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    servers = Servers.list_servers()

    socket =
      assign(socket,
        servers: servers,
        selected_server: hd(servers)
      )

    {:ok, socket, temporary_assigns: [servers: []]}
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    socket = assign(socket, :selected_server, Servers.get_server!(id))
    {:noreply, socket}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end
end
