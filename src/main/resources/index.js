let banner = document.querySelector("#banner");
window.addEventListener("load", renderLogin);

//JWT
const localstorage_user = JSON.parse(localStorage.getItem('user'));
const inMemoryToken = localstorage_user.access_token;




function derenderPage(){
    document.querySelector("body").innerHTML = "";
}

// Login Page

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
        submitButton.style.backgroundColor = "gray";
        submitButton.style.borderColor = "gray";
        submitButton.addEventListener("mouseenter", function(){submitButton.style.color = "silver";});
        submitButton.addEventListener("mouseleave", function(){submitButton.style.color = "black";});
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
    
            let registerLabel = document.createElement("p");
            registerLabel.innerText = "Please register";
            rec.appendChild(registerLabel);
            registerLabel.style.color = "cyan";
        
            let usernameLabel = document.createElement("p");
            usernameLabel.innerText = "Username";
            rec.appendChild(usernameLabel);
            usernameLabel.style.color = "cyan";
        
            let usernameInput = document.createElement("input");
            usernameInput.id = "createUsername";
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
            passwordInput.id = "createPassword";
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
            submitButton.style.backgroundColor = "gray";
            submitButton.style.borderColor = "gray";
            submitButton.addEventListener("mouseenter", function(){submitButton.style.color = "silver";});
            submitButton.addEventListener("mouseleave", function(){submitButton.style.color = "black";});
            submitButton.addEventListener("click", asyncCreate);
        
            rec.appendChild(submitButton);
            
            document.querySelector("body").appendChild(createContainer);
            document.getElementById("create").style.fontFamily = "Arial";
            document.getElementById("create").style.width = "200px"
            document.getElementById("create").style.marginLeft = "auto";
            document.getElementById("create").style.marginRight = "auto";
            document.getElementById("create").style.textAlign = "center";
    }

    function renderHomePage(user, library, playlistName, songs, userLists){

        derenderPage()
        console.log(playlistName);
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
    
        let leftBB = document.createElement("div");
        leftBB.style.backgroundColor = "black";
        leftBB.style.width = "120px";
        leftBB.style.marginLeft = "auto";
        leftBB.style.marginRight = "auto";
        leftBB.style.borderRadius = "15px";
        leftBB.appendChild(document.createElement("br"));
    
        let rightBB = document.createElement("div");
        rightBB.style.backgroundColor = "black";
        rightBB.style.width = "70%";
        rightBB.style.marginLeft = "auto";
        rightBB.style.marginRight = "auto";
        rightBB.style.textAlign = "left";
        rightBB.style.borderRadius = "15px";
        
        let player = document.createElement("div");
        
    
        let storeButton = document.createElement("input");
        storeButton.type = "button";
        storeButton.value = "Store";
        storeButton.style.color = "cyan";
        storeButton.style.backgroundColor = "black";
        storeButton.style.textDecoration = "underline";
        storeButton.addEventListener("mouseenter", function(){storeButton.style.color = "silver";});
        storeButton.addEventListener("mouseleave", function(){storeButton.style.color = "cyan";});
        storeButton.addEventListener("click", function(){renderStore(user, library, "null");});
        leftBB.appendChild(storeButton);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));
    
        
        
        for(let i = 0; i < userLists.length; i++){
            let temp = document.createElement("input");
            temp.type = "button";
            temp.value = `${userLists[i]}`;
            if (temp.value == `${playlistName}`){
                temp.style.color = "gray";
            } else {
            temp.style.color = "cyan";
            }
            temp.style.backgroundColor = "black";
            temp.style.textTransform = "capitalize";
            temp.style.textDecoration = "underline";
            temp.addEventListener("mouseenter", function(){temp.style.color = "silver";});
            temp.addEventListener("mouseleave", function(){if (temp.value == `${playlistName}`){
                temp.style.color = "gray";
            } else {
            temp.style.color = "cyan";
            }});
            temp.addEventListener("click", function(){asyncLoadPlaylist(user, library, `${temp.value}`, userLists, "false");});
            
            
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
        createPlaylist.addEventListener("mouseenter", function(){createPlaylist.style.color = "silver";});
        createPlaylist.addEventListener("mouseleave", function(){createPlaylist.style.color = "cyan";});
        
        createPlaylist.addEventListener("click", function(){asyncLoadPlaylist(user, library, library.name, userLists, "true")});
        leftBB.appendChild(createPlaylist);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));
    
        let currentPlaylist = document.createElement("h1");
        currentPlaylist.innerText = `${playlistName}`;
        currentPlaylist.style.textTransform = "capitalize";
        currentPlaylist.style.color = "cyan";
        currentPlaylist.style.marginLeft = "10px";
        rightBB.appendChild(currentPlaylist);
        
    
        
    
    
        for(let i = 0; i < songs.length; i++){
            let temp = document.createElement("input");
            temp.type = "button";
            temp.value = `${songs[i].strTrack}`;
            temp.style.color = "cyan";
            temp.style.backgroundColor = "black";
            temp.style.textTransform = "capitalize";
            temp.style.textDecoration = "underline";
            temp.addEventListener("mouseenter", function(){temp.style.color = "silver";});
            temp.addEventListener("mouseleave", function(){temp.style.color = "cyan";});
            temp.addEventListener("click", function(){loadSong(`${songss[i]}`);});
            temp.style.marginLeft = "10px";        
                
            rightBB.appendChild(temp);
            rightBB.appendChild(document.createElement("br"));
            rightBB.appendChild(document.createElement("br"));
        }
        
    
    
        let userinfoButton = document.createElement("input");
        userinfoButton.type = "button";
        userinfoButton.value = `${user.username}`;
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
        userinfoButton.addEventListener("mouseenter", function(){userinfoButton.style.color = "silver";});
        userinfoButton.addEventListener("mouseleave", function(){userinfoButton.style.color = "white";});
        userinfoButton.onclick = function(){loadUserInfo(user);} 
        
    
        
       
        rightGrid.appendChild(userinfoButton);
        rightGrid.appendChild(rightBB);
        leftGrid.appendChild(leftBB);
        gridContainer.appendChild(leftGrid);
        
        gridContainer.appendChild(rightGrid);
        
    
       
    
        document.querySelector("body").appendChild(gridContainer);
    } 

    function createNewPlaylist(user, library, songs){
        derenderPage();
        
        let homePage = document.createElement("input");
        homePage.type = "button";
        homePage.value = "Return to HomePage";
        homePage.style.width = "150px";
        homePage.style.marginLeft = "20px";
        homePage.style.backgroundColor = "black";
        homePage.style.color = "cyan";
        homePage.style.borderRadius = "15px";
        homePage.style.borderColor = "gray";
        homePage.addEventListener("mouseenter", function(){homePage.style.color = "silver";});
        homePage.addEventListener("mouseleave", function(){homePage.style.color = "cyan";});
        homePage.addEventListener("click", function(){asyncLoadPlaylists(user, library.name);});
    
        let blackB = document.createElement("div");
        blackB.style.width = "80%";
        blackB.style.backgroundColor = "black";
        blackB.style.borderRadius = "15px";
        blackB.style.marginLeft = "auto";
        blackB.style.marginRight = "auto";
        blackB.style.textIndent = "20px";
    
        blackB.appendChild(document.createElement("br"));
    
        let nameLabel = document.createElement("p");
        nameLabel.innerText = "Playlist Name:";
        nameLabel.style.color = "cyan";
        blackB.appendChild(nameLabel);
    
        let nameInput = document.createElement("input");
        nameInput.id = "name";
        nameInput.type = "text";
        nameInput.placeholder = "Playlist name";
        nameInput.style.backgroundColor = "silver";
        nameInput.style.marginLeft = "20px";
        blackB.appendChild(nameInput);
        blackB.appendChild(document.createElement("br"));
    
        let selectL = document.createElement("p");
        selectL.innerText = "Select the songs you want to add!";
        selectL.style.color = "cyan";
        blackB.appendChild(selectL);
    
        let playlistSongs = [];
        for(let i = 0; i < songs.length; i++){
            let temp = document.createElement("input");
            let buttonValue = songs[i];
            temp.type = "button";
            temp.value = `${songs[i].strTrack}`;
            temp.style.color = "cyan";
            temp.style.backgroundColor = "black";
            temp.style.textTransform = "capitalize";
            temp.style.textDecoration = "underline";
            temp.addEventListener("click", function(){
                if(playlistSongs.includes(buttonValue)){
                temp.style.color = "cyan";
                playlistSongs.splice(playlistSongs.indexOf(buttonValue), 1);
                } else {
                temp.style.color = "gray";
                playlistSongs.push(buttonValue);
                }
    
                
            })
            temp.style.marginLeft = "10px";
            blackB.appendChild(temp);       
            blackB.appendChild(document.createElement("br"));
            blackB.appendChild(document.createElement("br"));
        }       
    
        let createButton = document.createElement("input");
        createButton.type = "button";
        createButton.value = "Create!";
        createButton.style.color = "cyan";
        createButton.style.backgroundColor = "black";
        createButton.style.borderColor = "gray";
        createButton.style.borderRadius = "15px";
        createButton.style.marginLeft = "20px";
        createButton.addEventListener("click", function(){
            asyncCreateNewPlaylist(nameInput.value, playlistSongs, user);
        });
        
    
        blackB.appendChild(createButton);
    
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
    
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(homePage);
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(blackB);
    
    }

    function renderStore(user, library, searchResults){
        derenderPage();
        
        let container = document.createElement("div");
    
        let homePage = document.createElement("input");
        homePage.type = "button";
        homePage.value = "Return to HomePage";
        homePage.style.width = "150px";
        homePage.style.marginLeft = "20px";
        homePage.style.backgroundColor = "black";
        homePage.style.color = "cyan";
        homePage.style.borderRadius = "15px";
        homePage.style.borderColor = "gray";
        homePage.addEventListener("mouseenter", function(){homePage.style.color = "silver";});
        homePage.addEventListener("mouseleave", function(){homePage.style.color = "cyan";});
        homePage.addEventListener("click", function(){asyncLoadPlaylists(user, library.name);});
        
        let searchBar = document.createElement("input");
        searchBar.type = "text";
        searchBar.placeholder = "Search by Artist name!";
        searchBar.style.width = "70%";
        searchBar.style.borderRadius = "15px";
        searchBar.style.backgroundColor = "	#404040";
        searchBar.style.borderColor = "gray";
        searchBar.style.textAlign = "center";
        searchBar.style.color = "white";
    
        let searchButton = document.createElement("input");
        searchButton.type = "button";
        searchButton.value = "Search!"
        searchButton.style.borderRadius = "15px";
        searchButton.style.backgroundColor = "gray";
        searchButton.style.borderColor = "gray";
        searchButton.style.textAlign = "center";
        searchButton.style.marginLeft = "10px";
        searchButton.style.color = "black";
        searchButton.addEventListener("click", async function(){
            if(typeof searchBar.value != 'undefined') {   
                asyncSearchByArtist(user, searchBar.value, library);
            }
        })
    
        let blackB = document.createElement("div");
        blackB.style.backgroundColor = "black";
        blackB.style.width = "75%";
        blackB.style.borderRadius = "15px";
        blackB.style.textAlign = "center";
        blackB.style.marginLeft = "auto";
        blackB.style.marginRight = "auto";
    
    
    
        container.appendChild(document.createElement("br"));
        container.appendChild(document.createElement("br"));
        container.appendChild(searchBar);
        container.appendChild(searchButton);
        container.appendChild(document.createElement("br"));
        container.appendChild(document.createElement("br"));
    
        let newSongs = []
        if(searchResults != "null") {
            
            for(let i = 0; i < searchResults.length; i++){
                let temp = document.createElement("input");
                let buttonValue = searchResults[i];
                temp.type = "button";
                temp.value = `${searchResults[i].strTrack}`;
                temp.style.color = "cyan";
                temp.style.backgroundColor = "black";
                temp.style.textTransform = "capitalize";
                temp.style.textDecoration = "underline";
                temp.addEventListener("mouseenter", function(){temp.style.color = "silver";});
                temp.addEventListener("mouseleave", function(){
                    if (newSongs.includes(buttonValue)){
                    temp.style.color = "gray";
                } else {
                    temp.style.color = "cyan";
                } });
                temp.addEventListener("click", function(){
                    
                    if(newSongs.includes(buttonValue)){
                        temp.style.color = "cyan";
                        newSongs.splice(newSongs.indexOf(buttonValue), 1);
                    } else {
                        
                        temp.style.color = "gray";
                        newSongs.push(buttonValue);
                    }
                    
                });
                temp.style.marginLeft = "10px";        
                    
                blackB.appendChild(document.createElement("br"));
                blackB.appendChild(temp);
                
            }
        }
    
        let addSongs = document.createElement("input");
    addSongs.type = "button";
    addSongs.value = "Add selected to Library!"
    addSongs.style.borderRadius = "15px";
    addSongs.style.backgroundColor = "gray";
    addSongs.style.borderColor = "gray";
    addSongs.style.textAlign = "center";
    addSongs.style.color = "black";
    console.log(newSongs);
    addSongs.addEventListener("click", function(){
        for (let i = 0; i < newSongs.length; i++){
        asyncPutSongInPlaylist(library.id, newSongs[i]);
        };
    });
    
    if(searchResults != 'null'){
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(addSongs);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
    }
     

    container.appendChild(blackB);
    container.style.textAlign = "center";
    container.style.fontFamily = "Arial";
    
    document.querySelector("body").appendChild(document.createElement("br"));
    document.querySelector("body").appendChild(document.createElement("br"));
    document.querySelector("body").appendChild(homePage);
    document.querySelector("body").appendChild(container);

    }

    function loadUserInfo(user){
        derenderPage();
        let homePage = document.createElement("input");
        homePage.type = "button";
        homePage.value = "Return to HomePage";
        homePage.style.width = "150px";
        homePage.style.marginLeft = "20px";
        homePage.style.backgroundColor = "black";
        homePage.style.color = "cyan";
        homePage.style.borderRadius = "15px";
        homePage.style.borderColor = "gray";
        homePage.addEventListener("mouseenter", function(){homePage.style.color = "silver";});
        homePage.addEventListener("mouseleave", function(){homePage.style.color = "cyan";});
        homePage.addEventListener("click", function(){asyncLoadPlaylists(user, `${user.username}'s  Library`);});
    
        let blackB = document.createElement("div");
        blackB.style.width = "80%";
        blackB.style.backgroundColor = "black";
        blackB.style.borderRadius = "15px";
        blackB.style.marginLeft = "auto";
        blackB.style.marginRight = "auto";
    
        let userID = document.createElement("p");
        userID.innerText = `UserID: ${user.id}`;
        userID.style.color = "cyan";
        userID.style.marginLeft = "20px";
    
        let userName = document.createElement("p");
        userName.innerText = `Username: ${user.username}`;
        userName.style.color = "cyan";
        userName.style.marginLeft = "20px";
    
        let userPass = document.createElement("p");
        userPass.innerText = `Password: ${user.password}`;
        userPass.style.color = "cyan";
        userPass.style.marginLeft = "20px";
    
        
    
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(userID);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(userName);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(userPass);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(homePage);
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(blackB);
    }

    async function asyncLogin() {
        let userInput = document.querySelector("#username").value;
        let passInput = document.querySelector("#password").value;
        console.log(userInput)
        const url = "http://localhost:8080/auth/login";
        
    
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
            
            let user = await response.json();
    
            localStorage.setItem('user', JSON.stringify(user));
            const localstorage_user = JSON.parse(localStorage.getItem('user'));
            const inMemoryToken = localstorage_user.access_token;
    
            asyncLoadPlaylists(user, `${user.username}'s  Library`);
            
        }catch(error){
            console.error(`Error is ${error}`);
        }
    }

    async function asyncCreate() {
        let userInput = document.querySelector("#createUsername").value;
        let passInput = document.querySelector("#createPassword").value;
    
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
    
            let user = await response.json();
            
        }catch(error){
            console.error(`Error is ${error}`);
        }
    }

    async function asyncLoadPlaylists(user, library){

        const url = `http://localhost:8080/users/user/${user.id}/lists`;

    try{
        let response = await fetch(url, { headers: {"Authorization": `Bearer ${inMemoryToken}`} }) 
        console.log(response);
        console.log(library);
        
        let userLists = await response.json();
        let creating = "false";
        asyncLoadLibrary(user, library, userLists, creating);
    }catch(error){
        console.log(`error is ${error}`);
    }
    }

    async function asyncLoadLibrary(user, libraryName, userLists, creating){
        const url = `http://localhost:8080/lists/list?name=${libraryName}`;
        try{
            let response = await fetch(url, { headers: {"Authorization": "Bearer " + inMemoryToken, 'Content-Type': 'application/json'} });
            let library = await response.json();
            asyncLoadPlaylist(user, library, libraryName, userLists, creating)
        } catch (error){ 
            console.log(`Error is ${error}`);
        }
        
    }


    async function asyncLoadPlaylist(user, library, playlistName, userLists, creating){

        const url = `http://localhost:8080/lists/list?name=${playlistName}`;

        try{
            let response = await fetch(url, { headers: {"Authorization": "Bearer " + inMemoryToken, 'Content-Type': 'application/json'} });
            let playlist = await response.json();
            let songs = playlist.songs;
            
            if (creating == "false") {
            renderHomePage(user, library, playlistName, songs, userLists);
            } else {
                createNewPlaylist(user, library,  playlistName, songs, userLists);
            }
        } catch (error) {
            console.error(`Error is ${error}`);
        }
    }


    async function asyncCreateNewPlaylist(newName, newSongs, user) {
        const url = 'http://localhost:8080/lists/create';

    let listObj = {
        name: newName
    };

    try{
        let response = await fetch(
            url,
            {
                method: "POST",
                headers: new Headers({
					"Authorization": "Bearer " + inMemoryToken,
                    'content-type':'application/json'
                }),
                body: JSON.stringify(listObj)
            }
            
        )
        let playlistObj = await response.json();
        for (let i = 0; i < newSongs.length; i++){
            asyncPutSongInPlaylist(playlistObj.id, newSongs[i]);
        }
        asyncMapListtoUser(playlistObj.id, user.id);
    } catch(error) {
        console.error(`Error is ${error}`);
    }
}

