defmodule PhoenixTrello.Repo.Migrations.CreateList do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :name, :string
      add :board_id, references(:board, on_delete: :nothing)

      timestamps()
    end

    create index(:lists, [:board_id])
  end
end
