import 'bootstrap'
import mrujs from "mrujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "controllers"
import '../stylesheets/application';

mrujs.start()
Turbolinks.start()
ActiveStorage.start()

const Trix = require("trix")
require("@rails/actiontext")

Trix.config.blockAttributes.heading1.tagName = "h3";