defmodule LeaveApp.Email do
  use LeaveApp.Web, :model

  schema "emails" do
    field :name, :string
    field :email, :string
    field :type_of_leave, :string
    field :no_of_days, :float
    field :last_day_at_work, :date
    field :first_day_back_at_work, :date

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :type_of_leave, :no_of_days, :last_day_at_work, :first_day_back_at_work])
    |> validate_required([:name, :email, :type_of_leave, :no_of_days, :last_day_at_work, :first_day_back_at_work])
    |> validate_format(:email, ~r/@/)
  end
end
