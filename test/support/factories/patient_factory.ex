defmodule ColomboCodModule.Factories.PatientFactory do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      def patient_factory do
        %ColomboCodModule.Patient{
          first_name: "Test",
          last_name: "Testowy",
          phone: sequence(:phone, &"123321#{&1}"),
        }
      end
    end
  end
end