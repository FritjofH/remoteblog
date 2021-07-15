// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import mrujs from "mrujs";
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

mrujs.start();
Turbolinks.start()
ActiveStorage.start()

const Trix = require("trix")
require("@rails/actiontext")

Trix.config.blockAttributes.heading1.tagName = "h3";

import Sortable from 'sortablejs'

import '../stylesheets/application';


document.addEventListener('turbolinks:load', () => {
  document.addEventListener('click', (event) => {
    let element = event.target.closest('.paragraph-content')
    if (!element) return;

    element.classList.add('d-none')
    element.nextElementSibling.classList.remove('d-none')
  })

  document.addEventListener('click', (event) => {
    if (!event.target.matches('.cancel')) return;
    event.preventDefault()

    let element = event.target.closest('.paragraph-form')

    element.classList.add('d-none')
    element.previousElementSibling.classList.remove('d-none')
  })

  document.addEventListener('click', (event) => {
    if (!event.target.matches('.close')) return;
    let element = event.target.closest('.paragraph-form')
  
    element.classList.add('d-none')
    element.previousElementSibling.classList.remove('d-none')
  
    //var html = "<div class='trix-content'>" + element.content.body.html_safe + "</div>"
    //element.previousElementSibling.innerHTML = html
  })

  if (document.getElementById('elements')) {
    let element = document.getElementById('elements')
    Sortable.create(elements, { animation: 150 })
  }
})

import "controllers"
