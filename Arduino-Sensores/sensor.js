const idUsuario = 1
var five = require("johnny-five")
var fetch = require('node-fetch');
var board = new five.Board({ port: "COM3" })

board.on("ready", function() {
	let dir = []
	var button1 = new five.Button(8);
	var button2 = new five.Button(9);

	button1.on("release", function() {
		console.log( "8" );
		dir.push(1)
		check()
  	});

	button2.on("release", function() {
		console.log( "9" );
		dir.push(2)
		check()
	  });
		
	async function entrada() {
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

	async function saida() {
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
})