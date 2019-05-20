import pepita.*
import comidas.*
import wollok.game.*

object roque {

	var property position = game.at(3,4)
	var cantAlpiste = 1
	method image() = "jugador.png"

	method move(nuevaPosicion){
		self.position(nuevaPosicion)
		cantAlpiste += 1
	}
	
	method soltaManzana(){
		const manzana = new Manzana()
		manzana.position(self.position())
		game.addVisualIn(manzana, self.position())
	}
	
	method soltaAlpiste(){
		const alpiste = new Alpiste()
		alpiste.granos(cantAlpiste)
		alpiste.position(self.position())
		self.ponerAlpisteSi(alpiste)
		cantAlpiste = 0
	}
	
	method colisionasteCon(ave){
		game.say(self, "Hola Pepita")
		ave.saludar()
	}
	
	method ponerAlpisteSi(alpiste){
		if (cantAlpiste > 0) {	game.addVisualIn(alpiste, self.position())	}
	}
}