async function asyncPutSongInPlaylist(playlistId, song) {
    
    const url = `http://localhost:8080/lists/${playlistId}/songs/${song.idTrack}`;
    
    try{
        let response = await fetch(
            url, 
            {
                method: "PUT",
                headers: new Headers({
					"Authorization": "Bearer " + inMemoryToken,
                    'content-type':'application/json'
                })
            }
        )
        let thing = await response.json();
        
    }catch(error)
    {console.log(`error is ${error}`);} 
}

async function asyncMapListtoUser(listID, userID) {

    const url = `http://localhost:8080/lists/${listID}/users/${userID}`;

    try{
        let response = await fetch(
            url,  
            {
                method: "PUT",
                headers: new Headers({
					"Authorization": "Bearer " + inMemoryToken,
                    'content-type':'application/json'
                })
            }
        )
            let thing = await response.json();
            
        
    } catch(error)
    {console.log(`error is ${error}`);}
}


async function asyncPutSongInDatabaseANDLibrary(libraryID, song){
    console.log(song);
    const url = `http://localhost:8080/songs/song/id/${song.idTrack}`
    
    console.log("Added!");
    try{
    let response = await fetch(url, { headers: {"Authorization": "Bearer " + inMemoryToken, 'Content-Type': 'application/json'} });
    
    let newSong = await response.json();
    console.log(newSong);
    asyncPutSongInPlaylist(libraryID, newSong);
    }catch (error) {
        console.log(`Error is ${error}`);
    }

}

async function asyncSearchByArtist(user, artist, library){
    const url = `http://localhost:8080/songs/artist?name=${artist}`;
    console.log(url);
    try{
        let result = await fetch(url, { headers: {"Authorization": "Bearer " + inMemoryToken, 'Content-Type': 'application/json'} })
        let songs = await result.json();
        console.log(songs)
        renderStore(user, library, songs);
    } catch(error){
        console.log(`Error is ${error}`);
    }
    
}
