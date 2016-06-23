ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Counter.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Counter.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Counter.Repo)

