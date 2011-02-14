class AddAboutMeAndSkillsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :about_me, :text
    add_column :users, :skills, :text
  end

  def self.down
    remove_column :users, :about
    remove_column :users, :skills
  end
end
