import pepita.*
import comidas.*
import wollok.game.*

object roque {
	var property comidaActual = null
	var property position = game.at(9,9)
	method image() = "jugador.png"
	
	method levantarComida(comida){	
		self.dropearComidaActual(comidaActual)
		comidaActual = comida
		game.removeVisual(comida)
	}
	
	method alimentarA(ave){	
		self.alimentarSi(ave)
	}
	
	method alimentarSi(ave){
		if(comidaActual != null){
			ave.come(comidaActual)
			self.dropearComidaActual(comidaActual)
			self.comidaActual(null)
		}
	}
	
	method dropearComidaActual(comida){
		if(self.comidaActual() != null){
			game.addVisualIn(self.comidaActual(), game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0)))	
		}
	}
}