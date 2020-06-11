defmodule ColomboCodModule.Workers.NotifyPatientsWorkerTest do
  @moduledoc false

  use ExUnit.Case, async: true
  use ColomboCodModule.DataCase, async: true

  describe "handle_info/2" do
    test "receive :work message" do
      worker_pid = Process.whereis(ColomboCodModule.Workers.NotifyPatientsWorker)

      :erlang.trace(worker_pid, true, [:receive])

      assert_receive {:trace, ^worker_pid, :receive, :work}, 3_600
    end

    test "returns {:noreply, :ok} tuple" do
      # TODO: Check if it's possible to get 
      
      assert :ko == :ok
    end
  end
end
