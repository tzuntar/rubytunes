class AddFuzzySearchExtension < ActiveRecord::Migration[7.0]
  def up
    execute "CREATE EXTENSION pg_trgm;"
  end

  def down
    execute "DROP EXTENSION pg_trgm;"
  end
end
