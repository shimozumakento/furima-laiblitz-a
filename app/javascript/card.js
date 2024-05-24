const pay = () => {
  const numberForm = document.getElementById('number-form');
  const expiryForm = document.getElementById('expiry-form');
  const cvcForm = document.getElementById('cvc-form');
  const form = document.getElementById('charge-form');

  if (numberForm && expiryForm && cvcForm && form) {
    if (!window.payjp) {
      window.payjp = Payjp('pk_test_f661abea2b0d9bcea09e00c5');
    }
    const elements = window.payjp.elements();
    const numberElement = elements.create('cardNumber');
    const expiryElement = elements.create('cardExpiry');
    const cvcElement = elements.create('cardCvc');

    numberElement.mount('#number-form');
    expiryElement.mount('#expiry-form');
    cvcElement.mount('#cvc-form');

    form.addEventListener("submit", (e) => {
      window.payjp.createToken(numberElement).then(function (response) {
        if (response.error) {
        } else {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' >`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
          debugger
        }
        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();
        document.getElementById("charge-form").submit();
      });
      e.preventDefault();
    });
  }
};

window.addEventListener("turbo:load", pay);