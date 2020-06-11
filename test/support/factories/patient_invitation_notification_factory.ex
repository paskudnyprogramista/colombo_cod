defmodule ColomboCodModule.Factories.PatientInvitationNotificationFactory do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      def patient_invitation_notification_factory do
        %ColomboCodModule.PatientInvitationNotification{
          phone: sequence(:phone, &"123321#{&1}"),
        }
      end
    end
  end
end