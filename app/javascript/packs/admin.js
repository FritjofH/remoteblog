import Sortable from 'sortablejs'

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
  
    var html = "<div class='trix-content'>" + element.querySelector("input[name='element[content]']").value + "</div>"
    element.previousElementSibling.innerHTML = html
  })

  if (document.getElementById('elements')) {
    let element = document.getElementById('elements')
    Sortable.create(elements, { animation: 150 })
  }
})