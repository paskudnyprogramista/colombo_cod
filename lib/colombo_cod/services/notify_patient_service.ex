defmodule ColomboCodModule.Services.NotifyPatientService do
  @moduledoc false
  import Ecto.Query

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

  defp notify(patient) do
    {:ok, :sent, patient.phone}
  end

  defp persist_patient_invitation_notification(patient) do
    Ecto.build_assoc(patient, :patient_invitation_notification)
    |> Ecto.Changeset.change(phone: patient.phone)
    |> ColomboCodModule.Repo.insert!()
  end
end
