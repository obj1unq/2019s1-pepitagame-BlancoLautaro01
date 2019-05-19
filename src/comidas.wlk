import roque.*
import ciudades.*
import comidas.*
import wollok.game.*

//Los alimentos ahora conocen su ubicacion y La colision con roque.
class Manzana {
	var property position
	
	method image() = "manzana.png"
	
	method energia() = 80
	
	method colisionasteCon(ave){
		ave.comer(self)
	}
}

class Alpiste {
	var property position
	var property granos = 1
	
	method image() = "alpiste.png"
	
	method energia() = granos * 0.5
	
	method colisionasteCon(ave){
		ave.comer(self)
	}
}
