window.addEventListener('load', () => {
  const arrjsonInput = document.getElementById("arr_json");
  for (let i = 0; i < arrjsonInput.value ; i++) {
    const purchaseInput = document.getElementById("purchase-date"+i);
    const expirationInput = document.getElementById("expiration-date"+i);
    const purchaseDate = new Date(purchaseInput.innerHTML);
    const expirationDate = new Date(expirationInput.innerHTML);
    const daysLeft = document.getElementById("days-left"+i);
    daysLeft.innerHTML = (Math.floor( (expirationDate.getTime() - purchaseDate.getTime()) / ( 1000 * 60 * 60 * 24 )));
  }  
});