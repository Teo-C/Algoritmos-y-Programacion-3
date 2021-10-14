!classDefinition: #CarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCurandera class
	instanceVariableNames: 'frasesDesconocido frasesPrometedor cantidadDeInteraccionesPersonajes'!

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'TC 10/4/2021 11:52:29'!
interactuarCon: unPersonaje
	|cambio mensaje|
	
	self recordarInteraccionCon: unPersonaje.	
	cambio := self verificarCambioDeReputacion: unPersonaje.
	mensaje := self responderSegunPersonaje: unPersonaje.
	
	cambio ifTrue:[
		Riverwood verPrometedorA: unPersonaje.
		cantidadDeInteraccionesPersonajes at: unPersonaje put: 0
	].
	^ mensaje.! !

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'TC 9/28/2021 11:10:52'!
olvidarInteracciones
	cantidadDeInteraccionesPersonajes := Dictionary new! !

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'TC 10/4/2021 11:52:40'!
recordarInteraccionCon: unPersonaje	
	|cantidadDeInteracciones|
	
	cantidadDeInteracciones := cantidadDeInteraccionesPersonajes at: unPersonaje ifAbsent: [0].
	
	cantidadDeInteraccionesPersonajes at: unPersonaje put: cantidadDeInteracciones + 1.

	! !

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'TC 9/28/2021 11:09:44'!
responderSegunPersonaje: unPersonaje
	
	|cantidadDeInteracciones reputacion|
	cantidadDeInteracciones := cantidadDeInteraccionesPersonajes at: unPersonaje.	
	
	reputacion := Riverwood reputacionDeUnPersonaje: unPersonaje.
	
	(reputacion = 'prometedor') ifTrue:[
		^ frasesPrometedor at: (cantidadDeInteracciones min: frasesPrometedor size)
		] ifFalse:[
		^frasesDesconocido at: (cantidadDeInteracciones min: frasesDesconocido size)]! !


!CarolinaLaCurandera class methodsFor: 'reputacion' stamp: 'TC 9/28/2021 13:05:08'!
verificarCambioDeReputacion: unPersonaje
	|cantidadDeInteracciones|
	cantidadDeInteracciones := cantidadDeInteraccionesPersonajes at: unPersonaje ifAbsent: [0].
	
	^ cantidadDeInteracciones = 3 ! !


!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'TC 10/4/2021 11:54:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesDesconocido := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesPrometedor := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	cantidadDeInteraccionesPersonajes := ((Dictionary new) add: (#Hamilton->0); yourself).! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'TC 9/28/2021 12:03:07'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'TC 9/28/2021 11:14:02'!
carolinaLaCurandera
	^ CarolinaLaCurandera.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'TC 9/28/2021 11:13:33'!
hamilton
	^ #Hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'TC 9/28/2021 11:14:50'!
tirion
	^ #Tirion! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'TC 9/28/2021 11:45:45'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	|reputacion|
	reputacion := Riverwood reputacionDeUnPersonaje: unPersonaje.
	
	^ reputacion = 'prometedor'! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'TC 9/28/2021 11:10:33'!
hacerQueLaCuranderaOlvideSusInteracciones
	CarolinaLaCurandera olvidarInteracciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'TC 9/28/2021 11:11:46'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	Riverwood olvidarReputaciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'TC 9/28/2021 11:17:06'!
hacerQueRiverwoodVeaPrometedorAHamilton
	Riverwood verPrometedorA: #Hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'TC 9/28/2021 10:53:42'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidarInteracciones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/27/2021 20:52:29'!
hamilton
	^ #Hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/27/2021 21:08:21'!
tirion
	^ #Tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'TC 9/28/2021 10:36:44'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidarInteracciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'TC 9/28/2021 10:48:15'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	Riverwood olvidarReputaciones.
	! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'TC 9/28/2021 10:57:50'!
hacerQueRiverwoodVeaPrometedorAHamilton
	Riverwood verPrometedorA: #Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #Riverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Riverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Riverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
Riverwood class
	instanceVariableNames: 'reputaciones'!

!Riverwood class methodsFor: 'Reputaciones' stamp: 'TC 9/28/2021 10:47:32'!
olvidarReputaciones
	reputaciones at: #Hamilton put: 'desconocido'.
	reputaciones at: #Tirion put: 'desconocido'.! !

!Riverwood class methodsFor: 'Reputaciones' stamp: 'TC 9/28/2021 10:45:46'!
reputacionDeUnPersonaje: unPersonaje
	^ reputaciones at: unPersonaje.! !

!Riverwood class methodsFor: 'Reputaciones' stamp: 'TC 9/28/2021 12:05:00'!
verPrometedorA: unPersonaje
	reputaciones at: unPersonaje put: 'prometedor'.
	TreborElGuardiaDeSkyrim olvidarInteraccionesCon: unPersonaje.! !


!Riverwood class methodsFor: 'as yet unclassified' stamp: 'TC 10/4/2021 11:54:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	reputaciones := ((Dictionary new) add: (#Hamilton->'prometedor'); add: (#Tirion->'desconocido'); yourself).! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frasesDesconocido frasesPrometedor cantidadDeInteraccionesPersonajes reputacionPersonajes'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'TC 9/28/2021 10:52:47'!
interactuarCon: unPersonaje
	self recordarInteraccionCon: unPersonaje.
	^ self responderSegunPersonaje: unPersonaje.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'TC 9/28/2021 10:36:55'!
olvidarInteracciones
	cantidadDeInteraccionesPersonajes := Dictionary new! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'TC 9/28/2021 12:05:44'!
olvidarInteraccionesCon: unPersonaje
	cantidadDeInteraccionesPersonajes at: unPersonaje put: 0! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'TC 9/28/2021 10:12:57'!
recordarInteraccionCon: unPersonaje
	
	|cantidadDeInteracciones|
	cantidadDeInteracciones := cantidadDeInteraccionesPersonajes at: unPersonaje ifAbsent: [0].
	
	cantidadDeInteraccionesPersonajes at: unPersonaje put: cantidadDeInteracciones + 1.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'TC 9/28/2021 10:49:22'!
responderSegunPersonaje: unPersonaje
	
	|cantidadDeInteracciones reputacion|
	cantidadDeInteracciones := cantidadDeInteraccionesPersonajes at: unPersonaje.	
	
	reputacion := Riverwood reputacionDeUnPersonaje: unPersonaje.
	
	(reputacion = 'prometedor') ifTrue:[
		^ frasesPrometedor at: (cantidadDeInteracciones min: frasesPrometedor size)
		] ifFalse:[
		^frasesDesconocido at: (cantidadDeInteracciones min: frasesDesconocido size)]! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'TC 10/4/2021 11:54:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesDesconocido := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesPrometedor := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	cantidadDeInteraccionesPersonajes := ((Dictionary new) add: (#Hamilton->2); yourself).
	reputacionPersonajes := ((Dictionary new) add: (#Hamilton->'prometedor'); yourself).! !

CarolinaLaCurandera initializeAfterFileIn!
Riverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!