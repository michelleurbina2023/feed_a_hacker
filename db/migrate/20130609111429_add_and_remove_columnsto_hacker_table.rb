class AddAndRemoveColumnstoHackerTable < ActiveRecord::Migration
  def change
    remove_column :hackers, :portfolio_url
    remove_column :hackers, :address
    remove_column :hackers, :best_project
    remove_column :hackers, :stack
    remove_column :hackers, :objectives
    remove_column :hackers, :current_projects
    remove_column :hackers, :avatar_url
    add_column :hackers, :background_img, :string
    add_column :hackers, :project_img, :string
    add_column :hackers, :project_des, :string
    add_column :hackers, :project_url, :string
    add_column :hackers, :hackernews_url, :string
    add_column :hackers, :tag_line, :string
    add_column :hackers, :location, :string
    add_column :hackers, :title, :string
    add_column :hackers, :linkedin_url, :string
  end
end
