defmodule Studio.Repo.Migrations.CreateServers do
  use Ecto.Migration

  def change do
    create table(:servers) do
      add :name, :string
      add :status, :string
      add :git_repo, :string

      timestamps()
    end
  end
end
