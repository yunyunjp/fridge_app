window.addEventListener('load', () => {
  const arrjsonInput = document.getElementById("arr_json");
  for (let i = 0; i < arrjsonInput.value ; i++) {
    const expirationInput = document.getElementById("expiration-date"+i);
    const today = new Date();
    const expirationDate = new Date(expirationInput.innerHTML);
    const daysLeft = document.getElementById("days-left"+i);
    daysLeft.innerHTML = (Math.round( (expirationDate.getTime() - today.getTime()) / ( 1000 * 60 * 60 * 24 )));
    if (daysLeft.innerHTML <= 0) {
     const deadLine = document.getElementById("dead-line"+i);
     deadLine.setAttribute("style", "color:#7945F5;text-decoration:underline #7945F5;");
     daysLeft.setAttribute("style", "color:#7945F5;text-decoration:underline #7945F5;");
    };
  };
});