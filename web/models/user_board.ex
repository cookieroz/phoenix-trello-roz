defmodule PhoenixTrello.UserBoard do
  use PhoenixTrello.Web, :model

  alias PhoenixTrello.{User, Board}

  schema "user_boards" do
    belongs_to :user, PhoenixTrello.User, foreign_key: :user_id
    belongs_to :board, PhoenixTrello.Board, foreign_key: :board_id

    timestamps()
  end

  @required_fields ~w(user_id board_id)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:user_id, name: :user_boards_user_id_board_id_index)
  end
end