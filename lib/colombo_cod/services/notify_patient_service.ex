defmodule ColomboCodModule.Services.NotifyPatientService do
  @moduledoc """
  NotifyPatientService is responsible for persisting invitation notifications in database and send SMS to patients.
  """

  import Ecto.Query

  @spec call(%ColomboCodModule.Patient{}) :: tuple
  def call(patient) do
    result =
      ColomboCodModule.Repo.exists?(
        from pin in ColomboCodModule.PatientInvitationNotification,
          where: pin.phone == ^patient.phone
      )

    if result do
      {:ko, :unprocessable}
    else
      {_, persist_pid} = Task.start(fn -> persist_patient_invitation_notification(patient) end)
      {_, notify_pid} = Task.start(fn -> notify(patient) end)

      {:ok, :processed, persist_pid, notify_pid}
    end
  end

  @spec notify(%ColomboCodModule.Patient{}) :: tuple
  defp notify(patient) do
    {:ok, :sent, patient.phone}
  end

  @spec persist_patient_invitation_notification(%ColomboCodModule.Patient{}) :: Ecto.Schema.t()
  defp persist_patient_invitation_notification(patient) do
    Ecto.build_assoc(patient, :patient_invitation_notification)
    |> Ecto.Changeset.change(phone: patient.phone)
    |> ColomboCodModule.Repo.insert!()
  end
end
