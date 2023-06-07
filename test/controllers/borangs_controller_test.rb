require "test_helper"

class BorangsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @borang = borangs(:one)
  end

  test "should get index" do
    get borangs_url
    assert_response :success
  end

  test "should get new" do
    get new_borang_url
    assert_response :success
  end

  test "should create borang" do
    assert_difference("Borang.count") do
      post borangs_url, params: { borang: { alamat_emel: @borang.alamat_emel, alamat_pejabat: @borang.alamat_pejabat, alamat_rumah: @borang.alamat_rumah, alamat_surat: @borang.alamat_surat, darjah_kebesaran: @borang.darjah_kebesaran, darjah_negeri: @borang.darjah_negeri, darjah_pasangan: @borang.darjah_pasangan, gambar_ahli: @borang.gambar_ahli, jawatan: @borang.jawatan, jenis_kenderaanf: @borang.jenis_kenderaanf, jenis_kenderaans: @borang.jenis_kenderaans, nama_pasangan: @borang.nama_pasangan, nama_penuh: @borang.nama_penuh, no_fax: @borang.no_fax, no_ic: @borang.no_ic, no_ic_pasangan: @borang.no_ic_pasangan, no_kenderaanf: @borang.no_kenderaanf, no_kenderaans: @borang.no_kenderaans, no_pejabat: @borang.no_pejabat, no_rumah: @borang.no_rumah, no_rumah_pasangan: @borang.no_rumah_pasangan, no_tel: @borang.no_tel, no_tel_pasangan: @borang.no_tel_pasangan, resit: @borang.resit, tarikh_anugerah: @borang.tarikh_anugerah } }
    end

    assert_redirected_to borang_url(Borang.last)
  end

  test "should show borang" do
    get borang_url(@borang)
    assert_response :success
  end

  test "should get edit" do
    get edit_borang_url(@borang)
    assert_response :success
  end

  test "should update borang" do
    patch borang_url(@borang), params: { borang: { alamat_emel: @borang.alamat_emel, alamat_pejabat: @borang.alamat_pejabat, alamat_rumah: @borang.alamat_rumah, alamat_surat: @borang.alamat_surat, darjah_kebesaran: @borang.darjah_kebesaran, darjah_negeri: @borang.darjah_negeri, darjah_pasangan: @borang.darjah_pasangan, gambar_ahli: @borang.gambar_ahli, jawatan: @borang.jawatan, jenis_kenderaanf: @borang.jenis_kenderaanf, jenis_kenderaans: @borang.jenis_kenderaans, nama_pasangan: @borang.nama_pasangan, nama_penuh: @borang.nama_penuh, no_fax: @borang.no_fax, no_ic: @borang.no_ic, no_ic_pasangan: @borang.no_ic_pasangan, no_kenderaanf: @borang.no_kenderaanf, no_kenderaans: @borang.no_kenderaans, no_pejabat: @borang.no_pejabat, no_rumah: @borang.no_rumah, no_rumah_pasangan: @borang.no_rumah_pasangan, no_tel: @borang.no_tel, no_tel_pasangan: @borang.no_tel_pasangan, resit: @borang.resit, tarikh_anugerah: @borang.tarikh_anugerah } }
    assert_redirected_to borang_url(@borang)
  end

  test "should destroy borang" do
    assert_difference("Borang.count", -1) do
      delete borang_url(@borang)
    end

    assert_redirected_to borangs_url
  end
end
