window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
console.log(priceInput);
  priceInput.addEventListener("input", () => {
const inputValue = priceInput.value;
const addTaxDom = document.getElementById("add-tax-price");
const addProfitDom = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    addProfitDom.innerHTML = Math.floor(inputValue * 0.9);
})
});



// const addTaxDom = document.getElementById("profit");を入力
// 手順3を行う