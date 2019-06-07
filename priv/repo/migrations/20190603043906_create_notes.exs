defmodule Network.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:gifts) do
      add :title, :text
      add :url, :text
      add :contact_id, references(:contacts, on_delete: :delete_all)
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

  end
end
