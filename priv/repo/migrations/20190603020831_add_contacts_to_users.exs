defmodule Network.Repo.Migrations.AddContactsToUsers do
  use Ecto.Migration

  def change do
    alter table(:contacts) do
      add :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
