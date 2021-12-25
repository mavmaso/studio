defmodule StudioWeb.PageControllerTest do
  use StudioWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to"
  end
end
