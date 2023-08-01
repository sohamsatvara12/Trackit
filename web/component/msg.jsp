<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        
        <style>
            .message {
                position: fixed;
                top: -100px;
                left: 50%;
                transform: translate(-50%, 0%);
                z-index: 9999;
                display: inline-block;
                padding: 1.3rem 4rem;
                background-color: #CBC3E3;
                color: var(--black);
                border: 1.5px solid white;
                border-radius: 3rem;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
                animation: slide-down 0.4s ease-out forwards;
                margin-top: 3.5rem;
            }


            .message p {
                font-size: 1.9rem;
            }

            .close-btn {
                position: absolute;
                top: 0;
                right: 0;
                color: white;
                font-size: 20px;
                font-weight: bold;
                cursor: pointer;
            }


            /* CSS for the animation */
            @keyframes slide-down {
                0% {
                    top: -100px;
                    opacity: 0;
                }

                100% {
                    top: 50px;
                    opacity: 1;
                }
            }

        </style>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var messageElement = document.querySelector('.message');
                var closeBtn = document.querySelector('.close-btn');
           
                if (messageElement) {
                    closeBtn.addEventListener('click', function () {
                        messageElement.style.display = 'none';
                    });

                    var messageDuration = 3000; // Set the duration of the message in milliseconds
                    
            });
        </script>
    </head>

    <body>
        <%
                if (session.getAttribute("Msg") != null) {
        %>
        <div class="message">
            <span class="close-btn" onclick="this.parentElement.style.display = 'none'">&times;</span>
            <p class="message-text"><%= session.getAttribute("Msg") %></p>
            <div class="progress-bar">
                <div class="progress-bar-fill"></div>
            </div>
        </div>
        <%
            session.removeAttribute("Msg");
          } else if (request.getParameter("success") != null && request.getParameter("success").equals("logout")) {
        %>
        <div class="message success">
            <span class="close-btn" onclick="this.parentElement.style.display = 'none'">&times;</span>
            <p class="message-text">You have been successfully logged out.</p>
            <div class="progress-bar">
                <div class="progress-bar-fill"></div>
            </div>
        </div>
        <%
          }
        %>
    </body>

</html>
