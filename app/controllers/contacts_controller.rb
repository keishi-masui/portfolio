class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render action: 'confirm'
    else
      flash[:notice] = '※書き間違いを訂正してください'
      render action: 'new'
    end
  end


  def create
    @contact = Contact.create(contact_params)
    MailSenderMailer.inquiry(@contact).deliver
    respond_to do |format|
      if @contact.save
        format.html {render action: 'create'}
      else
        format.html {render action: 'new'}
      end
    end
  end


private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
