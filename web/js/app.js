const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".account-container");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
});

//login.jsp

//Javascript validation for login

  function validateLoginForm() {
                                var username = document.forms["signinForm"]["username"].value;
                                var password = document.forms["signinForm"]["password"].value;

                                if (username.trim() === "") {
                                    alert("Please enter a username.");
                                    return false;
                                }

                                if (password.trim() === "") {
                                    alert("Please enter a password.");
                                    return false;
                                }

                                return true;
                            }
                            
                            
// Javascript Validation for Sign up
                    function validateForm() {
                        var name = document.forms["signupForm"]["name"].value;
                        var username = document.forms["signupForm"]["username"].value;
                        var password = document.forms["signupForm"]["password"].value;
                        var confirmPassword = document.forms["signupForm"]["confirmPassword"].value;
                        var email = document.forms["signupForm"]["email"].value;

                        // Check if name contains a number
                        if (/\d/.test(name)) {
                            alert("Name cannot contain a number");
                            return false;
                        }
                        var emailPattern = /\S+@\S+\.\S+/;
                        if (!emailPattern.test(email)) {
                            alert("Email is not valid");
                            return false;
                        }
                        // Check username pattern
                        var usernamePattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,12}$/;
                        if (!usernamePattern.test(username)) {
                            alert("Username must contain at least 1 uppercase letter, 1 lowercase letter, 1 number, and be between 8 and 12 characters");
                            return false;
                        }

                        // Check password pattern
                        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,12}$/;
                        if (!passwordPattern.test(password)) {
                            alert("Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 number, and be between 8 and 12 characters");
                            return false;
                        }

                        if (password != confirmPassword) {
                            alert("Password and Confirm password do not match.");
                            return false;
                        }
                        // Check if email is valid


                        return true;
     
                   }
                   
         //team.jsp
         
         