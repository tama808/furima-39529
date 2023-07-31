class AddKFamilyNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :k_family_name, :string
  end
end
