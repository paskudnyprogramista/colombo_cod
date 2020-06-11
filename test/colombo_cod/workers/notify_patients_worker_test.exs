defmodule ColomboCodModule.Workers.NotifyPatientsWorkerTest do
  @moduledoc false

  use ExUnit.Case, async: true
  use ColomboCodModule.DataCase, async: true

  describe "handle_info/2" do
    test "receive :work message" do
      assert :ko == :ok
    end

    test "returns {:noreply, :ok} tuple" do
      assert :ko == :ok
    end
  end
end
