let refResposta = document.querySelector('.main')
let refFormCadastro = document.querySelector('.formCadastro')
let refButtom = document.querySelector('.realizarCadastro')

async function fnCadastro() {
    let inps= refFormCadastro.querySelectorAll('input')
    let reqCadastrar = await fetch('http://127.0.0.1/projetoIntegrador/backend/usuario/create.php',{
        method: "POST",
        body: await JSON.stringify({
            "nome":inps[0].value,"email":inps[1].value,"senha":inps[2].value,
            "qtdMediaFumada":inps[3].value,"preco":inps[4].value
        })
    })
    let resp = await reqCadastrar.json()
    if(resp.authenticated){
        alert("Cadastrado.")
        loginFailed()
    }else{
        alert(resp)
    }
}
refFormCadastro.addEventListener('submit', ev => ev.preventDefault())
refButtom.addEventListener('click', ev => fnCadastro() ) 