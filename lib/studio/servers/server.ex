defmodule Studio.Servers.Server do
  use Ecto.Schema
  import Ecto.Changeset

  schema "servers" do
    field :git_repo, :string
    field :name, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(server, attrs) do
    server
    |> cast(attrs, [:name, :status, :git_repo])
    |> validate_required([:name, :status, :git_repo])
  end
end
