defmodule Network.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :address, :string
    field :date_of_birth, :date
    field :first_name, :string
    field :last_name, :string
    belongs_to :user, Network.User
    has_many :gifts, Network.Gift

    timestamps()
  end

  @doc false
  def changeset(contact, attrs \\ %{}) do
    contact
    |> cast(attrs, [:first_name, :last_name, :address, :date_of_birth])
    |> validate_required([:first_name, :last_name, :address, :date_of_birth])
  end
end
