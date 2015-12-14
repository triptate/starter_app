class AddSlugToUser < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true

    # Protect against future migrations trying to refer to User if it doesn't exist
    if Object.const_defined? 'User'
      User.find_each &:save
    end
  end
end
