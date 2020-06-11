defmodule ColomboCodModule.Workers.NotifyPatientsWorker do
  @moduledoc false

  use GenServer

  alias ColomboCodModule.Services.NotifyPatientService, as: NotifyPatientService
  alias ColomboCodModule.Repo, as: Repo
  alias ColomboCodModule.Queries.PatientQuery, as: PatientQuery

  @interval 300_000

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
    PatientQuery.not_welcomed()
    |> Repo.all
    |> Enum.each(&NotifyPatientService.call/1)
  end
  
  defp schedule_worker do
    if Mix.env() != :test do
      Process.send_after(self(), :work, @interval)
    end
  end
end
