defmodule ColomboCodModule.Patient do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :first_name, :string
    field :last_name, :string
    field :phone, :string

    timestamps()
  end

  # TODO: Check how we can format input data
  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:first_name, :last_name, :phone])
    |> validate_required([:first_name, :last_name, :phone])
    |> unique_constraint(:phone)
  end
end
