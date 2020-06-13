defmodule ColomboCodModule.Services.CreatePatientService do
  @moduledoc """
  CreatePatientService is responsible for FINDING or CREATING patients.

  Patient recrod can be deleted from database, but information regarding invitation SMS not - at least not in normal usage.

  In such case, service will check if we can link patient with invitatioin notifications records.
  """

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
