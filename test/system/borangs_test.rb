require "application_system_test_case"

class BorangsTest < ApplicationSystemTestCase
  setup do
    @borang = borangs(:one)
  end

  test "visiting the index" do
    visit borangs_url
    assert_selector "h1", text: "Borangs"
  end

  test "should create borang" do
    visit borangs_url
    click_on "New borang"

    fill_in "Alamat emel", with: @borang.alamat_emel
    fill_in "Alamat pejabat", with: @borang.alamat_pejabat
    fill_in "Alamat rumah", with: @borang.alamat_rumah
    fill_in "Alamat surat", with: @borang.alamat_surat
    fill_in "Darjah kebesaran", with: @borang.darjah_kebesaran
    fill_in "Darjah negeri", with: @borang.darjah_negeri
    fill_in "Darjah pasangan", with: @borang.darjah_pasangan
    fill_in "Gambar ahli", with: @borang.gambar_ahli
    fill_in "Jawatan", with: @borang.jawatan
    fill_in "Jenis kenderaanf", with: @borang.jenis_kenderaanf
    fill_in "Jenis kenderaans", with: @borang.jenis_kenderaans
    fill_in "Nama pasangan", with: @borang.nama_pasangan
    fill_in "Nama penuh", with: @borang.nama_penuh
    fill_in "No fax", with: @borang.no_fax
    fill_in "No ic", with: @borang.no_ic
    fill_in "No ic pasangan", with: @borang.no_ic_pasangan
    fill_in "No kenderaanf", with: @borang.no_kenderaanf
    fill_in "No kenderaans", with: @borang.no_kenderaans
    fill_in "No pejabat", with: @borang.no_pejabat
    fill_in "No rumah", with: @borang.no_rumah
    fill_in "No rumah pasangan", with: @borang.no_rumah_pasangan
    fill_in "No tel", with: @borang.no_tel
    fill_in "No tel pasangan", with: @borang.no_tel_pasangan
    fill_in "Resit", with: @borang.resit
    fill_in "Tarikh anugerah", with: @borang.tarikh_anugerah
    click_on "Create Borang"

    assert_text "Borang was successfully created"
    click_on "Back"
  end

  test "should update Borang" do
    visit borang_url(@borang)
    click_on "Edit this borang", match: :first

    fill_in "Alamat emel", with: @borang.alamat_emel
    fill_in "Alamat pejabat", with: @borang.alamat_pejabat
    fill_in "Alamat rumah", with: @borang.alamat_rumah
    fill_in "Alamat surat", with: @borang.alamat_surat
    fill_in "Darjah kebesaran", with: @borang.darjah_kebesaran
    fill_in "Darjah negeri", with: @borang.darjah_negeri
    fill_in "Darjah pasangan", with: @borang.darjah_pasangan
    fill_in "Gambar ahli", with: @borang.gambar_ahli
    fill_in "Jawatan", with: @borang.jawatan
    fill_in "Jenis kenderaanf", with: @borang.jenis_kenderaanf
    fill_in "Jenis kenderaans", with: @borang.jenis_kenderaans
    fill_in "Nama pasangan", with: @borang.nama_pasangan
    fill_in "Nama penuh", with: @borang.nama_penuh
    fill_in "No fax", with: @borang.no_fax
    fill_in "No ic", with: @borang.no_ic
    fill_in "No ic pasangan", with: @borang.no_ic_pasangan
    fill_in "No kenderaanf", with: @borang.no_kenderaanf
    fill_in "No kenderaans", with: @borang.no_kenderaans
    fill_in "No pejabat", with: @borang.no_pejabat
    fill_in "No rumah", with: @borang.no_rumah
    fill_in "No rumah pasangan", with: @borang.no_rumah_pasangan
    fill_in "No tel", with: @borang.no_tel
    fill_in "No tel pasangan", with: @borang.no_tel_pasangan
    fill_in "Resit", with: @borang.resit
    fill_in "Tarikh anugerah", with: @borang.tarikh_anugerah
    click_on "Update Borang"

    assert_text "Borang was successfully updated"
    click_on "Back"
  end

  test "should destroy Borang" do
    visit borang_url(@borang)
    click_on "Destroy this borang", match: :first

    assert_text "Borang was successfully destroyed"
  end
end
