defmodule ColomboCodModule.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :first_name, :string
      add :last_name, :string
      add :phone, :string

      timestamps()
    end

  end
end
