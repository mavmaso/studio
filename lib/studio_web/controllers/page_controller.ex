defmodule StudioWeb.PageController do
  use StudioWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _) do
    render(conn, "new.html", data: :data)
  end
end
