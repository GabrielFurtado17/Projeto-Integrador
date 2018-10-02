let refButtonAdd = document.querySelector('.ADD')
function  fnAdd(){
    let addcigarrao = fetch("http://127.0.0.1/projetoIntegrador/backend/usuario/addcigarro.php",{
        credentials:"same-origin"
        }).then(response=>{
            return response.json()
        }).then(resp =>{
            //resp = addcigarrao.json()
            if(resp.authenticated=false){
                alert("Deu ruim.")
            }
        })
    }

refButtonAdd.addEventListener('click', ev =>  fnAdd() ) 

let refButtonQtd = document.querySelector('.Qtd')

function  fnQtd(){
    let quantidades = fetch("http://127.0.0.1/projetoIntegrador/backend/usuario/qtdfumada.php",{
        credentials:"same-origin",
        headers : { 
            'Content-Type': 'application/json',
            'Accept': 'application/json'
           }
        }).then(response=>{
            return response.json()
        }).then(resp =>{
            //resp = quantidades.json()
            if(resp.authenticated=false){
                alert("Deu ruim.")
            }else{
                alert((resp['qtd']))
            }
        })
    }

refButtonQtd.addEventListener('click', ev =>  fnQtd() ) 