const idUsuario = 1

var fetch = require('node-fetch');
var five = require("johnny-five")
var board = new five.Board({ port: "COM4" })

// board.on("ready", function() {
// 	var bt1 = new five.Button(2)
// 	var bt2 = new five.Button(3)

// 	const executaAcao = async function(acao) {
// 		// http://127.0.0.1/projetoIntegrador/backend/usuario/addcigarro.php
// 		let resp = null
// 		try {
// 			resp = await fetch(`http://127.0.0.1/projetoIntegrador/backend/usuario/${acao}.php?id=${idUsuario}`, { 
// 				credentials: "same-origin" 
// 			})
// 			resp = await resp.text()
// 		} catch(e) {
// 			console.log('erro:', e)
// 		}
// 		console.log(resp)
// 	}

// 	bt1.on("press", () => executaAcao('addcigarro'))
// 	bt2.on("press", () => executaAcao('rmvcigarro'))
// })



// jhonnyfive...
// firmata
// configurar o arduino
// ver a porta
// mandar o sket



board.on("ready", () => {
	let dir = []
	let bt1 = new five.Button(8)
	let bt2 = new five.Button(9)	

	function entrada() {
		let resp = null
 		try {
 			resp = await fetch(`http://127.0.0.1/projetoIntegrador/backend/usuario/addcigarro.php?id=${idUsuario}`, { 
 				credentials: "same-origin" 
 			})
 			resp = await resp.text()
 		} catch(e) {
 			console.log('erro:', e)
 		}
	}

	function saida() {
		let resp = null
 		try {
 			resp = await fetch(`http://127.0.0.1/projetoIntegrador/backend/usuario/rmvcigarro.php?id=${idUsuario}`, { 
 				credentials: "same-origin" 
 			})
 			resp = await resp.text()
 		} catch(e) {
 			console.log('erro:', e)
 		}
	}

	function erro() {
		console.log('erro')
	}

	function check() {
		if (dir.length < 2)
			return

		if (dir[0] > dir[1])
			saida()

		if (dir[0] < dir[1])
			entrada()

		if (dir[0] == dir[1])
			erro()

		dir = []
	}

	bt1.on("release", () => {
		dir.push(1)
		check()
	})

	bt2.on("release", () => {
		dir.push(2)
		check()
	})


	

})