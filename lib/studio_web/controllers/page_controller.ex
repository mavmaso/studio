defmodule StudioWeb.PageController do
  use StudioWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
