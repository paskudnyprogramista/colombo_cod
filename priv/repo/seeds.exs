# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ColomboCodModule.Repo.insert!(%ColomboCodModule.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

ColomboCodModule.Repo.insert!(
  %ColomboCodModule.Patient{
    first_name: "Louis",
    last_name: "Wain",
    phone: "186001939"
  }
)

ColomboCodModule.Repo.insert!(
  %ColomboCodModule.Patient{
    first_name: "Edvard",
    last_name: "Munch",
    phone: "186301944"
  }
)

ColomboCodModule.Repo.insert!(
  %ColomboCodModule.Patient{
    first_name: "Francisco",
    last_name: "de Goya",
    phone: "174601828"
  }
)

ColomboCodModule.Repo.insert!(
  %ColomboCodModule.NotifiedPatient{
    phone: "186301944"
  }
)
