class CreateHackers < ActiveRecord::Migration
  def self.up
    create_table :hackers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :current_projects
      t.string :objectives
      t.string :git_url
      t.string :twitter_url
      t.string :avatar_url
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :portfolio_url
      t.string :stack
      t.string :best_project

      t.timestamps
    end
  end

  def self.down
    drop_table :hackers
  end
end
