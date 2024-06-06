defmodule Demo.Accounts do
  use Ash.Domain

  resources do
    resource Demo.Accounts.User
    resource Demo.Accounts.Token
  end
end
