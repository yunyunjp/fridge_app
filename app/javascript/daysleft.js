window.addEventListener('load', () => {
  const purchaseInput = document.getElementById("purchase_date");
  const expirationInput = document.getElementById("expiration_date");
  const purchaseDate = new Date(purchaseInput.innerHTML);
  const expirationDate = new Date(expirationInput.innerHTML);
  const daysLeft = document.getElementById("days_left");
  daysLeft.innerHTML = (Math.floor( (expirationDate.getTime() - purchaseDate.getTime()) / ( 1000 * 60 * 60 * 24 )));
});