defmodule HelviSpaceCo.Repo do
  use Ecto.Repo,
    otp_app: :helvi_space_co,
    adapter: Ecto.Adapters.SQLite3
end
