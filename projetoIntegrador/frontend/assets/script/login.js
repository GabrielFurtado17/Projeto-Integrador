    let refButtonlistar = document.querySelector('.realizarLogin')
    let refFormLogin = document.querySelector('.formLogin')
    let respListar = document.querySelector('.h1c')

    function loginSuccessfully(){
        setTimeout("window.location='home.html'",100)
    }
    function loginFailed(){
        setTimeout("window.location='login.html'",100)
    }
    async function fnlistarDados(){
        let inps= refFormLogin.querySelectorAll('input')
        let reqlistar = await fetch('http://127.0.0.1/projetoIntegrador/backend/usuario/read.php',{
            method: "POST",
            body: await JSON.stringify({"email":inps[0].value,"senha":inps[1].value}),
            credentials: 'same-origin'
        })
        let resp = await reqlistar.json()
        
        if(resp.authenticated){
            alert("Login realizado com sucesso.")
            loginSuccessfully()
        }else{
            if((resp.authenticated==false)){
                alert("Email ou senha invalidos.")
                loginFailed() 
            }else{
                alert(resp)
            }
            
        }
    }    
    refFormLogin.addEventListener('submit', ev => ev.preventDefault())
    refButtonlistar.addEventListener('click', ev =>  fnlistarDados() ) 