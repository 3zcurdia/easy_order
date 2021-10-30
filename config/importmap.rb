# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.js'
pin '@hotwired/stimulus', to: 'stimulus.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin '@rails/ujs', to: 'https://ga.jspm.io/npm:@rails/ujs@6.1.4-1/lib/assets/compiled/rails-ujs.js'
pin '@rails/actioncable', to: 'https://ga.jspm.io/npm:@rails/actioncable@6.1.4-1/app/assets/javascripts/action_cable.js'
pin '@rails/activestorage', to: 'https://ga.jspm.io/npm:@rails/activestorage@6.1.4-1/app/assets/javascripts/activestorage.js'
pin 'piklor.js', to: 'https://ga.jspm.io/npm:piklor.js@1.2.0/src/piklor.js'
pin 'sortablejs', to: 'https://ga.jspm.io/npm:sortablejs@1.14.0/modular/sortable.esm.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
