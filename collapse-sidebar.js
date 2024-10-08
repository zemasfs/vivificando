document.addEventListener("DOMContentLoaded", function() {
  // Encontra o botão de colapso no sidebar
  const collapseButton = document.querySelector('.quarto-sidebar-toggle');
  
  // Se o botão de colapso existir, simula um clique nele para colapsar o sidebar
  if (collapseButton) {
    collapseButton.click();
  }
});
