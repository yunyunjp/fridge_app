window.addEventListener('load', () => {
  const expirationInput = document.getElementById("expiration_date");
  const today = new Date();
  const expirationDate = new Date(expirationInput.innerHTML.trim());
  const daysLeft = document.getElementById("days_left");
  daysLeft.innerHTML = (Math.ceil( (expirationDate.getTime() - today.getTime()) / ( 1000 * 60 * 60 * 24 )));
 if (daysLeft.innerHTML <= 0) {
     const deadLine = document.getElementById("dead_line");
     deadLine.setAttribute("style", "color:#7945F5;text-decoration:underline #7945F5;");
     daysLeft.setAttribute("style", "color:#7945F5;text-decoration:underline #7945F5;");
    };
});