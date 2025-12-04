window.addEventListener('turbo:load', () => {
  const price = () => {
  const priceInput = document.getElementById("item-price");
  const inputValue = priceInput.value; 
   if (!priceInput) {
    return;
  } 
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

   priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = inputValue - tax;
 }); 
};
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
  
});

