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

    submitButton = document.createElement("input");
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
        loadPlaylists(data, "list1");
        
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
    
        // let emailLabel = document.createElement("p");
        // emailLabel.innerText = "Email";
        // rec.appendChild(emailLabel);
        // emailLabel.style.color = "cyan";

        // let emailInput = document.createElement("input");
        // emailInput.id = "email";
        // emailInput.type = "text";
        // emailInput.placeholder = "email";
        // emailInput.style.backgroundColor = "silver";
        // rec.appendChild(emailInput);
        // rec.appendChild(document.createElement("br"));

        let registerLabel = document.createElement("p");
        registerLabel.innerText = "Please register";
        rec.appendChild(registerLabel);
        registerLabel.style.color = "cyan";
    
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
        submitButton.value = "Register";
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
    let userInput = document.querySelector("#username").value;
    let passInput = document.querySelector("#password").value;

    const url = `http://localhost:8080/users/create`;

    let createObj = {
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


function renderHomePage(data, lists, playlist, songs){
    derenderPage()

    document.body.style.width = "100%";
    document.body.style.minHeight = "1000px";
    document.body.style.margin = "0";

    let gridContainer = document.createElement("div");
    gridContainer.style.display = "grid";
    gridContainer.style.gridTemplateColumns = "150px auto";
    gridContainer.style.backgroundColor = "";
    gridContainer.style.fontFamily = "Arial";
    gridContainer.appendChild(document.createElement("br"));
    gridContainer.appendChild(document.createElement("br"));

    let rightGrid = document.createElement("div");
    rightGrid.style.gridColumnStart = "2";
    rightGrid.style.gridColumnEnd = "2";
    rightGrid.style.textAlign = "right";
    

    let leftGrid = document.createElement("div");
    leftGrid.style.gridColumnStart = "1";
    leftGrid.style.gridColumnEnd = "1";
    leftGrid.style.textAlign = "center";
    //leftGrid.style.border = "red solid 1px";

    let leftBB = document.createElement("div");
    leftBB.style.backgroundColor = "black";
    leftBB.style.width = "100px";
    leftBB.style.marginLeft = "auto";
    leftBB.style.marginRight = "auto";
    leftBB.style.borderRadius = "15px";
    //leftBB.style.border = "red solid 1px";
    leftBB.appendChild(document.createElement("br"));

    let rightBB = document.createElement("div");
    rightBB.style.backgroundColor = "black";
    rightBB.style.width = "70%";
    rightBB.style.marginLeft = "auto";
    rightBB.style.marginRight = "auto";
    //rightBB.style.border = "red solid 1px";
    rightBB.style.textAlign = "left";
    rightBB.style.borderRadius = "15px";
    

    let storeButton = document.createElement("input");
    storeButton.type = "button";
    storeButton.value = "Store";
    storeButton.style.color = "cyan";
    storeButton.style.backgroundColor = "black";
    storeButton.style.textDecoration = "underline";
    storeButton.addEventListener("click", renderStore);
    leftBB.appendChild(storeButton);
    leftBB.appendChild(document.createElement("br"));
    leftBB.appendChild(document.createElement("br"));

    /*
    let libraryButton = document.createElement("input");
    libraryButton.type = "button";
    libraryButton.value = "Library";
    libraryButton.style.color = "cyan";
    libraryButton.style.backgroundColor = "black";
    libraryButton.style.textDecoration = "underline";
    libraryButton.addEventListener("click", function(){loadPlaylists(data,"Library");});
    leftBB.appendChild(libraryButton);
    leftBB.appendChild(document.createElement("br"));
    leftBB.appendChild(document.createElement("br"));
    */

    let playlists = lists;
    for(let i = 0; i < playlists.length; i++){
        temp = document.createElement("input");
        temp.type = "button";
        temp.value = `${playlists[i]}`;
        temp.style.color = "cyan";
        temp.style.backgroundColor = "black";
        temp.style.textTransform = "capitalize";
        temp.style.textDecoration = "underline";
        temp.addEventListener("click", function(){loadPlaylists(data, `${playlists[i]}`);});
        
        
        leftBB.appendChild(temp);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));
    }

    let createPlaylist = document.createElement("input");
    createPlaylist.type = "button";
    createPlaylist.value = "Create New\nPlaylist";
    createPlaylist.style.color = "cyan";
    createPlaylist.style.backgroundColor = "black";
    createPlaylist.style.textDecoration = "underline";
    createPlaylist.style.wordBreak = "break-all";
    createPlaylist.addEventListener("click", createNewPlaylist);
    leftBB.appendChild(createPlaylist);
    leftBB.appendChild(document.createElement("br"));
    leftBB.appendChild(document.createElement("br"));

    let currentPlaylist = document.createElement("h1");
    currentPlaylist.innerText = `${playlist}`;
    currentPlaylist.style.color = "cyan";
    currentPlaylist.style.marginLeft = "10px";
    rightBB.appendChild(currentPlaylist);
    

    console.log(songs);


    for(let i = 0; i < songs.length; i++){
        let temp = document.createElement("input");
        temp.type = "button";
        temp.value = `${songs[i]}`;
        temp.style.color = "cyan";
        temp.style.backgroundColor = "black";
        temp.style.textTransform = "capitalize";
        temp.style.textDecoration = "underline";
        temp.addEventListener("click", loadSong(`${songs[i]}`));
        temp.style.marginLeft = "10px";        
            
        rightBB.appendChild(temp);
        rightBB.appendChild(document.createElement("br"));
        rightBB.appendChild(document.createElement("br"));
    }
    


    let userinfoButton = document.createElement("input");
    userinfoButton.type = "button";
    userinfoButton.value = `${data.username}`;
    userinfoButton.style.textTransform = "capitalize";
    userinfoButton.style.width = "80px";
    userinfoButton.style.height = "30px";
    userinfoButton.style.textAlign = "center";
    userinfoButton.style.backgroundColor = "black";
    userinfoButton.style.color = "white";
    userinfoButton.style.textDecoration = "underline";
    userinfoButton.style.borderColor = "gray";
    userinfoButton.style.borderRadius = "15px";
    userinfoButton.style.marginRight = "100px";
    userinfoButton.onclick = function(){loadUserInfo(data);} 
    


    rightGrid.appendChild(userinfoButton);
    rightGrid.appendChild(rightBB);
    leftGrid.appendChild(leftBB);
    gridContainer.appendChild(leftGrid);
    
    gridContainer.appendChild(rightGrid);
    

   

    document.querySelector("body").appendChild(gridContainer);
}

async function loadPlaylists(data, playlist) {
    const url = `http://localhost:8080/users/user/${data.id}/lists`

    try{
        let response = await fetch(url);

        let lists = await response.json();
        loadPlaylist(data, lists, playlist)
    }catch(error){
        console.log(`error is ${error}`);
    }
}


async function loadPlaylist(data2, lists, playlist){
    
    const url = `http://localhost:8080/lists/list?name=${playlist}`;

    try{
        let response = await fetch(url);

        let data = await response.json();
        let songs = data.songs;
        let songNames = [];
        for(let i = 0; i < songs.length; i++){
            let song = songs[i].strTrack;
            songNames.push(song);
        }
        
        renderHomePage(data2, lists, playlist, songNames)
        
    } catch(error){
        renderHomePage(data2, playlist, [])
        console.error(`Error is ${error}`);
    }
   

    
}

function loadUserInfo(data){
    derenderPage();
    console.log(`${data.id} ${data.username} ${data.password}`);
}

function renderStore(){
    console.log("Need to make store page!");
}

function loadSong(song){
    console.log(song);
}

function createNewPlaylist(){
    console.log("need to implement this too :P")
}