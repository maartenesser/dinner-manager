const updatingAttendingStatus = (event) => {
  fetch("http://localhost:3000", {
    method: "POST",
    body: JSON.stringify({ query: event.currentTarget.value })
  })
};

const input = document.querySelector("#attending");
input.addEventListener("click", updatingAttendingStatus);
