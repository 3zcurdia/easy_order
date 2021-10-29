// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "@hotwired/turbo-rails"
import "controllers"

Rails.start()
ActiveStorage.start()
//
// require("../src/notifications")
// require("../src/nav_menu")
// require("../src/colorpicker")
