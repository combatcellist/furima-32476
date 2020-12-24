const pay = () => {
  Payjp.setPublicKey("pk_test_726979b1bc6856bb757be296");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge_form");
    const formDate = new FormData(formResult);

    const card = {
      number: formDate.get("order[number]"),
      cvc: formDate.get("order[cvc]"),
      exp_month: formDate.get("order[exp_month]"),
      exp_year: `20${formDate.get("order[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
    if (status == 200) {
      const token = response.id;
   };
  };
};

window.addEventListener("load", pay);