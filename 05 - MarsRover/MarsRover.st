!classDefinition: #TestsDeMarsRover category: 'MarsRover'!
TestCase subclass: #TestsDeMarsRover
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestsDeMarsRover methodsFor: 'tests' stamp: 'franco 11/18/2021 14:17:30'!
test01ElMarsRoverComienzaEnUnPuntoDeterminado

	
	self assert: marsRover posicion equals: (5@5).! !

!TestsDeMarsRover methodsFor: 'tests' stamp: 'franco 11/18/2021 14:17:33'!
test02ElMarsRoverComienzaApuntandoAlNorte

	
	self assert: marsRover cardinal class = Norte.! !

!TestsDeMarsRover methodsFor: 'tests' stamp: 'franco 11/18/2021 14:25:58'!
test03ElMarsRoverAvanazaHaciaAdelante
	
	
	self segunElComando: 'f' laPosicionDeberiaSer: (5@6).
! !

!TestsDeMarsRover methodsFor: 'tests' stamp: 'franco 11/18/2021 14:26:31'!
test04ElMarsRoverCambiaPuntoCardinal

	self segunElComando: 'rf' laPosicionDeberiaSer: (6@5).
! !

!TestsDeMarsRover methodsFor: 'tests' stamp: 'franco 11/18/2021 14:27:01'!
test05ElMarsRoverCambiaPuntoCardinalVariasVeces

	self segunElComando: 'frfrb' laPosicionDeberiaSer: (6@7).


	
	! !

!TestsDeMarsRover methodsFor: 'tests' stamp: 'franco 11/18/2021 14:18:05'!
test06DevolverErrorAlPasarleUnComandoIncorrecto
	
	
	self 
		should: [ marsRover comando: 'x' ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'Comando invalido' ].
	

	
	! !

!TestsDeMarsRover methodsFor: 'tests' stamp: 'franco 11/18/2021 14:18:10'!
test07DevolverErrorAlPasarleUnComandoIncorrectoAlFinalDelString

	
	self 
		should: [ marsRover comando: 'fflx' ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'Comando invalido' ].
	

	
	! !

!TestsDeMarsRover methodsFor: 'tests' stamp: 'franco 11/18/2021 14:18:13'!
test08DevolverErrorAlPasarleUnComandoIncorrectoEnElMedioDeLaEjecucion
	
	
	self 
		should: [ marsRover comando: 'fflxfbl' ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'Comando invalido' ].
	

	
	! !

!TestsDeMarsRover methodsFor: 'tests' stamp: 'franco 11/18/2021 14:27:40'!
test09MasDeUnComando

	self segunElComando: 'ffb' laPosicionDeberiaSer: (5@6).
	
! !

!TestsDeMarsRover methodsFor: 'tests' stamp: 'franco 11/18/2021 14:28:06'!
test10MasDeUnComandoCambiandoCardinal


	self segunElComando:'flff' laPosicionDeberiaSer: (3@6).

! !

!TestsDeMarsRover methodsFor: 'tests' stamp: 'franco 11/18/2021 14:35:19'!
test11GiroCompletoYRetrocederParaVolverALaMismaPosicion


	self segunElComando:'fllllb' laPosicionDeberiaSer: (5@5).

! !


!TestsDeMarsRover methodsFor: 'setUp' stamp: 'franco 11/18/2021 14:17:20'!
setUp


	marsRover := MarsRover new.! !


!TestsDeMarsRover methodsFor: 'assertPosicionSegunComando' stamp: 'franco 11/18/2021 14:25:25'!
segunElComando: unComando laPosicionDeberiaSer: unaPosicion

	marsRover comando: unComando.
	self assert: marsRover posicion equals: unaPosicion.! !


!classDefinition: #Comandos category: 'MarsRover'!
Object subclass: #Comandos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Comandos methodsFor: 'as yet unclassified' stamp: 'franco 11/18/2021 14:21:15'!
accionDe: marsRover apuntandoA: cardinal.

	self subclassResponsibility ! !


!classDefinition: #Backwards category: 'MarsRover'!
Comandos subclass: #Backwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Backwards methodsFor: 'accion' stamp: 'franco 11/18/2021 13:54:46'!
accionDe: marsRover apuntandoA: cardinal.

	cardinal comandoBackwards: marsRover! !


!classDefinition: #Foward category: 'MarsRover'!
Comandos subclass: #Foward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Foward methodsFor: 'accion' stamp: 'franco 11/18/2021 14:03:17'!
accionDe: marsRover apuntandoA: cardinal.

	cardinal comandoFoward: marsRover! !


!classDefinition: #Left category: 'MarsRover'!
Comandos subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Left methodsFor: 'accion' stamp: 'franco 11/18/2021 14:03:28'!
accionDe: marsRover apuntandoA: cardinal.

	cardinal comandoLeft: marsRover! !


!classDefinition: #Right category: 'MarsRover'!
Comandos subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Right methodsFor: 'accion' stamp: 'franco 11/18/2021 14:03:38'!
accionDe: marsRover apuntandoA: cardinal.

	cardinal comandoRight: marsRover! !


