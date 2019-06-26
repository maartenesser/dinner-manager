
const checkSubmit = () => {
  const checkbox = document.querySelector(".attending-checkbox");

  checkbox.addEventListener('click', () => {
  const submitButton = document.querySelector(".submit-button-checkbox");
  submitButton.click();
  });
  console.log("JOJO");

}

export default checkSubmit


