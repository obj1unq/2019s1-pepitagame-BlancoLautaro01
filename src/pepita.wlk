import ciudades.*
import wollok.game.*

object pepita {
/*En la primer parte se modifico: el metodo image()
  						 el metodo volaHacia(unaCiudad)
  						 el metodo move(nuevaPosicion)
  						 
  y se agregaron los metodos: say(mensaje)
  							  laEnergiaActualAlcanzaParaVolarA(pisicion)	*/
  							  
	//Atributos de pepita junto a sus getter y setters.
	var property energia = 100
	var property ciudad = buenosAires 
	var property position = game.at(3,3)
	
	//Da la imagen correspondiente a pepita.
	method image() {
		return if(self.energia()>100){ "pepita-gorda-raw" }
		else{ "pepita.png"}
	}
	
	//Da de comer a pepita.
	method come(comida) {
		energia = energia + comida.energia()
	}
	
	//Mueve a pepita hacia unaCiudad si no esta en ella y le alcanza la energia.
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		}
		else{ self.say("Ya estoy en" + unaCiudad) }
	}
	
	//Retorna la energia que costaria ese vuelo.
	method energiaParaVolar(distancia) = 15 + 5 * distancia

	//Mueve a pepita hacia su nueva posicion si le alcanza la energia.
	method move(nuevaPosicion) {
		if (self.laEnergiaActualAlcanzaParaVolarA(nuevaPosicion)){
			energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
			self.position(nuevaPosicion)
		}
		else{ self.say("Dame de comer primero!")}
	}
	
	//Retorna lo que el nombre especifica.
	method laEnergiaActualAlcanzaParaVolarA(nuevaPosicion){	
		return (self.energia() < self.energiaParaVolar(position.distance(nuevaPosicion)))
	}
	
	//Pepita dice el mensaje por pantalla.
	method say(unMensaje) = unMensaje
}
