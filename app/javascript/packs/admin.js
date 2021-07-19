import {Chart, LineElement, LineController, CategoryScale, LinearScale, PointElement} from 'chart.js';
Chart.register(LineElement, LineController, CategoryScale, LinearScale, PointElement);

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
})