class Payment < ApplicationRecord
    belongs_to :borang

    def status
      payment_status == "true" ? "Berjaya" : "Gagal"
    end
    
      
end


          