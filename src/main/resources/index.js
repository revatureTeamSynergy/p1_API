let banner = document.querySelector("#banner");

window.addEventListener("load", renderLogin)


function derenderPage(){
    document.querySelector("body").innerHTML = "";
}

function renderLogin(){

derenderPage()

document.body.style.width = "100%";
document.body.style.minHeight = "1000px";
document.body.style.margin = "0";
document.body.style.background = "linear-gradient(0deg, rgba(2,0,36,1) 0%, rgba(31,126,131,1) 100%)";

    //loginContainer Creation
    let loginContainer = document.createElement("div");
    loginContainer.id = "login";
    
    //Black box creation
    let rec = document.createElement("div");
    rec.style.backgroundColor = "black";
    rec.style.width = "200px";
    rec.style.height = "340px";
    loginContainer.appendChild(document.createElement("br"));
    loginContainer.appendChild(document.createElement("br"));
    loginContainer.appendChild(rec);

    rec.appendChild(document.createElement("br"));

    //Top Buttons
    
    let loginButton = document.createElement("input");
    loginButton.type = "button";
    loginButton.value = "Login";
    loginButton.style.color = "cyan";
    loginButton.style.backgroundColor = "black";
    loginButton.style.borderBottomColor = "silver";
    rec.appendChild(loginButton);

    let regButton = document.createElement("input");
    regButton.type = "button";
    regButton.value = "Register";
    regButton.style.color = "cyan";
    regButton.style.backgroundColor = "black";
    regButton.style.borderBottomColor = "cyan";
    regButton.style.marginLeft = "20px";
    regButton.addEventListener("click", renderCreate);
    rec.appendChild(regButton);

    //Fields


    let usernameLabel = document.createElement("p");
    usernameLabel.innerText = "Username";
    rec.appendChild(usernameLabel);
    usernameLabel.style.color = "cyan";

    let usernameInput = document.createElement("input");
    usernameInput.id = "username";
    usernameInput.type = "text";
    usernameInput.placeholder = "username";
    usernameInput.style.backgroundColor = "silver";
    rec.appendChild(usernameInput);
    rec.appendChild(document.createElement("br"));

    
    let passwordLabel = document.createElement("p");
    passwordLabel.innerText = "Password";
    passwordLabel.style.color = "cyan";
    rec.appendChild(passwordLabel);

    let passwordInput = document.createElement("input");
    passwordInput.type = "password";
    passwordInput.id = "password";
    passwordInput.style.backgroundColor = "silver";
    rec.appendChild(passwordInput);
    rec.appendChild(document.createElement("br"));
    rec.appendChild(document.createElement("br"));
    rec.appendChild(document.createElement("br"));

    let submitButton = document.createElement("input");
    submitButton.type = "button";
    submitButton.value = "Login";
    submitButton.style.width = "80px";
    submitButton.style.borderRadius = "7px";
    submitButton.addEventListener("click", asyncLogin);

    rec.appendChild(submitButton);
    
    document.querySelector("body").appendChild(loginContainer);
    //Login Container Styling
    document.getElementById("login").style.fontFamily = "Arial";
    document.getElementById("login").style.width = "200px"
    document.getElementById("login").style.marginLeft = "auto";
    document.getElementById("login").style.marginRight = "auto";
    document.getElementById("login").style.textAlign = "center";
}

async function asyncLogin() {
    let userInput = document.querySelector("#username").value;
    let passInput = document.querySelector("#password").value;

    const url = "http://localhost:8080/login";

    let loginObj = {
        username: userInput,
        password: passInput
    };

    try{
        let response = await fetch(
            url,
            {
                method: "POST",
                headers: new Headers({
                    'content-type':'application/json'
                }),
                body: JSON.stringify(loginObj)}
        )
        let data = await response.json();
        renderHomePage(data);
        
    }catch(error){
        console.error(`Error is ${error}`);
    }
}

