class CreateBorangs < ActiveRecord::Migration[7.0]
  def change
    create_table :borangs do |t|
      t.string :nama_penuh
      t.string :no_ic
      t.string :jawatan
      t.date :tarikh_anugerah
      t.string :alamat_pejabat
      t.string :alamat_surat
      t.string :alamat_rumah
      t.string :alamat_emel
      t.string :no_pejabat
      t.string :no_fax
      t.string :no_rumah
      t.string :no_tel
      t.string :darjah_negeri
      t.string :darjah_kebesaran
      t.string :nama_pasangan
      t.string :no_ic_pasangan
      t.string :no_tel_pasangan
      t.string :no_rumah_pasangan
      t.string :darjah_pasangan
      t.string :no_kenderaanf
      t.string :jenis_kenderaanf
      t.string :no_kenderaans
      t.string :jenis_kenderaans
      t.string :gambar_ahli
      t.string :resit

      t.timestamps
    end
  end
end
