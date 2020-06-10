defmodule ColomboCodModule.Queries.PatientQuery do
  import Ecto.Query

  @moduledoc false

  def not_welcomed do
    from patient in ColomboCodModule.Patient,
         left_join: invitation in ColomboCodModule.PatientInvitationNotification,
         on: patient.phone == invitation.phone,
         preload: :patient_invitation_notification,
         where: is_nil(invitation.id)
  end
end
