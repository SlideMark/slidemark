class AddSettingToPost < ActiveRecord::Migration
  def change
      remove_column :posts, :setting_id
      add_column :posts, :s_controls, :integer, limit:1, default: 1, null: false
      add_column :posts, :s_progress, :integer, limit:1, default: 1, null: false
      add_column :posts, :s_slideNumber, :integer, limit:1, default: 0, null: false
      add_column :posts, :s_history, :integer, limit:1, default: 0, null: false
      add_column :posts, :s_keyboard, :integer, limit:1, default: 1, null: false
      add_column :posts, :s_overview, :integer, limit:1, default: 1, null: false
      add_column :posts, :s_center, :integer, limit:1, default: 1, null: false
      add_column :posts, :s_touch, :integer, limit:1, default: 1, null: false
      add_column :posts, :s_loop, :integer, limit:1, default: 0, null: false
      add_column :posts, :s_rtl, :integer, limit:1, default: 0, null: false
      add_column :posts, :s_fragments, :integer, limit:1, default: 1, null: false
      add_column :posts, :s_embedded, :integer, limit:1, default: 0, null: false
      add_column :posts, :s_autoSlide, :integer, default: 0, null: false
      add_column :posts, :s_autoSlideStoppable, :integer, limit:1, default: 1, null: false
      add_column :posts, :s_mouseWheel, :integer, limit:1, default: 0, null: false
      add_column :posts, :s_hideAddressBar, :integer, limit:1, default: 1, null: false
      add_column :posts, :s_previewLinks, :integer, limit:1, default: 0, null: false
      add_column :posts, :s_viewDistance, :integer, limit:2, default: 3, null: false
      add_column :posts, :s_transition, :string, default: 'default', null: false
      add_column :posts, :s_transitionSpeed, :string, default: 'default', null: false
      add_column :posts, :s_theme, :string, default: 'default', null: false
      add_column :posts, :s_backgroundTransition, :string, default: 'default', null: false
      add_column :posts, :s_parallaxBackgroundImage, :string
      add_column :posts, :s_parallaxBackgroundSize, :string
  end
end
