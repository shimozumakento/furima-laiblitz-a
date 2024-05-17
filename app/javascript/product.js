var priceInput = document.getElementById("item-price");
var salesFeeOutput = document.getElementById("add-tax-price");
var profitOutput = document.getElementById("profit");

priceInput.addEventListener("input", function() {
  var price = parseFloat(priceInput.value);
  var price = parseFloat(priceInput.value) || 0;

  
  var feeRate = 0.10;
  var fee = price * feeRate;
  fee = Math.floor(fee);
  var profit = Math.floor(price - fee);

  
  salesFeeOutput.textContent = Math.floor(fee) ;
  profitOutput.textContent =   profit ;
});



