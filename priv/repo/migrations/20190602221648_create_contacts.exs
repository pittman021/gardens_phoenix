defmodule Network.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :first_name, :string
      add :last_name, :string
      add :address, :string
      add :date_of_birth, :date
      

      timestamps()
    end

  end
end
