class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "referrals", "referees", :name => "referrals_referee_id_fk"
    add_foreign_key "referrals", "users", :name => "referrals_user_id_fk"
  end
end