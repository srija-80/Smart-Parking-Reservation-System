/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function registerUser() {
    let email = document.getElementById("email").value;
    let mobile = document.getElementById("mobilenumber").value;
    let password = document.getElementById("password").value;
    let confirm = document.getElementById("confirm").value;
    
   
    let passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}$/
    
    if(!passwordPattern.test(password)){
        alert("password must contains uppercase, lowercase, numbers and be at least 6 characters");
        return false;
    }
    if (password !== confirm) {
        alert("Passwords do not match");
        return false;
    }
    if(mobile.length != 10){
        alert("enter valid 10 digit mobile number");
        return false;
    }

    return true;
}
function loginUser() {
    let email = document.getElementById("loginEmail").value;
    let password = document.getElementById("loginPassword").value;

    if (email === "" || password === "") {
        alert("Please fill all fields");
        return false;
    }
    return true;
}



