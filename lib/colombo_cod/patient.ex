defmodule ColomboCodModule.Patient do
  @moduledoc """
  This is the Patient module which defines Patient schema and changeset macro.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :first_name, :string
    field :last_name, :string
    field :phone, :string

    has_one :patient_invitation_notification, ColomboCodModule.PatientInvitationNotification, on_delete: :nilify_all

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
