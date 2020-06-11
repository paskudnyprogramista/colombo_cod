defmodule ColomboCodModule.Workers.NotifyPatientsServiceTest do
  @moduledoc false

  use ExUnit.Case, async: true
  use ColomboCodModule.DataCase, async: true

  import ColomboCodModule.Factory

  setup do
    patient = insert(:patient)

    %{patient: patient}
  end

  describe "call/1" do
    test "spawns notify process", %{patient: patient} do
      result = ColomboCodModule.Services.NotifyPatientService.call(patient)

      notify_pid = result |> elem(3)

      assert is_pid(notify_pid)
    end

    test "spawns persist_patient_invitation_notification process", %{patient: patient} do
      result = ColomboCodModule.Services.NotifyPatientService.call(patient)

      persist_pid = result |> elem(2)

      assert is_pid(persist_pid)
    end
  end

  describe "persist_patient_invitation_notification/1" do
    test "when invitation SMS was sent it does not insert new record", %{patient: patient} do
      # We deliberately don't insert patient with associated patient_invitation_notification
      # Because we want to test, how system behave when patient data was destroyed
      patient_invitation_notification = insert(:patient_invitation_notification, %{phone: patient.phone})

      result = ColomboCodModule.Services.NotifyPatientService.call(patient)
      
      assert {:ko, :unprocessable} == result
    end

    test "when invitation SMS was not sent it insert new record", %{patient: patient} do
      result = ColomboCodModule.Services.NotifyPatientService.call(patient)

      persist_pid = result |> elem(2)

      ref = Process.monitor(persist_pid)

      # TODO: Refactor this test to be Elixir like one
      counts = receive do
        {:DOWN, ^ref, _, _, _} ->
          {
            ColomboCodModule.Repo.all(ColomboCodModule.Patient) |> Enum.count,
            ColomboCodModule.Repo.all(ColomboCodModule.PatientInvitationNotification) |> Enum.count
          }
      end

      assert {1, 1} = counts
      assert {:ok, :processed, _, _} = result
    end
  end
end
