import roque.*
import ciudades.*
import comidas.*
import wollok.game.*

//Las ciudades ahora sabe =n que hacer si roque colisiona con ellas.
object villaGesell {
	method image() = "ciudad.png"
	method position() = game.at(8,3)
	
	method nombre() = "Villa Gesell"
	
	method colisionasteCon(persona){
		//No hace nada
	}
}

object buenosAires {
	method image() = "ciudad.png"
	method position() = game.at(1,1)
	
	method nombre() = "Buenos Aires"
	
	method colisionasteCon(persona){
		//No hace nada
	}
}
