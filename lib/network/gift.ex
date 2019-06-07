defmodule Network.Gift do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:title, :url] }

  schema "gifts" do
    field :title, :string
    field :url, :string
    belongs_to :contact, Network.Contact
    belongs_to :user, Network.User

    timestamps()
  end

  @doc false
  def changeset(gift, attrs) do
    gift
    |> cast(attrs, [:title, :url])
    |> validate_required([:title, :url])
  end
end
