async function testemaroto() {
    let request = await fetch("http://127.0.0.1/projetoIntegrador/backend/usuario/loged.php", {
        credentials: "same-origin"
    })
    let resp = await request.json()

    if (resp.authenticated) {
        const mensagens = await buscarMensagens()
        const qtd = await buscarQuantidade()
        console.log(qtd)
        console.log(mensagens)
        divMensagens = document.querySelector('.mid')
        for (let x = 0; x < 10; x++) {
            if(!qtd[x]) break
            let mensagem = document.createElement('div')
            mensagem.setAttribute('class', 'mensagens')

            let dia = document.createElement('div')
            dia.setAttribute('class', 'dia')
            mensagem.appendChild(dia)

            let data = document.createElement('div')
            data.setAttribute('class', 'data')
            data.innerHTML = qtd[x].data//respQtd não existe
            dia.appendChild(data)

            let texto = document.createElement('div')
            texto.setAttribute('class', 'texto')
            texto.innerHTML = mensagens[x].texto//respMensagens não existe
            dia.appendChild(texto)

            let qtdContainer = document.createElement('div')
            qtdContainer.innerHTML = qtd[x].qtd//respQtd não existe
            mensagem.appendChild(qtdContainer)

            divMensagens.appendChild(mensagem)
        }
    } else {
        alert("Realize login.")
        loginFailed()
    }
}

async function buscarMensagens(){
    let reqMsg = await fetch('http://127.0.0.1/projetoIntegrador/backend/usuario/readMensagens.php')
    let respMensagens = await reqMsg.json()
    return respMensagens
    //nao precisa retornar, tu ta setando o valor de "mensagens" já, lá fora dessa funcao essa variavel existe
}
async function buscarQuantidade(){
    let reqDias = await fetch('http://127.0.0.1/projetoIntegrador/backend/usuario/qtdfumada.php')
    let respQtd = await reqDias.json()
    return respQtd
    //nao precisa retornar, tu ta setando o valor de "qtd" já
}
testemaroto()