// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'bootstrap'
import '../assets/stylesheets/application.css'
import $ from 'jquery'
import Popper from 'popper.js'
import 'bootstrap/dist/css/bootstrap.min.css'
import '../assets/stylesheets/paginator.css'


window.jQuery = $
window.$ = $
window.Popper = Popper
