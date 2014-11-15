class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer "controls", limit:1, default: 1, null: false
      t.integer "progress", limit:1, default: 1, null: false
      t.integer "slideNumber", limit:1, default: 0, null: false
      t.integer "history", limit:1, default: 0, null: false
      t.integer "keyboard", limit:1, default: 1, null: false
      t.integer "overview", limit:1, default: 1, null: false
      t.integer "center", limit:1, default: 1, null: false
      t.integer "touch", limit:1, default: 1, null: false
      t.integer "loop", limit:1, default: 0, null: false
      t.integer "rtl", limit:1, default: 0, null: false
      t.integer "loop", limit:1, default: 0, null: false
      t.integer "fragments", limit:1, default: 1, null: false
      t.integer "embedded", limit:1, default: 0, null: false
      t.integer "autoSlide", limit:1, default: 1, null: false
      t.integer "autoSlideStoppable", limit:1, default: 1, null: false
      t.integer "mouseWheel", limit:1, default: 0, null: false
      t.integer "hideAddressBar", limit:1, default: 1, null: false
      t.integer "previewLinks", limit:1, default: 0, null: false
      t.string  "transition", default: 'default', null: false
      t.string  "transitionSpeed", default: 'default', null: false
      t.string  "backgroundTransition", default: 'default', null: false
      t.integer "viewDistance", limit: 2, defaut: 3, null: false
      t.string "parallaxBackgroundImage"
      t.string "parallaxBackgroundSize"
      t.timestamps
    end
  end
end
