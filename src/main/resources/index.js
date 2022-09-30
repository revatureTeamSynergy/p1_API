let banner = document.querySelector("#banner");

window.addEventListener("load", renderLogin);

//JWT
const localstorage_user = JSON.parse(localStorage.getItem('user'));
const inMemoryToken = localstorage_user.access_token;

let sorting = "a";


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
        
    
        let rightGrid = document.createElement("div");
        
        rightGrid.style.gridColumnStart = "2";
        rightGrid.style.gridColumnEnd = "2";
        rightGrid.style.textAlign = "right";
        
    
        let leftGrid = document.createElement("div");
        leftGrid.style.gridColumnStart = "1";
        leftGrid.style.gridColumnEnd = "1";
        leftGrid.style.textAlign = "center";
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
    
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
        
    
        let storeButton = document.createElement("input");
        storeButton.type = "button";
        storeButton.value = "Search";
        storeButton.style.color = "cyan";
        storeButton.style.backgroundColor = "black";
        storeButton.style.textDecoration = "underline";
        storeButton.addEventListener("mouseenter", function(){storeButton.style.color = "silver";});
        storeButton.addEventListener("mouseleave", function(){storeButton.style.color = "cyan";});
        storeButton.addEventListener("click", function(){renderStore(user, library, "null", userLists);});
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

        


        let sortButton = document.createElement("input");
        sortButton.type = "button";
        if (sorting == "a"){
            sortButton.value = "Sort by Song";

        } else {
            sortButton.value = "Sort by Artist";

        }
        sortButton.style.color = "cyan";
        sortButton.style.backgroundColor = "black";
        sortButton.style.borderColor = "gray";
        sortButton.style.borderRadius = "15px";
        sortButton.style.marginLeft = "90%";
        sortButton.addEventListener("mouseenter", function(){sortButton.style.color = "silver";});
        sortButton.addEventListener("mouseleave", function(){sortButton.style.color = "cyan";});
        sortButton.addEventListener("click", function(){
        if (sorting == "a"){
            sorting = "b";
            songs = songs.sort((a, b) => a.strTrack.localeCompare(b.strTrack));
            renderHomePage(user, library, playlistName, songs, userLists)

        }else{
            sorting == "a"
            songs = songs.sort((a, b) => a.strTrack.localeCompare(b.strArtist));
            renderHomePage(user, library, playlistName, songs, userLists)
        }});
        rightBB.appendChild(sortButton);
        rightBB.appendChild(document.createElement("br"));
        rightBB.appendChild(document.createElement("br"));
        
        
        

        for(let i = 0; i < songs.length; i++){
            let tempInfo = document.createElement("p");
            
            
            if(songs[i].strMusicVid !== null & songs[i].strGenre !== null){
                tempInfo.innerHTML = `${songs[i].strGenre} - <a href="${songs[i].strMusicVid}" target="_blank">Music Video</a>`;
                
            } else if (songs[i].strMusicVid === null & songs[i].strGenre !== null){
                tempInfo.innerHTML = `${songs[i].strGenre}`;
            } else {
                tempInfo.innerHTML = `Database has no further information on this song!`;
            }
            
            tempInfo.style.color = "cyan";
            tempInfo.style.fontSize = "16px";
            tempInfo.style.marginLeft = "25px";
            
            let tempS = "hid";

            let tempImg = document.createElement("img");
            tempImg.src = `${songs[i].strAlbumThumb}`;
            tempImg.style.width = "60px";
            tempImg.style.height = "60px";

            let temp = document.createElement("input");
            temp.type = "button";
            
            temp.value = `${songs[i].strArtist} - ${songs[i].strTrack}`;
            temp.style.color = "cyan";
            temp.style.backgroundColor = "black";
            temp.style.textTransform = "capitalize";
            temp.style.textDecoration = "underline";
            temp.appendChild(tempImg);
            temp.addEventListener("mouseenter", function(){temp.style.color = "silver";});
            temp.addEventListener("mouseleave", function(){temp.style.color = "cyan";});
            temp.addEventListener("click", function(){if (tempS == "hid"){
            rightBB.replaceChild(tempInfo, tempbr);
            
            tempS = "shown";
            } else {
            rightBB.replaceChild(tempbr, tempInfo);
            tempS = "hid";
            } })
            temp.style.marginLeft = "10px"; 
            
            let tempbr = document.createElement("br");
            rightBB.appendChild(tempImg);   
            rightBB.appendChild(temp);
            rightBB.appendChild(tempbr);
            
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
        
        
        
       rightBB.appendChild(document.createElement('br'));
        rightGrid.appendChild(userinfoButton);
        rightGrid.appendChild(rightBB);
        leftGrid.appendChild(leftBB);
        gridContainer.appendChild(leftGrid);
        
        gridContainer.appendChild(rightGrid);
        
    
       
    
        document.querySelector("body").appendChild(gridContainer);
    } 

    function createNewPlaylist(user, library, songs, userLists){
        derenderPage();
        

        let gridContainer = document.createElement("div");
        gridContainer.style.display = "grid";
        gridContainer.style.gridTemplateColumns = "150px auto";
        gridContainer.style.backgroundColor = "";
        gridContainer.style.fontFamily = "Arial";


        let rightGrid = document.createElement("div");
        rightGrid.style.gridColumnStart = "2";
        rightGrid.style.gridColumnEnd = "2";
        rightGrid.style.textAlign = "left";

        
    
        let leftGrid = document.createElement("div");
        leftGrid.style.gridColumnStart = "1";
        leftGrid.style.gridColumnEnd = "1";
        leftGrid.style.textAlign = "center";
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));


        let leftBB = document.createElement("div");
        leftBB.style.backgroundColor = "black";
        leftBB.style.width = "120px";
        leftBB.style.marginLeft = "auto";
        leftBB.style.marginRight = "auto";
        leftBB.style.borderRadius = "15px";
        leftBB.appendChild(document.createElement("br"));

        let storeButton = document.createElement("input");
        storeButton.type = "button";
        storeButton.value = "Searcb";
        storeButton.style.color = "cyan";
        storeButton.style.backgroundColor = "black";
        storeButton.style.textDecoration = "underline";
        storeButton.addEventListener("mouseenter", function(){storeButton.style.color = "silver";});
        storeButton.addEventListener("mouseleave", function(){storeButton.style.color = "cyan";});
        storeButton.addEventListener("click", function(){renderStore(user, library, "null", userLists);});
        leftBB.appendChild(storeButton);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));
    
        
        
        for(let i = 0; i < userLists.length; i++){
            let temp = document.createElement("input");
            temp.type = "button";
            temp.value = `${userLists[i]}`;
           
            temp.style.color = "cyan";
            
            
            temp.style.backgroundColor = "black";
            temp.style.textTransform = "capitalize";
            temp.style.textDecoration = "underline";
            temp.addEventListener("mouseenter", function(){temp.style.color = "silver";});
            temp.addEventListener("mouseleave", function(){
            temp.style.color = "cyan";
            });
            temp.addEventListener("click", function(){asyncLoadPlaylist(user, library, `${temp.value}`, userLists, "false");});
            
            
            leftBB.appendChild(temp);
            leftBB.appendChild(document.createElement("br"));
            leftBB.appendChild(document.createElement("br"));
        }
    
        let createPlaylist = document.createElement("input");
        createPlaylist.type = "button";
        createPlaylist.value = "Create New\nPlaylist";
        createPlaylist.style.color = "gray";
        createPlaylist.style.backgroundColor = "black";
        createPlaylist.style.textDecoration = "underline";
        createPlaylist.style.wordBreak = "break-all";
        createPlaylist.addEventListener("mouseenter", function(){createPlaylist.style.color = "silver";});
        createPlaylist.addEventListener("mouseleave", function(){createPlaylist.style.color = "gray";});
        
        createPlaylist.addEventListener("click", function(){asyncLoadPlaylist(user, library, library.name, userLists, "true")});
        leftBB.appendChild(createPlaylist);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));

        leftGrid.appendChild(leftBB);


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
        blackB.appendChild(document.createElement("br"));

        let nameInput = document.createElement("input");
        nameInput.id = "name";
        nameInput.type = "text";
        nameInput.placeholder = "Playlist name";
        nameInput.style.backgroundColor = "silver";
        nameInput.style.marginLeft = "20px";
        blackB.appendChild(nameInput);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));

    
        let selectL = document.createElement("p");
        selectL.innerText = "Select the songs you want to add!";
        selectL.style.color = "cyan";
        blackB.appendChild(selectL);
    
        let playlistSongs = [];
        for(let i = 0; i < songs.length; i++){

            let tempImg = document.createElement("img");
            tempImg.src = `${songs[i].strAlbumThumb}`;
            tempImg.style.width = "60px";
            tempImg.style.height = "60px";

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
            blackB.appendChild(tempImg);
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
        createButton.addEventListener("click", async function(){
            await asyncCreateNewPlaylist(nameInput.value, playlistSongs, user, library, songs, userLists);
            delay(2000).then(() => asyncLoadPlaylists(user, library.name, "creating"));
        });
        
    
        blackB.appendChild(createButton);
    
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
    
        rightGrid.appendChild(blackB);
        gridContainer.appendChild(leftGrid);
        gridContainer.appendChild(rightGrid);
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(document.createElement("br"));

        document.querySelector("body").appendChild(gridContainer);
        document.querySelector("body").appendChild(document.createElement("br"));
        //document.querySelector("body").appendChild(homePage);
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(document.createElement("br"));
        
    
    }

    function renderStore(user, library, searchResults, userLists){
        derenderPage();
        

        let gridContainer = document.createElement("div");
        gridContainer.style.display = "grid";
        gridContainer.style.gridTemplateColumns = "150px auto";
        gridContainer.style.backgroundColor = "";
        gridContainer.style.fontFamily = "Arial";


        let rightGrid = document.createElement("div");
        rightGrid.style.gridColumnStart = "2";
        rightGrid.style.gridColumnEnd = "2";
        rightGrid.style.textAlign = "center";
        
    
        let leftGrid = document.createElement("div");
        leftGrid.style.gridColumnStart = "1";
        leftGrid.style.gridColumnEnd = "1";
        leftGrid.style.textAlign = "center";
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));


        let leftBB = document.createElement("div");
        leftBB.style.backgroundColor = "black";
        leftBB.style.width = "120px";
        leftBB.style.marginLeft = "auto";
        leftBB.style.marginRight = "auto";
        leftBB.style.borderRadius = "15px";
        leftBB.appendChild(document.createElement("br"));

        let storeButton = document.createElement("input");
        storeButton.type = "button";
        storeButton.value = "Search";
        storeButton.style.color = "gray";
        storeButton.style.backgroundColor = "black";
        storeButton.style.textDecoration = "underline";
        storeButton.addEventListener("mouseenter", function(){storeButton.style.color = "silver";});
        storeButton.addEventListener("mouseleave", function(){storeButton.style.color = "gray";});
        storeButton.addEventListener("click", function(){renderStore(user, library, "null", userLists);});
        leftBB.appendChild(storeButton);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));
    
        
        
        for(let i = 0; i < userLists.length; i++){
            let temp = document.createElement("input");
            temp.type = "button";
            temp.value = `${userLists[i]}`;
           
            temp.style.color = "cyan";

            
            
            temp.style.backgroundColor = "black";
            temp.style.textTransform = "capitalize";
            temp.style.textDecoration = "underline";
            temp.addEventListener("mouseenter", function(){temp.style.color = "silver";});
            temp.addEventListener("mouseleave", function(){
            temp.style.color = "cyan";
            });
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

        leftGrid.appendChild(leftBB);

        let loadimg = document.createElement("img");
        loadimg.src = "Eclipse-1s-200px.gif";
        

        let loadDiv = document.createElement('div');
        
        loadDiv.style.position = "absolute";
        loadDiv.style.top = 0;
        
        loadDiv.style.marginTop = "10%";
        loadDiv.style.marginLeft = "35%";
        loadDiv.style.marginRight = "auto";
        loadDiv.style.zIndex = 3;
        loadDiv.style.width = "400px";
        loadDiv.style.height = "300px";
        loadDiv.style.opacity = "0.75";
        loadDiv.style.backgroundColor = "";
        loadDiv.style.textAlign = "center";
        loadDiv.style.display = "none";

        loadDiv.appendChild(loadimg);
        
        
        
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
                loadDiv.style.display = "block";
                asyncSearchByArtist(user, searchBar.value, library, userLists);
            }
        })


        let blackB = document.createElement("div");
        blackB.style.backgroundColor = "black";
        blackB.style.width = "75%";
        blackB.style.borderRadius = "15px";
        blackB.style.textAlign = "center";
        blackB.style.marginLeft = "auto";
        blackB.style.marginRight = "auto";
    
    
    
        rightGrid.appendChild(document.createElement("br"));
        rightGrid.appendChild(document.createElement("br"));
        rightGrid.appendChild(searchBar);
        rightGrid.appendChild(searchButton);
        rightGrid.appendChild(document.createElement("br"));
        rightGrid.appendChild(document.createElement("br"));
    
        let newSongs = []
        if(searchResults != "null") {
            loadDiv.style.display = "none";
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
        addSongs.addEventListener("click", async function(){
            
            for (let i = 0; i < newSongs.length; i++){
        
            await asyncPutSongInPlaylist(library.id, newSongs[i]);
            
         };
        });

         let noS = document.createElement("p");
         noS.innerText = "No songs found!";
         noS.style.color = "red";


    
        if(searchResults != 'null'){
            if(typeof searchResults.length != 'undefined'){
             blackB.appendChild(document.createElement("br"));
             blackB.appendChild(document.createElement("br"));
              blackB.appendChild(addSongs);
              blackB.appendChild(document.createElement("br"));
              blackB.appendChild(document.createElement("br"));
            } else {blackB.appendChild(noS);}
        }


    rightGrid.appendChild(blackB);
    gridContainer.style.textAlign = "center";
    gridContainer.style.fontFamily = "Arial";
    
    gridContainer.appendChild(leftGrid);
    gridContainer.append(rightGrid);
    document.querySelector("body").appendChild(document.createElement("br"));
    document.querySelector("body").appendChild(document.createElement("br"));
    document.querySelector("body").appendChild(gridContainer);
    rightGrid.appendChild(loadDiv);


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
        blackB.style.fontFamily = "Arial";
    
        let userID = document.createElement("p");
        userID.innerText = `UserID: ${user.id}`;
        userID.style.color = "cyan";
        userID.style.marginLeft = "20px";
    
        let userName = document.createElement("p");
        userName.innerText = `Username: ${user.username}`;
        userName.style.color = "cyan";
        userName.style.marginLeft = "20px";

        let pUpText = document.createElement("input");
        pUpText.type = "text";
        pUpText.style.width = "150px";
        pUpText.style.backgroundColor = "gray";
        pUpText.style.color = "black";
        //pUpText.style.borderRadius = "15px";
        pUpText.style.borderColor = "black";
        pUpText.style.display = "none";
        pUpText.style.marginLeft = "18px";

        let pUpDone = document.createElement("input");
        pUpDone.type = "button";
        pUpDone.value = "Update!";
        pUpDone.style.width = "80px";
        pUpDone.style.backgroundColor = "black";
        pUpDone.style.color = "cyan";
        //pUpDone.style.borderRadius = "15px";
        pUpDone.style.borderColor = "gray";
        pUpDone.style.display = "none";
        pUpDone.style.marginLeft = "55px";
        pUpDone.addEventListener("mouseenter", function(){pUpDone.style.color = "silver";});
        pUpDone.addEventListener("mouseleave", function(){pUpDone.style.color = "cyan";});
        pUpDone.addEventListener("click", function(){ asyncUpdatePassword(user, pUpText.value); });

        let deleteButton = document.createElement("input");
        deleteButton.type = "button";
        deleteButton.value = "Delete User";
        deleteButton.style.width = "80px";
        deleteButton.style.backgroundColor = "black";
        deleteButton.style.color = "cyan";
        //deleteButton.style.borderRadius = "15px";
        deleteButton.style.borderColor = "gray";
        deleteButton.style.marginLeft = "55px";
        deleteButton.addEventListener("mouseenter", function(){deleteButton.style.color = "silver";});
        deleteButton.addEventListener("mouseleave", function(){deleteButton.style.color = "cyan";});
        deleteButton.addEventListener("click", function(){ ruSure.style.display = "block"; });
        
        let ruSure = document.createElement("input");
        ruSure.type = "button";
        ruSure.value = "Are you sure?";
        ruSure.style.width = "150px";
        ruSure.style.backgroundColor = "black";
        ruSure.style.color = "red";
        //ruSure.style.borderRadius = "15px";
        ruSure.style.borderColor = "gray";
        ruSure.style.marginLeft = "20px";
        ruSure.style.display = "none";
        ruSure.addEventListener("mouseenter", function(){ruSure.style.color = "silver";});
        ruSure.addEventListener("mouseleave", function(){ruSure.style.color = "red";});
        ruSure.addEventListener("click", function(){asyncDeleteUser(user); renderLogin();});

        let pUpdate = document.createElement("input");
        pUpdate.type = "button";
        pUpdate.value = "Update Password";
        pUpdate.style.width = "150px";
        pUpdate.style.backgroundColor = "black";
        pUpdate.style.color = "cyan";
        //pUpdate.style.borderRadius = "15px";
        pUpdate.style.borderColor = "gray";
        pUpdate.style.marginLeft = "20px";
        pUpdate.addEventListener("mouseenter", function(){pUpdate.style.color = "silver";});
        pUpdate.addEventListener("mouseleave", function(){pUpdate.style.color = "cyan";});
        pUpdate.addEventListener("click", function(){pUpText.style.display = "block"; pUpDone.style.display = "block";});
    
        let logOut = document.createElement("input");
        logOut.type = "button";
        logOut.value = "Log Out";
        logOut.style.width = "80px";
        logOut.style.backgroundColor = "black";
        logOut.style.color = "cyan";
        //deleteButton.style.borderRadius = "15px";
        logOut.style.borderColor = "gray";
        logOut.style.marginLeft = "55px";
        logOut.addEventListener("mouseenter", function(){logOut.style.color = "silver";});
        logOut.addEventListener("mouseleave", function(){logOut.style.color = "cyan";});
        logOut.addEventListener("click", function(){ renderLogin(); });
        
    
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(userID);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(userName);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(pUpdate);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(pUpText);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));

        blackB.appendChild(pUpDone);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(deleteButton);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(ruSure);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(logOut);
        blackB.appendChild(document.createElement("br"));
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
            setTimeout(function(){


            }, 500); 
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

    async function asyncLoadPlaylists(user, libraryName, action){

        const url = `http://localhost:8080/users/user/${user.id}/lists`;

    try{
        let response = await fetch(url, { headers: {"Authorization": `Bearer ${inMemoryToken}`} }) 
        console.log(response);
        console.log(libraryName);
        
        let userLists = await response.json();
        
        let creating = "false";
        asyncLoadLibrary(user, libraryName, userLists, creating, action); 
    }catch(error){
        console.log(`error is ${error}`);
    }
    }

    async function asyncLoadLibrary(user, libraryName, userLists, creating, action){
        const url = `http://localhost:8080/lists/list?name=${libraryName}`;
        try{
            let response = await fetch(url, { headers: {"Authorization": "Bearer " + inMemoryToken, 'Content-Type': 'application/json'} });
            let library = await response.json();
            asyncLoadPlaylist(user, library, libraryName, userLists, creating, action)
        } catch (error){ 
            console.log(`Error is ${error}`);
        }
        
    }


    async function asyncLoadPlaylist(user, library, playlistName, userLists, creating, action){

        const url = `http://localhost:8080/lists/list?name=${playlistName}`;

        try{
            let response = await fetch(url, { headers: {"Authorization": "Bearer " + inMemoryToken, 'Content-Type': 'application/json'} });
            let playlist = await response.json();
            let songs = playlist.songs;
            
            songs = songs.sort((a, b) => a.strTrack.localeCompare(b.strTrack));
            console.log(songs);
            if (action == "creating"){
                createNewPlaylist(user, library, songs, userLists);
            }
            if (creating == "false") {
            renderHomePage(user, library, playlistName, songs, userLists);
            } else {
                createNewPlaylist(user, library, songs, userLists);
            }
        } catch (error) {
            console.error(`Error is ${error}`);
        }
    }


    async function asyncCreateNewPlaylist(newName, newSongs, user, library, songs, userLists) {
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
            await asyncPutSongInPlaylist(playlistObj.id, newSongs[i]);
        }
        asyncMapListtoUser(playlistObj.id, user.id);

    } catch(error) {
        console.error(`Error is ${error}`);
    }
}


