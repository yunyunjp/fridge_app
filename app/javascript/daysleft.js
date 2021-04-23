window.addEventListener('load', () => {
  const expirationInput = document.getElementById("expiration_date");
  const today = new Date();
  const expirationDate = new Date(expirationInput.innerHTML);
  console.log(expirationDate)
  const daysLeft = document.getElementById("days_left");
  daysLeft.innerHTML = (Math.round( (expirationDate.getTime() - today.getTime()) / ( 1000 * 60 * 60 * 24 )));
});