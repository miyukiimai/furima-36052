const pay = () => {
  console.log("OK")
  Payjp.setPublicKey("pk_test_cb5eabd3c5f0979c3aabb8fe");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("form[card_number]"),
      cvc: formData.get("form[code]"),
      exp_month: formData.get("form[month]"),
      exp_year: `20${formData.get("form[year]")}`,
    };
    console.log(card);

    Payjp.createToken(card, (status, response) => {
      console.log(response)
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);