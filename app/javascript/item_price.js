window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  console.log(priceInput);
  priceInput.addEventListener("input", () => {
    console.log("イベント発火");
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const totalAmount = document.getElementById("profit");
    console.log(addTaxDom.innerHTML);
    totalAmount.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML );
  })
});

