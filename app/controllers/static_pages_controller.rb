class StaticPagesController < ApplicationController
  def contact; end

  def create_contact
    @name = params[:name]
    @message = params[:message]
    @recipient = params[:email]

    if @name.blank? || @message.blank? || @recipient.blank? || !@recipient.match?(/\A[^@\s]+@[^@\s]+\z/)
      flash[:alert] = "すべての項目を入力してください。"
      redirect_to contact_path
    else
      ContactMailer.contact_email(@name, @recipient, @message).deliver_now
      flash[:notice] = "お問い合わせを送信しました。ご回答をお待ちください。"
      redirect_to contact_path
    end
  end
  
  def terms; end
  
  def privacy; end
end
