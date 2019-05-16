import ciudades.*
import wollok.game.*

object pepita {
/*En la primer parte se modificaron los metodos: image()
  						 						 volaHacia(unaCiudad)
  												 move(nuevaPosicion)
  						 
  y se agregaron los metodos: laEnergiaActualAlcanzaParaVolarA(posicion)
  							  volaYCome(comida)
  							  colisionasteCon(persona)	*/
  							  
  							  
	//Atributos de pepita junto a sus getter y setters.
	var property energia = 100
	var property ciudad = buenosAires 
	var property position = game.at(3,3)
	
	//Da la imagen correspondiente a pepita.
	method image() {
		return if(self.energia()>100){ "pepita-gorda-raw.png" }
		else{ "pepita.png"}
	}
	
	//Da de comer a pepita.
	method come(comida) {
		energia = energia + comida.energia()
	}
	
	//Hace volar a pepita hacia la posicion de la comida y comerla, si le alcanza la energia para el vuelo.
	method volaYCome(comida){	
		self.move(comida.position())
		self.come(comida)
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
	
	//Colision con roque.
	method colisionasteCon(persona){
		persona.alimentarA(self)
	}
}
