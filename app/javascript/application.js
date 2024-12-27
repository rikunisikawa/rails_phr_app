// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"

// index.html.erbのテーブルのカラムにホバーを充てると、そのカラム全体がハイライトされる
document.addEventListener("DOMContentLoaded", function() {
  const table = document.querySelector(".table-hover-column");
  if (table) {
    const cells = table.querySelectorAll("td, th");
    // カラムにホバーを充てると、そのカラム全体がハイライトされる
    cells.forEach(cell => {
      cell.addEventListener("mouseover", function() {
        const index = this.cellIndex;
        const rows = table.querySelectorAll("tr");
        rows.forEach(row => {
          const cell = row.cells[index];
          if (cell) {
            cell.classList.add("highlight");
          }
        });
      });
      // ホバーを外すと、ハイライトが解除される
      cell.addEventListener("mouseout", function() {
        const index = this.cellIndex;
        const rows = table.querySelectorAll("tr");
        rows.forEach(row => {
          const cell = row.cells[index];
          if (cell) {
            cell.classList.remove("highlight");
          }
        });
      });
      // セルをクリックすると、その日付のレコードが表示される
      cell.addEventListener("click", function() {
        const index = this.cellIndex;
        const dateHeader = table.querySelector("thead th:nth-child(" + (index + 1) + ")");
        const date = dateHeader.dataset.date;
        const record = table.querySelector("tbody tr td:nth-child(" + (index + 1) + ")");
        if (record && record.innerText.trim() !== "") {
          window.location.href = "/records/" + record.dataset.recordId;
        } else {
          window.location.href = "/records/new?date=" + date;
        }
      });
    });
  }
});

// サイドバーの表示・非表示を切り替える
document.getElementById('sidebarToggle').addEventListener('click', function() {
  var sidebar = document.getElementById('sidebar');
  var content = document.querySelector('.col-md-10');
  if (sidebar.style.display === 'none') {
    sidebar.style.display = 'block';
    content.classList.remove('col-md-12');
    content.classList.add('col-md-10');
  } else {
    sidebar.style.display = 'none';
    content.classList.remove('col-md-10');
    content.classList.add('col-md-12');
  }
});


