defmodule LeaveApp.EmailTest do
  use LeaveApp.ModelCase

  alias LeaveApp.Email

  @valid_attrs %{email: "someemail@test.com", first_day_back_at_work: ~D[2010-04-17], last_day_at_work: ~D[2010-04-17], name: "some name", no_of_days: 120.5, type_of_leave: "some type_of_leave"}
  @invalid_attrs %{}
  @invalid_email %{email: "someemailtest.com", first_day_back_at_work: ~D[2010-04-17], last_day_at_work: ~D[2010-04-17], name: "some name", no_of_days: 120.5, type_of_leave: "some type_of_leave"}

  test "changeset with valid attributes" do
    changeset = Email.changeset(%Email{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Email.changeset(%Email{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with invalid email format" do
    changeset = Email.changeset(%Email{}, @invalid_email)
    refute changeset.valid?
  end

  test "submit leave request" do
    assert {:ok, _} = LeaveApp.Mailer.send_email("somename", "someemail@test.com", "sick", "1.5", ~D[2010-04-17], ~D[2010-04-17])
  end
end
