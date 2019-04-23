import wollok.game.*

//Los alimentos ahora conocen su ubicacion y La colision con roque.
object manzana {
	var property position = game.at(5,1)
	
	method image() = "manzana.png"
	
	method energia() = 80
	
	method colisionasteCon(persona){
		persona.levantarComida(self)
	}
}

object alpiste {
	var property position = game.at(5,5)
	
	method image() = "alpiste.png"
	
	method energia() = 5
	
	method colisionasteCon(persona){
		persona.levantarComida(self)
	}
}
