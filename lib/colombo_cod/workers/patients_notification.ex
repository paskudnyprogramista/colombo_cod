defmodule ColomboCodModule.Workers.PatientsNotification do
  @moduledoc false

  use GenServer

  alias ColomboCodModule.Services.NotifyPatientService, as: NotifyPatientService

  # TODO: Change interval to 300_000
  @interval 3_600

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(state) do
    schedule_worker()

    {:ok, state}
  end

  @impl true
  def handle_info(:work, state) do
    notify_patients()

    schedule_worker()

    {:noreply, state}
  end

  defp notify_patients do
    # TODO: Check if there's a better way to send patients to service
    ColomboCodModule.Repo.all(ColomboCodModule.Patient)
    |> Enum.each(&NotifyPatientService.call/1)
  end
  
  defp schedule_worker do
    Process.send_after(self(), :work, @interval)
  end
end
