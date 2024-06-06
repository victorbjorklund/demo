defmodule Demo.Accounts.Token do
  use Ash.Resource,
    domain: Demo.Accounts,
    data_layer: AshSqlite.DataLayer,
    extensions: [AshAuthentication.TokenResource]

  sqlite do
    table "tokens"
    repo Demo.Repo
  end

  # If using policies, add the following bypass:
  # policies do
  #   bypass AshAuthentication.Checks.AshAuthenticationInteraction do
  #     authorize_if always()
  #   end
  # end
end
