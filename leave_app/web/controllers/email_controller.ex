defmodule LeaveApp.EmailController do
use LeaveApp.Web, :controller
alias LeaveApp.Email
def index(conn, _params) do
  changeset = Email.changeset(%Email{})
  emails = Repo.all(Email)
  render(conn, "index.html", changeset: changeset, emails: emails)
end

def create(conn, %{"email" => %{"name" => name, "email" => email, "type_of_leave" => type_of_leave, "no_of_days" => no_of_days, "last_day_at_work" => last_day_at_work, "first_day_back_at_work" => first_day_back_at_work}}) do
changeset = Email.changeset(%Email{},  %{"name" => name, "email" => email, "type_of_leave" => type_of_leave, "no_of_days" => no_of_days, "last_day_at_work" => last_day_at_work, "first_day_back_at_work" => first_day_back_at_work})

if Date.diff(Date.from_iso8601!("#{last_day_at_work}"), Date.from_iso8601!("#{first_day_back_at_work}")) > 0 do
 conn
  |> put_flash(:error, "First day back at work date cannot be less than Last day at work")
  |> render("index.html", changeset: changeset)
else
  case Repo.insert(changeset) do
    {:error, changeset} ->
      conn
       |> render("index.html", changeset: changeset)
    {:ok, _} ->
      case LeaveApp.Mailer.send_email(name, email, type_of_leave, no_of_days, last_day_at_work, first_day_back_at_work) do
       {:ok, _} ->
         conn
         |> put_flash(:info, "Email sent")
         |> redirect(to: email_path(conn, :index))
       {:error,_ , _} ->
         conn
         |> put_flash(:error, "Something went wrong")
         |> render("index.html", changeset: changeset)
       end
     end
   end
 end
end