async function asyncPutSongInPlaylist(playlistId, song) {
    console.log(song.strAlbumThumb);
    const url = `http://localhost:8080/lists/${playlistId}/songs/${song.idTrack}?strAlbumThumb=${song.strAlbumThumb}`;
    
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


async function asyncSearchByArtist(user, artist, library, userLists){
    const url = `http://localhost:8080/songs/artist?name=${artist}`;
    
    try{
        let result = await fetch(url, { headers: {"Authorization": "Bearer " + inMemoryToken, 'Content-Type': 'application/json'} })
        let songs = await result.json();
        console.log(songs)
        renderStore(user, library, songs, userLists);
    } catch(error){
        console.log(`Error is ${error}`);
    }
    
}

async function asyncUpdatePassword(user, newPass){
    const url = `http://localhost:8080/users/${user.id}?password=${newPass}`;
    console.log(newPass);
    // let newPasswordObj = {
    //     password: newPass
    // };

    try{
        let response = await fetch(
            url,  
            {
                method: "PUT",
                headers: new Headers({
					"Authorization": "Bearer " + inMemoryToken,
                    'content-type':'application/json'
                }),
                // body: JSON.stringify(newPasswordObj)
            }
        )
            

    } catch (error) {
        console.log(`Error is ${error}`);
    }
}


function delay(time) {
    return new Promise(resolve => setTimeout(resolve, time));
  }
  
  


async function asyncDeleteUser(user){
    
    const url = `http://localhost:8080/users/delete/${user.id}`

    try{
        let result = await fetch(
            url,
            {
                method: "DELETE",
                headers: new Headers({
					"Authorization": "Bearer " + inMemoryToken,
                    'content-type':'application/json'
                })
            }
        )
        
    }catch(error){
        console.log(`error is ${error}`);
    }
}