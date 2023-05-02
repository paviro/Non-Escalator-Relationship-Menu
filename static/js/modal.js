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
