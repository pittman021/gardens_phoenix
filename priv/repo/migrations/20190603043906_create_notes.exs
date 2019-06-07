defmodule Network.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:gifts) do
      add :title, :text
      add :url, :text
      add :contact_id, references(:contacts)
      add :user_id, references(:users)

      timestamps()
    end

  end
end
