class Borang < ApplicationRecord
    
    
    mount_uploader :gambar_ahli, GambarAhliUploader # Tells rails to use this uploader for this model.
    
    validates :nama_penuh, presence: true # Make sure the owner's name is present.
    belongs_to :user
    validates :user_id, uniqueness: true, on: :create
    has_one :payment, dependent: :destroy

    validates :jawatan, presence: { message: "Sila masukkan jawatan anda" }, allow_blank: false
    validates :tarikh_anugerah, presence: { message: "Sila masukkan tarikh anugerah"}, allow_blank: false
    validates :alamat_pejabat, presence: { message: "Sila masukkan alamat pejabat anda"}, allow_blank: false
    validates :darjah_negeri_id, presence: { message: "Sila pilih darjah negeri anda"}, allow_blank: false
    validates :darjah_kebesaran_id, presence: { message: "Sila pilih darjah kebesaran anda"}, allow_blank: false
    validates :alamat_surat, presence: { message: "Sila masukkan alamat surat anda"}
    validates :alamat_rumah, presence: { message: "Sila masukkan alamat rumah anda"}
    validates :alamat_emel, presence: { message: "Sila letakkan format alamat emel yang betul seperti 'emel@contoh.com' "}, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
    validates :no_pejabat, presence: {message: "Sila masukkan no pejabat, jika tiada tulis 'Tiada'"}, numericality: { only_integer: true, message: "Angka sahaja" }
    validates :no_fax, presence: {message: "Sila masukkan no fax, jika tiada tulis 'Tiada'"}, numericality: { only_integer: true, message: "Angka sahaja" }
    validates :no_rumah, presence: {message: "Sila masukkan no rumah, jika tiada tulis 'Tiada' "}, numericality: { only_integer: true, message: "Angka sahaja" }
    validates :no_tel, presence: {message: "Sila masukkan no telefon anda" }, numericality: { only_integer: true, message: "Angka Sahaja" }, allow_blank: false
    validates :nama_pasangan, presence: { message: "Sila masukkan nama pasangan anda"}
    validates :no_ic_pasangan, presence: {message: "Sila masukkan no kad pengenalan pasangan anda"}, numericality: { only_integer: true, length: { is: 12 }, message: "Angka sahaja dan 12 digit tanpa tanda '-' " }
    validates :no_tel_pasangan, presence: {message: "Sila masukkan no telefon pasangan anda"}, numericality: { only_integer: true , message: "Angka sahaja"}
    validates :no_rumah_pasangan, presence: {message: "Sila masukkan no rumah pasangan anda"}, numericality: { only_integer: true, message: "Angka sahaja" }
    validates :darjah_pasangan, presence: { message: "Sila pilih darjah pasangan anda, jika tiada tulis 'Tiada'"}
    validates :no_kenderaanf, presence: { message: "Sila masukkan nombor kenderaan anda" }
    validates :jenis_kenderaanf, presence: { message: "Sila masukkan jenis kenderaan anda" }
    validates :gambar_ahli, presence: { message: "Sila masukkan gambar ahli anda"}
    


    def generate_checksum
        string = "#{alamat_emel}|#{nama_penuh}|#{no_tel}||#{id}|#{jawatan}|http://localhost:3000/borangs/#{id}/payment_redirect|#{total_price}|170efa8b-c7d7-46d3-bb50-42298a80a89f"
        checksum_token = "81a41da2ead67c4ef80dc6c963ed4efc2e3a887c9e5e9b9d5f369a1d29747f5f"
        OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, string)  

    end

    

end
