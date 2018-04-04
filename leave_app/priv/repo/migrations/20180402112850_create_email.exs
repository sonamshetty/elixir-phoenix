defmodule LeaveApp.Repo.Migrations.CreateEmail do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add :name, :string
      add :email, :string
      add :type_of_leave, :string
      add :no_of_days, :float
      add :last_day_at_work, :date
      add :first_day_back_at_work, :date

      timestamps()
    end
  end
end
