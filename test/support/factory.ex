defmodule ColomboCodModule.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: ColomboCodModule.Repo

  use ColomboCodModule.PatientFactory
end