!classDefinition: #Unknown category: 'MarsRover'!
Comandos subclass: #Unknown
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Unknown methodsFor: 'accion' stamp: 'franco 11/18/2021 14:07:08'!
accionDe: marsRover apuntandoA: cardinal.


	^self error: 'Comando invalido'.	! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'cardinal posicion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'fm 11/17/2021 14:36:52'!
initialize

	cardinal := Norte new.
	posicion := (5@5).! !


!MarsRover methodsFor: 'posicion' stamp: 'fm 11/16/2021 15:45:29'!
posicion

	^posicion! !

!MarsRover methodsFor: 'posicion' stamp: 'franco 11/18/2021 13:57:47'!
sumarPosicion: unPunto

	posicion := posicion + unPunto.! !


!MarsRover methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:12:11'!
comando: unComando

	|index auxiliarComando comando|
	
	index := 1.
	
	[index <= unComando size]    
	
	whileTrue:[ 
		
		auxiliarComando := (unComando at: index).
		comando := Unknown new.
		auxiliarComando = $f ifTrue:[comando := Foward new.].
		auxiliarComando = $b ifTrue:[comando := Backwards new.].
		auxiliarComando = $l ifTrue:[comando := Left new.].
		auxiliarComando = $r ifTrue:[comando := Right new.].
		
		comando accionDe: self apuntandoA: cardinal.
		
		index := index + 1.
		].

	

	

	

	

	! !


!MarsRover methodsFor: 'cardinal' stamp: 'fm 11/17/2021 14:40:47'!
cambioDeCardinal: unPuntoCardinal

	cardinal := unPuntoCardinal new.

	! !

!MarsRover methodsFor: 'cardinal' stamp: 'fm 11/16/2021 15:45:23'!
cardinal
	^cardinal! !


!classDefinition: #PuntosCardinales category: 'MarsRover'!
Object subclass: #PuntosCardinales
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntosCardinales methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:20:35'!
comandoBackwards: MarsRover

	self subclassResponsibility ! !

!PuntosCardinales methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:20:41'!
comandoFoward: MarsRover

	self subclassResponsibility ! !

!PuntosCardinales methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:20:45'!
comandoLeft: MarsRover

	self subclassResponsibility ! !

!PuntosCardinales methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:20:51'!
comandoRight: MarsRover

	self subclassResponsibility ! !


!classDefinition: #Este category: 'MarsRover'!
PuntosCardinales subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'comandos' stamp: 'franco 11/18/2021 13:58:16'!
comandoBackwards: marsRover

	marsRover sumarPosicion: (-1@0).! !

!Este methodsFor: 'comandos' stamp: 'franco 11/18/2021 13:59:35'!
comandoFoward: marsRover

	marsRover sumarPosicion: (1@0).! !

!Este methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:01:09'!
comandoLeft: marsRover

	marsRover cambioDeCardinal: Norte.! !

!Este methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:02:03'!
comandoRight: marsRover

	marsRover cambioDeCardinal: Sur.! !


!classDefinition: #Norte category: 'MarsRover'!
PuntosCardinales subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'comandos' stamp: 'franco 11/18/2021 13:58:41'!
comandoBackwards: marsRover

	marsRover sumarPosicion: (0@-1).! !

!Norte methodsFor: 'comandos' stamp: 'franco 11/18/2021 13:59:52'!
comandoFoward: marsRover

	marsRover sumarPosicion: (0@1).! !

!Norte methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:01:21'!
comandoLeft: marsRover

	marsRover cambioDeCardinal: Oeste.! !

!Norte methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:02:14'!
comandoRight: marsRover

	marsRover cambioDeCardinal: Este.! !


!classDefinition: #Oeste category: 'MarsRover'!
PuntosCardinales subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'comandos' stamp: 'franco 11/18/2021 13:58:55'!
comandoBackwards: marsRover

	marsRover sumarPosicion: (1@0).! !

!Oeste methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:00:03'!
comandoFoward: marsRover

	marsRover sumarPosicion: (-1@0).! !

!Oeste methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:01:32'!
comandoLeft: marsRover

	marsRover cambioDeCardinal: Sur.! !

!Oeste methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:02:25'!
comandoRight: marsRover

	marsRover cambioDeCardinal: Norte.! !


!classDefinition: #Sur category: 'MarsRover'!
PuntosCardinales subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'comandos' stamp: 'franco 11/18/2021 13:59:10'!
comandoBackwards: marsRover

	marsRover sumarPosicion: (0@1).! !

!Sur methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:00:24'!
comandoFoward: marsRover

	marsRover sumarPosicion: (0@-1).! !

!Sur methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:01:47'!
comandoLeft: marsRover

	marsRover cambioDeCardinal: Este.! !

!Sur methodsFor: 'comandos' stamp: 'franco 11/18/2021 14:02:34'!
comandoRight: marsRover

	marsRover cambioDeCardinal: Oeste.! !
