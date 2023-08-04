document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPriceElement = document.getElementById('add-tax-price');
  const profitElement = document.getElementById('profit');

  priceInput.addEventListener('input', () => {
    const price = parseInt(priceInput.value, 10);
    const tax = Math.floor(price * 0.1);
    const profit = price - tax;

    addTaxPriceElement.textContent = tax.toLocaleString();
    profitElement.textContent = profit.toLocaleString();
  });
});



