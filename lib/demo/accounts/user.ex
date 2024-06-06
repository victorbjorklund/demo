defmodule Demo.Accounts.User do
  use Ash.Resource,
    domain: Demo.Accounts,
    data_layer: AshSqlite.DataLayer,
    extensions: [AshAuthentication]

  attributes do
    uuid_primary_key :id

    attribute :email, :ci_string do
      allow_nil? false
      public? true
    end

    attribute :hashed_password, :string, allow_nil?: false, sensitive?: true
  end

  authentication do
    strategies do
      password :password do
        identity_field :email
        sign_in_tokens_enabled? true
        sign_in_token_lifetime 1
      end
    end

    tokens do
      enabled? true
      store_all_tokens? true
      require_token_presence_for_authentication? true
      token_resource Demo.Accounts.Token
      signing_secret Demo.Accounts.Secrets
    end
  end

  sqlite do
    table "users"
    repo Demo.Repo
  end

  identities do
    identity :unique_email, [:email]
  end

  # If using policies, add the following bypass:
  # policies do
  #   bypass AshAuthentication.Checks.AshAuthenticationInteraction do
  #     authorize_if always()
  #   end
  # end
end
