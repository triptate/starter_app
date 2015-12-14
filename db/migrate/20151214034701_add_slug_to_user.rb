class AddSlugToUser < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true

    # Protect against future migrations trying to refer to User if model no longer exists
    begin
      User.find_each &:save
    rescue
      puts 'User is not defined'
    end
  end
end
