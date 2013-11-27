class AddLinkHrefColumnsToNews < ActiveRecord::Migration
  def change
    add_column :news, :link_href, :string
  end
end
