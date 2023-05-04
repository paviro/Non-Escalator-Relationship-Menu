const aboutButton = document.getElementById("aboutButton");
const dialog = document.getElementById("aboutModal");

function openCheck(dialog) {
  if (dialog.open) {
    console.log("Dialog open");
  } else {
    console.log("Dialog closed");
  }
}

// Update button opens a modal dialog
aboutButton.addEventListener("click", () => {
  dialog.showModal();
  openCheck(dialog);
});

// Thanks https://blog.webdevsimplified.com/2023-04/html-dialog
dialog.addEventListener("click", e => {
  const dialogDimensions = dialog.getBoundingClientRect()
  if (
    e.clientX < dialogDimensions.left ||
    e.clientX > dialogDimensions.right ||
    e.clientY < dialogDimensions.top ||
    e.clientY > dialogDimensions.bottom
  ) {
    dialog.close()
  }
})