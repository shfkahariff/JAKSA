class PaymentsController < ApplicationController
  def index
    if current_user.admin?
      @payments = Payment.all
    else
      @payments = Payment.joins(:borang).where(borangs: { nama_penuh: current_user.nama_penuh, no_ic: current_user.no_ic })
      @payments = @payments.where(payment_status: "true")
      @payments = @payments.presence || Payment.none # explicitly filter out false payments
    end

  end

  def show
    @payment = Payment.find(params[:id])
  end
  
  # DELETE /borangs/1 or /borangs/1.json
  def destroy
    @payment = Payment.find(params[:id])
    if @payment
      @payment.destroy
      redirect_to payments_path, notice: "Bayaran berjaya dihapuskan."
    else
      redirect_to payments_path, notice: "ID Bayaran tidak dijumpai."
    end
  end
  
end
