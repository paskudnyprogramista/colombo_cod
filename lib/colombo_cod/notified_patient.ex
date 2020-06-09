defmodule ColomboCodModule.NotifiedPatient do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  schema "notified_patients" do
    field :phone, :string

    timestamps()
  end

  # TODO: Check how we can format input data
  @doc false
  def changeset(notified_patient, attrs) do
    notified_patient
    |> cast(attrs, [:phone])
    |> validate_required([:phone])
    |> unique_constraint(:phone)
  end
end
