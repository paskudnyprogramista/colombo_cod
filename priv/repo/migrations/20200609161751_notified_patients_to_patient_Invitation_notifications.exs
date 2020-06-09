defmodule ColomboCodModule.Repo.Migrations.RenameNotifiedPatientsToPatientInvitationNotifications do
  use Ecto.Migration

  def change do
    rename table("notified_patients"), to: table("patient_invitation_notifications")
  end
end
