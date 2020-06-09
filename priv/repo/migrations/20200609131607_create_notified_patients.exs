defmodule ColomboCodModule.Repo.Migrations.CreateNotifiedPatients do
  use Ecto.Migration

  def change do
    create table(:notified_patients) do
      add :phone, :string

      timestamps()
    end

  end
end
