class RenameSubjuctClassToSubjectClass < ActiveRecord::Migration
  def change
    rename_column :permissions, :subjuct_class, :subject_class
  end
end