function renderCreate(){
    derenderPage()
    document.body.style.width = "100%";
    document.body.style.minHeight = "1000px";
    document.body.style.margin = "0";
    document.body.style.background = "linear-gradient(0deg, rgba(2,0,36,1) 0%, rgba(31,126,131,1) 100%)";
    
        //createContainer Creation
        let createContainer = document.createElement("div");
        createContainer.id = "create";
        
        //Black box creation
        let rec = document.createElement("div");
        rec.style.backgroundColor = "black";
        rec.style.width = "200px";
        rec.style.height = "400px";
        createContainer.appendChild(document.createElement("br"));
        createContainer.appendChild(document.createElement("br"));
        createContainer.appendChild(rec);
    
        rec.appendChild(document.createElement("br"));
    
        //Top Buttons
        
        let loginButton = document.createElement("input");
        loginButton.type = "button";
        loginButton.value = "Login";
        loginButton.style.color = "cyan";
        loginButton.style.backgroundColor = "black";
        loginButton.style.borderBottomColor = "cyan";
        loginButton.addEventListener("click", renderLogin);
        rec.appendChild(loginButton);
    
        let regButton = document.createElement("input");
        regButton.type = "button";
        regButton.value = "Register";
        regButton.style.color = "cyan";
        regButton.style.backgroundColor = "black";
        regButton.style.borderBottomColor = "silver";
        regButton.style.marginLeft = "20px";
        rec.appendChild(regButton);
    
        //Fields
    
        let emailLabel = document.createElement("p");
        emailLabel.innerText = "Email";
        rec.appendChild(emailLabel);
        emailLabel.style.color = "cyan";

        let emailInput = document.createElement("input");
        emailInput.id = "email";
        emailInput.type = "text";
        emailInput.placeholder = "email";
        emailInput.style.backgroundColor = "silver";
        rec.appendChild(emailInput);
        rec.appendChild(document.createElement("br"));
    
        let usernameLabel = document.createElement("p");
        usernameLabel.innerText = "Username";
        rec.appendChild(usernameLabel);
        usernameLabel.style.color = "cyan";
    
        let usernameInput = document.createElement("input");
        usernameInput.id = "username";
        usernameInput.type = "text";
        usernameInput.placeholder = "username";
        usernameInput.style.backgroundColor = "silver";
        rec.appendChild(usernameInput);
        rec.appendChild(document.createElement("br"));
    
        
        let passwordLabel = document.createElement("p");
        passwordLabel.innerText = "Password";
        passwordLabel.style.color = "cyan";
        rec.appendChild(passwordLabel);
    
        let passwordInput = document.createElement("input");
        passwordInput.type = "password";
        passwordInput.id = "password";
        passwordInput.style.backgroundColor = "silver";
        rec.appendChild(passwordInput);
        rec.appendChild(document.createElement("br"));
        rec.appendChild(document.createElement("br"));
        rec.appendChild(document.createElement("br"));
    
        let submitButton = document.createElement("input");
        submitButton.type = "button";
        submitButton.value = "Login";
        submitButton.style.width = "80px";
        submitButton.style.borderRadius = "7px";
        submitButton.addEventListener("click", asyncCreate);
    
        rec.appendChild(submitButton);
        
        document.querySelector("body").appendChild(createContainer);
        //Login Container Styling
        document.getElementById("create").style.fontFamily = "Arial";
        document.getElementById("create").style.width = "200px"
        document.getElementById("create").style.marginLeft = "auto";
        document.getElementById("create").style.marginRight = "auto";
        document.getElementById("create").style.textAlign = "center";
}

async function asyncCreate() {
    let emailInput = document.querySelector("#email").value;
    let userInput = document.querySelector("#username").value;
    let passInput = document.querySelector("#password").value;

    const url = `localhost:8080/login`;

    let createObj = {
        email: emailInput,
        username: userInput,
        password: passInput
    };

    try{
        let response = await fetch(
            url,
            {
                method: "POST",
                headers: new Headers({
                    'content-type':'application/json'
                }),
                body: JSON.stringify(createObj)}
        )

        let data = await response.json();
        
    }catch(error){
        console.error(`Error is ${error}`);
    }
}


function renderHomePage(data){
    derenderPage()
    document.body.style.width = "100%";
    document.body.style.minHeight = "1000px";
    document.body.style.margin = "0";

    let gridContainer = document.createElement("div");
    gridContainer.style.display = "grid";
    gridContainer.style.gridTemplateColumns = "100px auto";
    gridContainer.style.backgroundColor = "blue";
    

    let hello = document.createElement("div");
    hello.style.gridColumnStart = "2";
    hello.style.gridColumnEnd = "2";
    hello.style.backgroundColor = "purple";
    hello.style.textAlign = "right";
    hello.appendChild(document.createElement("br"));

    let userinfoButton = document.createElement("input");
    userinfoButton.type = "button";
    userinfoButton.value = `${data.username}`;
    userinfoButton.style.width = "80px";
    userinfoButton.style.textAlign = "center";
    userinfoButton.style.backgroundColor = "purple";
    userinfoButton.style.borderColor = "purple";
    userinfoButton.style.borderBottomColor = "black";
    userinfoButton.style.marginRight = "100px";
    userinfoButton.addEventListener("click", loadUserInfo(data));
    

    hello.appendChild(userinfoButton);

    gridContainer.appendChild(hello);
    

   

    document.querySelector("body").appendChild(gridContainer);
}

function loadUserInfo(data){
    derenderPage()
    console.log(`${data.id} ${data.username} ${data.password}`)
}