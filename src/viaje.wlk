class Actividad{
	const property idiomas
	
	method implicaEsfuerzo()
	
	method sirveParaBroncearse()
	
	method diasQueLleva()
	
	method esInteresante()= self.usaVariosIdiomas()
	
	method usaVariosIdiomas()= idiomas.size() > 1
	
	method esRecomendadaParaSocio(socio)=
	 
			socio.leInteresaActividad(self) and self.esInteresante() and not socio.hizoActividad(self)
}

class ViajeDePlaya inherits Actividad{
	const largo //en metros
	
	override method implicaEsfuerzo()= largo > 1200 //1200 metros de largo
	
	override method sirveParaBroncearse()= true
	
	override method diasQueLleva()= largo / 500
}

class ExcursionACiudad inherits Actividad{
	const atraccionesAVisitar
	
	override method implicaEsfuerzo()= atraccionesAVisitar > 5
	
	override method sirveParaBroncearse()= false
	
	override method diasQueLleva()= atraccionesAVisitar / 2
	
	override method esInteresante()= super() or atraccionesAVisitar == 5
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
	override method sirveParaBroncearse()= true
	override method diasQueLleva()= super() + 1 
}

class SalidaDeTrekking inherits Actividad{
	const kilometrosDeSenderos
	const diasDeSolAlAnio
	
	override method implicaEsfuerzo()= kilometrosDeSenderos > 80 //80 kilometros de recorrido
	
	override method sirveParaBroncearse()= self.habraMuchoSol() or self.recorridoLargoConSol()
	
	method habraMuchoSol() = diasDeSolAlAnio > 200
	
	method recorridoLargoConSol() = kilometrosDeSenderos > 120 and diasDeSolAlAnio.between(100,200)
	
	override method diasQueLleva()= kilometrosDeSenderos / 50
	
	override method esInteresante()= super() and diasDeSolAlAnio > 140
}

class ClaseDeGimnasia inherits Actividad{
	override method idiomas() = #{"español"}
	override method diasQueLleva() = 1
	override method implicaEsfuerzo() = true
	override method sirveParaBroncearse() = false
	override method esRecomendadaParaSocio(socio)= socio.edad().between(20,30)
}

class TallerLiterario inherits Actividad{
	const libros
	
	method idiomasUsados()= libros.map{libro => libro.idioma()}.set()
	
	override method diasQueLleva()= libros.size() + 1
	
	override method implicaEsfuerzo()= self.hayAlgunLibroExtenso() or self.hayMuchosLibrosDelMismoAutor()
	
	method hayAlgunLibroExtenso()= libros.any{libro => libro.paginas() > 500}
	
	method hayMuchosLibrosDelMismoAutor()= libros.size() > 1 and self.cantidadDeAutores() == 1
	
	method cantidadDeAutores()= self.autores().size()
	
	method autores()= libros.map{libro => libro.autor()}.set()
	
	override method sirveParaBroncearse()= false
		
	override method esRecomendadaParaSocio(socio)= socio.idiomas().size() > 1
}

class Libro{
	const property idioma // idioma en el que esta el libro
	const property paginas // numero de paginas que tiene el libro
	const property autor // nombre del autor del libro
}

