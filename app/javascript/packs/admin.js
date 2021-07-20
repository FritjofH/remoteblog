import {Chart, LineElement, LineController, CategoryScale, LinearScale, PointElement} from 'chart.js';
Chart.register(LineElement, LineController, CategoryScale, LinearScale, PointElement);

import Sortable from 'sortablejs'

document.addEventListener('turbolinks:load', () => {
  
  var ctx = document.getElementById('page-views');
  if (ctx) {
    var myChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: JSON.parse(ctx.dataset.labels),
        datasets: [{
          label: 'Page Views',
          data: JSON.parse(ctx.dataset.data),
          fill: true,
          borderColor: 'rgb(0, 153, 153)',
          backgroundColor: 'rgb(10, 153, 153, 0.2)',
          tension: 0.1
        }]
      },
    });
  }

  var ctx = document.getElementById('unique-page-views');
  if (ctx) {
    var myChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: JSON.parse(ctx.dataset.labels),
        datasets: [{
          label: 'Unique Page Views',
          data: JSON.parse(ctx.dataset.data),
          fill: true,
          borderColor: 'rgb(255, 51, 51)',
          backgroundColor: 'rgb(255, 51, 51, 0.2)',
          tension: 0.1
        }]
      }
    });
  }

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