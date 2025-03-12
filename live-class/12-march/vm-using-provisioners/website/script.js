function updateDateTime() {
    var now = new Date();
    var dateTimeString = now.toLocaleString();
    document.getElementById("datetime").textContent = dateTimeString;
}

// Call the function initially
updateDateTime();

// Update the date and time every second
setInterval(updateDateTime, 1000);
