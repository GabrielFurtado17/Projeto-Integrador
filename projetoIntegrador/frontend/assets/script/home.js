let testemaroto = fetch("http://127.0.0.1/projetoIntegrador/backend/usuario/loged.php",{
    credentials:"same-origin"
    }).then(response=>{
        return response.json()
    }).then(resp =>{
        //resp = testemaroto.json()
        if(resp.authenticated){
        }else{
            alert("Realize login.")
            loginFailed()
        }
    })


