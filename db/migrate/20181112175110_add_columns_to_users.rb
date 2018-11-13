class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :flag_public_email, :boolean, after: :email
    add_column :users, :username, :string, after: :flag_public_email
    add_column :users, :first_name, :string, after: :username
    add_column :users, :last_name, :string, after: :first_name
    add_column :users, :website_url, :string, after: :last_name
    add_column :users, :organization, :string, after: :website_url
    add_column :users, :location, :string, after: :organization
    add_column :users, :description, :text, after: :location
  end
end
