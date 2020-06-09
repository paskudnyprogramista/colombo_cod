defmodule ColomboCodModule.Services.NotifyPatientService do
  @moduledoc false

  def call(patient) do
    Task.start(fn -> persist_patient_invitation_notification(patient) end)
    Task.start(fn -> notify(patient) end)
  end

  defp notify(patient) do
    IO.puts("Send SMS to: #{patient.phone}")
  end

  defp persist_patient_invitation_notification(patient) do
    Ecto.build_assoc(patient, :patient_invitation_notification)
    |> Ecto.Changeset.change(phone: patient.phone)
    |> ColomboCodModule.Repo.insert!()
  end
end
