class AddSuperadminToUser < ActiveRecord::Migration
  def up
    add_column :users, :superadmin, :boolean, :null => false, :default => false

    User.create! do |r|
      r.email      = 'admin@antioquia.gov.co'
      r.password   = 'administrador'
      r.password_confirmation = 'administrador'
      r.superadmin = true
    end
  end

  def down
    remove_column :users, :superadmin
    User.find_by_email('admin@antioquia.gov.co').try(:delete)
  end
end
