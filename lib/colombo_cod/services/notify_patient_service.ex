defmodule ColomboCodModule.Services.NotifyPatientService do
  @moduledoc false

  def call(patient) do
    Task.start(fn -> notify(patient) end)
  end

  defp notify(patient) do
    IO.puts("Send SMS to: #{patient.phone}")
  end
end
