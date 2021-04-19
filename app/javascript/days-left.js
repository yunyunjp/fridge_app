window.addEventListener('load', () => {
  const purchaseInput = document.getElementById("purchase-date");
  const expirationInput = document.getElementById("expiration-date");
  const purchaseDate = new Date(purchaseInput.innerHTML);
  const expirationDate = new Date(expirationInput.innerHTML);
  const daysLeft = document.getElementById("days-left");
  daysLeft.innerHTML = (Math.floor( (expirationDate.getTime() - purchaseDate.getTime()) / ( 1000 * 60 * 60 * 24 )));
});