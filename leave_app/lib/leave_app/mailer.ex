defmodule LeaveApp.Mailer do
  use Mailgun.Client,
      domain: Application.get_env(:leave_app, :mailgun_domain),
      key: Application.get_env(:leave_app, :mailgun_key)

  def send_email(name, email, type_of_leave, no_of_days, last_day_at_work, first_day_back_at_work) do
      send_email to: Application.get_env(:leave_app, :admin_user),
           from: email,
           subject: "Leave Request from #{name}",
           html: "<h2>Leave Request</h2>
              <strong>&nbsp;Name:&nbsp;</strong> #{name}<br/><br/>
             <strong>&nbsp;Email:&nbsp;</strong> #{email}<br/><br/>
             <strong>&nbsp;Type:&nbsp;</strong> #{type_of_leave}<br/><br/>
             <strong>&nbsp;No. of days:&nbsp;</strong> #{no_of_days}<br/><br/>
             <strong>&nbsp;Last day at work:&nbsp;</strong> #{last_day_at_work}<br/><br/>
             <strong>&nbsp;First day back at work:&nbsp;</strong> #{first_day_back_at_work}<br/><br/>
             <hr>"
   end
end
