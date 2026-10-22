/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function bookSlot(btn) {

  let card = btn.parentElement;
  let statusText = card.querySelector(".status");
  let slotName = card.querySelector("h5").innerText;

  

  let confirmBooking = confirm("Do you want to book this slot?");
  
  if (confirmBooking) {

    // ask date
    let date = prompt("Enter booking date (YYYY-MM-DD)");
    if (!date) return;

    // ask start time
    let startTime = prompt("Enter start time (HH:MM)");
    if (!startTime) return;

    // ask hours
    let hours = prompt("Enter number of hours");
    if (!hours) return;

//    // change UI
//    card.classList.remove("available");
//    card.classList.add("booked");

    statusText.innerText = "Booked on " + date + " at " + startTime;

    alert("✅ Slot booked successfully!");
  }
}



function cancelSlot(btn) {

  let card = btn.parentElement;
  let statusText = card.querySelector(".status");

  if (card.classList.contains("available")) {
    alert("⚠️ Slot is already free");
    return;
  }

  let confirmCancel = confirm("Cancel this booking?");

  if (confirmCancel) {
    card.classList.remove("booked");
    card.classList.add("available");

    statusText.innerText = "Available";

    alert("✅ Booking cancelled");
  }
}



function bookSlot(btn) {

    let card = btn.parentElement;
    let slotName = card.querySelector("h5").innerText;

    // Open booking page with selected slot
    window.location.href = "bookslot.jsp?slot=" + encodeURIComponent(slotName);
}


function cancelSlot(btn) {

    let card = btn.parentElement;

    if (card.classList.contains("available")) {
        alert("⚠️ Slot is already free");
        return;
    }

    let confirmCancel = confirm("Cancel this booking?");

    if (confirmCancel) {
        card.classList.remove("booked");
        card.classList.add("available");

        let statusText = card.querySelector(".status");
        statusText.innerText = "Available";

        alert("✅ Booking cancelled");
    }
}


function searchSlot() {

    let input = document.getElementById("searchBox").value.toLowerCase();
    let container = document.getElementById("slotContainer");
    let slots = Array.from(container.children);

    slots.sort((a, b) => {

        let textA = a.innerText.toLowerCase();
        let textB = b.innerText.toLowerCase();

        let matchA = textA.includes(input);
        let matchB = textB.includes(input);

        return matchB - matchA;
    });

    slots.forEach(slot => container.appendChild(slot));

    slots.forEach(slot => {

        if (slot.innerText.toLowerCase().includes(input)) {
            slot.style.display = "";
        } else {
            slot.style.display = "none";
        }

    });
}


let slotContainer = document.getElementById("slotContainer");

for (let i = 1; i <= 24; i++) {

    let col = document.createElement("div");

    col.className = "col-lg-2 col-md-2 col-sm-4 mb-4";

    let slot = document.createElement("div");

    slot.className = "slot-item available p-3 border rounded text-center";

    slot.innerHTML = `
        <h5>Slot ${i}</h5>

        <p class="status">Available</p>

        <button 
            class="btn btn-success btn-sm"
            onclick="bookSlot(this)">
            Book
        </button>

        <button 
            class="btn btn-danger btn-sm"
            onclick="cancelSlot(this)">
            Cancel
        </button>
    `;

    col.appendChild(slot);
    slotContainer.appendChild(col);
}
