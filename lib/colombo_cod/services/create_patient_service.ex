defmodule ColomboCodModule.Services.CreatePatientService do
  @moduledoc false

  def call(patient_changeset) do
    # TODO: Impl
    # Fetch patient
    # If patient exists, return failure
    # Else
    # Fetch patient_invitation_notification where patient.phone == patient_invitation_notification.phone
    # If patient_invitation_notification exists
    # Update patient_invitation_notification with patient
    # Else
    # Do nothing

    Multi.new()
  end
end
