class MessagesController < ApplicationController

  def create
    m = Message.new(
      name: params[:message][:name],
      content: params[:message][:content]
    )
    if m.save
      redirect_to about_path, notice: "Feedback successfully sent!"
    else
      redirect_to about_path, alert: m.errors.full_messages
    end
  end

end