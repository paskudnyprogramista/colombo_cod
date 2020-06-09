defmodule ColomboCodModule.Queries.PatientQuery do
  import Ecto.Query

  @moduledoc false

  def not_welcomed do
    from patient in ColomboCodModule.Patient,
         left_join: invitation in assoc(patient, :patient_invitation_notification),
         preload: :patient_invitation_notification,
         where: is_nil(invitation.id)
  end
end
