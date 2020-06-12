defmodule ColomboCodModule.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: ColomboCodModule.Repo

  use ColomboCodModule.Factories.PatientFactory
  use ColomboCodModule.Factories.PatientInvitationNotificationFactory
end
