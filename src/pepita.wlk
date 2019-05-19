import roque.*
import ciudades.*
import comidas.*
import wollok.game.*

object pepita {

	//Atributos de pepita junto a sus getter y setters.
	var property energia = 100
	var property position = game.at(1,1)
	var property ciudad = buenosAires
	
	//Da la imagen correspondiente a pepita.
	method image() {
		return if(self.energia()>100){ "pepita-gorda-raw.png" }
		else{ "pepita.png"}
	}
	
	//Da de comer a pepita.
	method comer(comida) {
		energia = energia + comida.energia()
		game.removeVisual(comida)
	}
	
	//Mueve a pepita hacia unaCiudad si no esta en ella y le alcanza la energia.
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		}
		else{ game.say(self, "Ya estoy en" + unaCiudad) }
	}
	
	//Retorna la energia que costaria ese vuelo.
	method energiaParaVolar(distancia) = 15 + 5 * distancia

	//Mueve a pepita hacia su nueva posicion si le alcanza la energia.
	method move(nuevaPosicion) {
		if (self.laEnergiaActualAlcanzaParaVolarA(nuevaPosicion)){
			energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
			self.position(nuevaPosicion)
		}
		else{ game.say(self, "Dame de comer primero!")}
	}
	
	//Retorna lo que el nombre especifica.
	method laEnergiaActualAlcanzaParaVolarA(nuevaPosicion){	
		return (self.energia() > self.energiaParaVolar(position.distance(nuevaPosicion)))
	}
	
	//Saluda
	method saludar(persona){
		game.say(persona, "Hola Pepita")
	}
}
