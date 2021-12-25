defmodule StudioWeb.KanbanLive do
  use StudioWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, var: "novidade")}
  end

  def render(assigns) do
    ~H"""
      <p>TESTE !!! <%= @var %></p>
    """
  end
end
