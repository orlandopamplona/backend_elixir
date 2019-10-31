defmodule UsersAccount.Repo do
  use Ecto.Repo,
    otp_app: :users_account,
    adapter: Ecto.Adapters.Postgres
end
