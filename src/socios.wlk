class Socio{
	var actividades = #{}
	const maximoDeActividades
	var idiomasQueHabla //coleccion de idiomas
	var property edad //numero representativo de edad
	
	method registrarActividad(actividad){
		if(actividades.size() < maximoDeActividades){
			actividades.add(actividad)
		}
		else { self.error("Llego al maximo de actividades")}
	}
	
	method esAdoradorDelSol()= actividades.all{actividad => actividad.sirveParaBroncearse()}
	
	method actividadesEsforzadas()= actividades.filter{actividad => actividad.implicaEsfuerzo()}
	
	method leInteresaActividad(actividad)= true
	
	method hizoActividad(actividad)= actividades.contains(actividad)
}

class SocioTranquilo inherits Socio{
	override method leInteresaActividad(actividad)= actividad.diasQueLleva() > 4
}

class SocioCoherente inherits Socio{
	override method leInteresaActividad(actividad)= if(self.esAdoradorDelSol()){
													   actividad.sirveParaBroncearse() or actividad.implicaEsfuerzo()
													   }
													 else { false }
}

class SocioRelajado inherits Socio{
	override method leInteresaActividad(actividad)= not idiomasQueHabla.intersection(actividad.idiomas()).isEmpty()
}