class NoticeMailer < ApplicationMailer
  default from: "info@coworkingk.jp"

  def contact_email(contact)
    @contact = contact
    mail(
      to: "keisuke.inaba.cpa@gmail.com",
      subject: "Contact from Co-working K")
  end

  def newtask_email(task, user)
    @task = task
    @user = user
    mail(
      to: "keisuke.inaba.cpa@gmail.com",
      subject: "New Task Created from Co-working K")
  end

  def updatetask_email(task, user)
    @task = task
    @user = user
    mail(
      to: "keisuke.inaba.cpa@gmail.com",
      subject: "Task #{@task.title} - #{@task.jobtype} Updated from Co-working K")
  end

  def newmsg_email(message, touser, fmuser, task)
    @message = message
    @touser = touser
    @fmuser = fmuser
    @task = task
    mail(
      to: @touser.email,
      subject: "Co-working K: New Message about #{@task.title} - #{@task.jobtype} ")
  end

end
