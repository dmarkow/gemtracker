class CreateRubygems < ActiveRecord::Migration
  def self.up
    create_table :rubygems do |t|
      t.string :name
      t.integer :downloads
      t.string :info
      t.integer :version_downloads
      t.string :version
      t.string :homepage_uri
      t.string :bug_tracker_uri
      t.string :source_code_uri
      t.string :gem_uri
      t.string :project_uri
      t.string :mailing_list_uri
      t.string :documentation_uri
      t.string :wiki_uri

      t.timestamps
    end
  end

  def self.down
    drop_table :rubygems
  end
end
