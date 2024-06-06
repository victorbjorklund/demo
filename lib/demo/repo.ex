defmodule Demo.Repo do

  use AshSqlite.Repo, otp_app: :demo

  # use Ecto.Repo,
  #   otp_app: :demo,
  #   adapter: Ecto.Adapters.SQLite3
end
