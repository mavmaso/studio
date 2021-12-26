defmodule Studio.ServersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Studio.Servers` context.
  """

  @doc """
  Generate a server.
  """
  def server_fixture(attrs \\ %{}) do
    {:ok, server} =
      attrs
      |> Enum.into(%{
        git_repo: "some git_repo",
        name: "some name",
        status: "some status"
      })
      |> Studio.Servers.create_server()

    server
  end
end
