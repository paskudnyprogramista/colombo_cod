defmodule ColomboCodModule.Workers.NotifyPatientsWorkerTest do
  @moduledoc false

  use ExUnit.Case, async: true
  use ColomboCodModule.DataCase, async: true

  describe "call/1" do
    test "spawns new processes" do
      assert :ko == :ok
    end
  end

  describie "persist_patient_invitation_notification/1" do
    descrbie "when invitation SMS was sent" do
      test "sends SMS to patient" do
        assert :ko == :ok
      end
    end

    descrbie "when invitation SMS was not sent" do
      test "creates new patient_invitation_notification association for patient" do
        assert :ko == :ok
      end
    end
  end
end
