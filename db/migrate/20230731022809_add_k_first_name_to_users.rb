class AddKFirstNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :k_first_name, :string
  end
end
