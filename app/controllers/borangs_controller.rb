class BorangsController < ApplicationController
  before_action :set_borang, only: %i[ show edit update destroy ]
  #load_and_authorize_resource
  skip_before_action :verify_authenticity_token, only: [:payment_redirect]
 

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, notice: exception.message
  end

  # GET /borangs or /borangs.json
  def index
    if current_user.admin?
      @borangs = Borang.all
    else
      @borangs = Borang.where(user_id: current_user.id)
    end
  end

  # GET /borangs/1 or /borangs/1.json
  def show
    @borang = Borang.find(params[:id])
    @payment = Payment.find_by(borang_id: @borang.id)
  end

  # GET /borangs/new
  def new
    @borang = Borang.new(nama_penuh: current_user.nama_penuh, no_ic: current_user.no_ic)
    @borang.build_user
    @state_id = params[:state_id] || State.first.id # set default state ID if no state ID is provided
 
  end

  # GET /borangs/1/edit
  def edit
  end

  # POST /borangs or /borangs.json
  def create
    if current_user && current_user.borangs.present?
      redirect_to new_borang_path, notice: "Anda telah mengisi borang ini. Sila ke pautan 'kemaskini borang' untuk lihat dan kemaskini maklumat."
    else
      @borang = Borang.new(borang_params)
      @borang.user = current_user if current_user
      @borang.nama_penuh = current_user.nama_penuh
      @borang.no_ic = current_user.no_ic

      #for messkit
      if params[:extra] && params[:extra][:messkit].present?
        @borang.messkit = params[:extra][:messkit].reject(&:blank?)
      end
      
      #file upload
      @borang.gambar_ahli = params[:borang][:gambar_ahli]

      # for securepay
      if @borang.save
        user_id = current_user.id
        session[:user_id] = user_id
        
        params_api = {
          order_number: @borang.id,
          buyer_name: @borang.nama_penuh,
          buyer_email: @borang.alamat_emel,
          buyer_phone: @borang.no_tel,
          transaction_amount: @borang.total_price,
          product_description: @borang.jawatan,
          redirect_url: "http://localhost:3000/borangs/#{@borang.id}/payment_redirect",
          callback_url: "",
          uid: "170efa8b-c7d7-46d3-bb50-42298a80a89f",
          token: "iVuJ4B8JfFeaxaMowqSs",
          checksum: @borang.generate_checksum,
          redirect_post: true
        }

        redirect_post('https://sandbox.securepay.my/api/v1/payments', params: params_api)

      else
        respond_to do |format|
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @borang.errors, status: :unprocessable_entity }
        end
        
      end                                
   
      end
  end

  def payment_redirect
    user_id = session[:user_id]
    if user_id.present?
      user = User.find_by(id: params[:user_id])
      sign_in(user) if user.present?
    end

    #for payment status
    payment_status = params[:payment_status]
    if payment_status == "true"

    borang_id = params[:order_number]
    payment_params = {
      borang_id: borang_id,
      payment_status: params[:payment_status],
      payment_id: params[:payment_id],
      order_number: params[:order_number],
      buyer_name: params[:buyer_name],
      buyer_email: params[:buyer_email],
      buyer_phone: params[:buyer_phone],
      transaction_amount: params[:transaction_amount],
      status_url: params[:status_url],
      retry_url: params[:retry_url],
      receipt_url: params[:receipt_url]
    }

    @payment = Payment.new(payment_params)
    @payment.save

      @borang = Borang.find_by(id: params[:borang_id])
      redirect_to payment_path(@payment), notice: "Bayaran berjaya dibuat."
    else
    borang_id = params[:order_number]
    payment_params = {
      borang_id: borang_id,
      payment_status: params[:payment_status],
      payment_id: params[:payment_id],
      order_number: params[:order_number],
      buyer_name: params[:buyer_name],
      buyer_email: params[:buyer_email],
      buyer_phone: params[:buyer_phone],
      transaction_amount: params[:transaction_amount],
      status_url: params[:status_url],
      retry_url: params[:retry_url],
      receipt_url: params[:receipt_url]
    }

    @payment = Payment.new(payment_params)
    @payment.save

      @borang = Borang.find_by(id: params[:borang_id])
      redirect_to payment_path(@payment), notice: "Bayaran tidak berjaya dibuat. Sila klik URL ulangan untuk cuba lagi."
    end
  end
  

  # PATCH/PUT /borangs/1 or /borangs/1.json
  def update
    respond_to do |format|
      if @borang.update(borang_params)
        format.html { redirect_to borang_url(@borang), notice: "Borang berjaya disunting" }
        format.json { render :show, status: :ok, location: @borang }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @borang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borangs/1 or /borangs/1.json
  def destroy
    @borang.destroy

    respond_to do |format|
      format.html { redirect_to borangs_url, notice: "Borang berjaya dihapuskan." }
      format.json { head :no_content }
    end
  end

  def print
    @borang = Borang.find(params[:id])
  
    respond_to do |format|
      format.html # This is necessary to prevent the unknown format error
      format.pdf do
        render pdf: "borang",
               template: "borangs/print.html.erb",
               layout: "pdf.html",
               page_size: "A4",
               orientation: "Portrait",
               javascript_delay: 2000 # add a delay before printing to allow time for the PDF to load
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borang
      @borang = Borang.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def borang_params
      params.require(:borang).permit(:nama_penuh, :no_ic, :jawatan, :tarikh_anugerah, :alamat_pejabat, :alamat_surat, :alamat_rumah, :alamat_emel, :no_pejabat, :no_fax, :no_rumah, :no_tel, :nama_pasangan, :no_ic_pasangan, :no_tel_pasangan, :no_rumah_pasangan, :darjah_pasangan, :no_kenderaanf, :jenis_kenderaanf, :no_kenderaans, :jenis_kenderaans, :gambar_ahli, :user_id, :darjah_negeri_id, :darjah_kebesaran_id, :messkit, :total_price, user_attributes: [:id, :nama_penuh, :no_ic], no_kenderaanf: [], jenis_kenderaanf: [])

    end

    def payment_params
      params.require(:payment).permit(:order_number, :payment_status, :buyer_name, :buyer_email, :buyer_phone, :transaction_amount, :payment_id, :status_url, :retry_url, :receipt_url, :borang_id)
    end
    

    def previous_borang_path
      if current_user.borangs
        borang_path(current_user.borangs)
      else
        my_borang_path
      end
    end

    

  end