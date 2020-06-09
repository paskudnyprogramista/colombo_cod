defmodule ColomboCodModule.PatientInvitationNotification do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  schema "patient_invitation_notifications" do
    field :phone, :string

    belongs_to :patient, ColomboCodModule.Patient

    timestamps()
  end

  # TODO: Check how we can format input data
  @doc false
  def changeset(patient_invitation_notification, attrs) do
    patient_invitation_notification
    |> cast(attrs, [:phone])
    |> validate_required([:phone])
    |> unique_constraint(:phone)
  end
end
