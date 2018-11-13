var mensagens 
var qtd

let testemaroto = fetch("http://127.0.0.1/projetoIntegrador/backend/usuario/loged.php",{
    credentials:"same-origin"
    }).then(response=>{
        return response.json()
    }).then(resp =>{
        //resp = testemaroto.json()
        if(resp.authenticated){
            buscarMensagens()
            buscarQuantidade()
            
            divMensagens = document.querySelector('.mid')
            for(let x=0;x<10;x++){
                let mensagem = document.createElement('div')
				mensagem.setAttribute('class','mensagem')
                
                let dia = document.createElement('div')
                dia.setAttribute('class','dia')
                mensagem.appendChild(dia)
                
                let data = document.createElement('div')
                data.setAttribute('class','data')
                data.innerHTML = respQtd.data[x]
				dia.appendChild(data)
                
                let texto = document.createElement('div')
                texto.setAttribute('class','texto')
                texto.innerHTML = respMensagens.texto[x]
                dia.appendChild(texto)
            
				let qtd = document.createElement('div')
				qtd.innerHTML = respQtd.qtd[x]
				mensagem.appendChild(qtd)
                
                divMensagens.appendChild(mensagem)
            }
        }else{
            alert("Realize login.")
            loginFailed()
        }
    })

async function buscarMensagens(){
    let reqMsg = await fetch('http://127.0.0.1/projetoIntegrador/backend/usuario/readMensagens.php')
    var respMensagens = await reqMsg.text()
    mensagens = respMensagens
    console.log(respMensagens)
    return respMensagens
}
async function buscarQuantidade(){
    let reqDias = await fetch('http://127.0.0.1/projetoIntegrador/backend/usuario/qtdfumada.php')
    var respQtd = await reqDias.text()
    qtd = respQtd
    console.log(respQtd)
    return respQtd
}



