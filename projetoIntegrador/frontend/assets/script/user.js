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

function fnChangePass(){
    let testemaroto = fetch("http://127.0.0.1/projetoIntegrador/backend/usuario/desloged.php",{
        credentials:"same-origin"
        }).then(response=>{
            return response.json()
        }).then(resp =>{
            let inps= refFormLogin.querySelectorAll('input')
            let reqlistar =  fetch('http://127.0.0.1/projetoIntegrador/backend/usuario/update.php',{
                method: "POST",
                body:  JSON.stringify({"senha":inps[0].value,"senhanova":inps[1].value}),
                credentials: 'same-origin'
            })
            let resp =  reqlistar.json()
            if(resp.authenticated){
                alert("Alterado com sucesso.")
            }else{
                alert("Senha invalida.")
            }
        })
    }
function  fnDestroySession(){
    let testemaroto = fetch("http://127.0.0.1/projetoIntegrador/backend/usuario/desloged.php",{
    credentials:"same-origin"
    }).then(response=>{
        return response.json()
    }).then(resp =>{
        //resp = testemaroto.json()
        if(resp.authenticated){
            alert("Deslogando PiaBOM.")
            loginFailed()
        }else{
            alert("Realize login.")
            loginFailed()
        }
    })
}

function fnDeleteUsuario(){
    let testemaroto = fetch("http://127.0.0.1/projetoIntegrador/backend/usuario/delete.php",{
    credentials:"same-origin"
    }).then(response=>{
        return response.json()
    }).then(resp =>{
        //resp = testemaroto.json()
        if(resp.authenticated){
            alert("Deletado.")
            loginFailed()
        }else{
            alert("deu merda")
        }
    })
}
//let refButtonChange = document.querySelector('.changePass')
//refButtonChange.addEventListener('click', ev => fnChangePass() )

let refButtonDeslogar = document.querySelector('.deslogar')
refButtonDeslogar.addEventListener('click', ev => fnDestroySession() ) 

let refButtonDeletar = document.querySelector('.delete')
refButtonDeletar.addEventListener('click', ev => fnDeleteUsuario() )