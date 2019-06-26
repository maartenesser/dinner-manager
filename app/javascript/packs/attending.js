
const checkSubmit = () => {
  const checkbox = document.querySelector(".attending-checkbox");

  checkbox.addEventListener('click', () => {
  const submitButton = document.querySelector(".submit-button-checkbox");
  submitButton.click();
  });

}

export default checkSubmit


