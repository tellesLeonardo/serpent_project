defmodule Serpent.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :description, :string
    field :linkImage, :string
    field :star, :integer
    field :title, :string
    field :userId, :id

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :description, :linkImage, :star])
    |> validate_required([:title, :description, :linkImage, :star])
  end
end
