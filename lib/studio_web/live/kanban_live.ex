defmodule StudioWeb.KanbanLive do
  use StudioWeb, :live_view

  def mount(_params, session, socket) do
    {:ok, assign(socket, var: session["arena"] || "novidade")}
  end

  def render(assigns) do
    ~H"""
      <p>TESTE !!! <%= @var %></p>
    """
  end
end
