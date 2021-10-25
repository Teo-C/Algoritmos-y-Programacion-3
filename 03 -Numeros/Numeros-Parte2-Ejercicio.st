!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'TC 10/20/2021 17:38:25'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Fraccion with: (Entero with: 7) over: (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:11:26'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'TC 10/20/2021 17:38:42'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Fraccion with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:12:46'!
test10AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:26:23'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: (twoFifth) * (fiveHalfs) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:14:16'!
test14NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'TC 10/20/2021 17:39:01'!
test15NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: (Fraccion with: negativeOne over: two)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'TC 10/20/2021 17:39:08'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Fraccion with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'TC 10/20/2021 17:39:18'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Fraccion with: one over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'TC 10/25/2021 13:47:16'!
* aMultiplier
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'TC 10/25/2021 13:47:23'!
+ anAdder
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'TC 10/25/2021 13:47:30'!
- aSubtrahend
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'TC 10/25/2021 13:47:34'!
/ aDivisor
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'TC 10/25/2021 14:59:12'!
negated
	self subclassResponsibility.! !


!Numero methodsFor: 'testing' stamp: 'TC 10/25/2021 13:46:54'!
isNegative
	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'TC 10/25/2021 13:47:00'!
isOne
	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'TC 10/25/2021 13:47:08'!
isZero
	self subclassResponsibility ! !


!Numero methodsFor: 'initialization' stamp: 'TC 10/25/2021 13:46:38'!
initializeWith: aValue
	
	^ Entero with: aValue.
	! !

!Numero methodsFor: 'initialization' stamp: 'TC 10/25/2021 13:33:39'!
initializeWith: aNumerator over: aDenominator	
	^ Fraccion with: aNumerator over: aDenominator.
! !


!Numero methodsFor: 'accessing' stamp: 'TC 10/25/2021 13:41:00'!
denominator
	self error: 'Tipo entero no cuenta con denominador'.
! !

!Numero methodsFor: 'accessing' stamp: 'TC 10/25/2021 13:41:18'!
integerValue	
	self error: 'Tipo fraccion no cuenta con integerValue'.
! !

!Numero methodsFor: 'accessing' stamp: 'TC 10/25/2021 13:39:13'!
numerator
	self error: 'Tipo entero no cuenta con numerador'.! !

!Numero methodsFor: 'accessing' stamp: 'TC 10/25/2021 13:41:52'!
type
	self subclassResponsibility
! !


!Numero methodsFor: 'printing' stamp: 'TC 10/25/2021 13:42:02'!
printOn: aStream
	
	self subclassResponsibility! !


!Numero methodsFor: 'comparing' stamp: 'TC 10/25/2021 13:42:28'!
= anObject

	^false
! !

!Numero methodsFor: 'comparing' stamp: 'TC 10/25/2021 13:42:58'!
hash
	self subclassResponsibility.! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'TC 10/25/2021 13:43:22'!
// aDivisor 
	self error: 'Tipo de número no soportado'! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'TC 10/25/2021 13:44:51'!
greatestCommonDivisorWith: anEntero 
	self error: 'Tipo de número no soportado'! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!Numero class methodsFor: 'instance creation' stamp: 'NR 9/8/2019 20:46:40'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initializeWith: aValue! !

!Numero class methodsFor: 'instance creation' stamp: 'NR 9/8/2019 23:20:40'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'fm 10/25/2021 13:16:29'!
* aMultiplier 	

	^aMultiplier multiplyAnEntero: self.

	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'fm 10/22/2021 18:42:35'!
+ anAdder 

	^anAdder addingAnEntero: self
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'fm 10/25/2021 12:37:25'!
- aSubtrahend 
	^aSubtrahend subtractingAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'fm 10/25/2021 12:37:37'!
/ aDivisor 
	^aDivisor dividingAnEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:47:50'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TC 10/20/2021 17:25:55'!
negated	
	
	^self * (self class with: -1)! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'TC 10/25/2021 13:51:46'!
integerValue
	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'comparing' stamp: 'TC 10/25/2021 13:49:35'!
= anObject
	^anObject comparingAnEntero: self! !

!Entero methodsFor: 'comparing' stamp: 'TC 10/25/2021 13:51:58'!
hash
	^value hash! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'TC 10/25/2021 13:49:22'!
// aDivisor 
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'TC 10/25/2021 13:52:37'!
addingAFraccion: anAugend
	
	|newNumerator|

	newNumerator :=(anAugend denominator * self value) + anAugend numerator.
		
	^Fraccion with: newNumerator over: anAugend denominator.


! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'fm 10/25/2021 13:08:48'!
addingAnEntero: anAugend

	^self class with: (value + anAugend integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'fm 10/25/2021 12:40:26'!
dividingAFraccion: aDivisor

	|newDenominator|

	newDenominator := aDivisor denominator * self value.
		
	^Fraccion with: aDivisor numerator over: newDenominator
	


! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'TC 10/25/2021 13:52:54'!
dividingAnEntero: aDividend

	^Fraccion with: aDividend over:self

! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'TC 10/25/2021 13:53:17'!
multiplyAFraccion: aMultiplier
	
	^(self value * aMultiplier numerator)/(aMultiplier denominator).
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'fm 10/22/2021 18:20:54'!
multiplyAnEntero: aMultiplier

	^self class with: value * aMultiplier integerValue
	

! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'fm 10/25/2021 12:21:05'!
subtractingAFraccion: aSubtrahend

	|newNumerator|

	newNumerator := ( aSubtrahend numerator) - (aSubtrahend denominator * self value).
		
	^Fraccion with:newNumerator over:aSubtrahend denominator.
		

! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'fm 10/25/2021 12:10:42'!
subtractingAnEntero: aSubtrahend


	^Entero with: (aSubtrahend integerValue - self integerValue).



! !


!Entero methodsFor: 'comparing - private' stamp: 'fm 10/25/2021 13:13:01'!
comparingAFraccion: aFraccion

	^(aFraccion numerator)/(aFraccion denominator) = (self value).! !

!Entero methodsFor: 'comparing - private' stamp: 'fm 10/25/2021 13:09:39'!
comparingAnEntero: anEntero

	^value = anEntero integerValue


	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'HernanWilkinson 5/7/2016 22:53'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initalizeWith: aValue! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'initialization' stamp: 'TC 10/25/2021 13:54:43'!
initializeWith: aNumerator over: aDenominator
	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'TC 10/25/2021 13:54:50'!
* aMultiplier 	
	^aMultiplier multiplyAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'fm 10/22/2021 18:42:24'!
+ anAdder 

	^anAdder addingAFraccion: self
	
	
	
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TC 10/25/2021 13:54:57'!
- aSubtrahend 
	^aSubtrahend subtractingAFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'fm 10/25/2021 12:43:10'!
/ aDivisor 
	^aDivisor dividingAFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TC 10/25/2021 13:48:20'!
negated

	^self class with: (self numerator) * (Entero with: -1) over: (self denominator).! !


!Fraccion methodsFor: 'accessing' stamp: 'TC 10/25/2021 13:55:16'!
denominator
	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'TC 10/25/2021 13:55:21'!
numerator
	^ numerator! !


!Fraccion methodsFor: 'testing' stamp: 'TC 10/20/2021 17:15:04'!
isFalse

	^false.! !

!Fraccion methodsFor: 'testing' stamp: 'TC 10/25/2021 13:55:32'!
isNegative
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'TC 10/25/2021 13:55:39'!
isOne
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'TC 10/25/2021 13:55:45'!
isZero
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'TC 10/25/2021 13:55:58'!
printOn: aStream
	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'comparing' stamp: 'TC 10/25/2021 13:56:04'!
= anObject
	^anObject comparingAFraccion: self! !

!Fraccion methodsFor: 'comparing' stamp: 'TC 10/25/2021 13:56:09'!
hash
	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'comparing - private' stamp: 'fm 10/25/2021 13:11:39'!
comparingAFraccion: aFraccion

	^(aFraccion numerator * self denominator) = (aFraccion denominator * self numerator)

	! !

!Fraccion methodsFor: 'comparing - private' stamp: 'TC 10/25/2021 13:56:27'!
comparingAnEntero: anEntero

	^anEntero integerValue = (self numerator)/(self denominator).! !


!Fraccion methodsFor: 'arithmetic operation - private' stamp: 'fm 10/22/2021 18:36:40'!
addingAFraccion: anAugend

	|newNumerator newDenominator|

	newNumerator := (self numerator * anAugend denominator) + (self denominator * anAugend numerator).
	newDenominator := self denominator * anAugend denominator.
	^newNumerator / newDenominator 
		
	
	
		
	! !

!Fraccion methodsFor: 'arithmetic operation - private' stamp: 'fm 10/22/2021 18:35:25'!
addingAnEntero: anAugend

	|newNumerator|

	newNumerator := ((self denominator * anAugend value) + self numerator).
		
	^Fraccion with:newNumerator over:self denominator.
		
	
	
		
	! !

!Fraccion methodsFor: 'arithmetic operation - private' stamp: 'fm 10/25/2021 12:41:18'!
dividingAFraccion: aDivisor


	^(aDivisor numerator * self denominator) / (aDivisor denominator * self numerator)

! !

!Fraccion methodsFor: 'arithmetic operation - private' stamp: 'TC 10/25/2021 13:57:05'!
dividingAnEntero: aDividend

	|newNumerator|

	newNumerator := aDividend value * self denominator.
		
	^Fraccion with:newNumerator over:self numerator.
		

! !

!Fraccion methodsFor: 'arithmetic operation - private' stamp: 'fm 10/22/2021 18:28:16'!
multiplyAFraccion: aMultiplier

	^(self numerator * aMultiplier numerator) / (self denominator * aMultiplier denominator)
		
	! !

!Fraccion methodsFor: 'arithmetic operation - private' stamp: 'TC 10/25/2021 13:59:28'!
multiplyAnEntero: aMultiplier

	|newNumerator|
	
	newNumerator := self numerator * aMultiplier value.
		
	^Fraccion with: newNumerator over: self denominator.
		
	! !

!Fraccion methodsFor: 'arithmetic operation - private' stamp: 'TC 10/25/2021 13:59:19'!
subtractingAFraccion: aSubtrahend

	|newNumerator newDenominator|

	newNumerator := (aSubtrahend numerator * self denominator) - (aSubtrahend denominator * self numerator).
	newDenominator := self denominator * aSubtrahend denominator.
	
	^newNumerator / newDenominator 

	! !

!Fraccion methodsFor: 'arithmetic operation - private' stamp: 'fm 10/25/2021 12:09:15'!
subtractingAnEntero: aSubtrahend

	|newNumerator|

	newNumerator := ((self denominator * aSubtrahend value) - self numerator).
		
	^Fraccion with:newNumerator over:self denominator.
		
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!


!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
