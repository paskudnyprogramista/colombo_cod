defmodule ColomboCodModule.Repo.Migrations.PatientInvitationNotificationBelongsToPatient do
  use Ecto.Migration

  def change do
    alter table(:patient_invitation_notifications) do
      add :patient_id, references(:patients)
    end
  end
end
