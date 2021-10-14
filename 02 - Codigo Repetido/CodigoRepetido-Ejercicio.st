!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 10/9/2021 17:55:24'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook assertion|
	customerBook := CustomerBook new.
	assertion := customerBook doAction: 'add' with: 'Jhon Lenon' in: 50.
	self assert: (assertion).
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 10/9/2021 17:58:20'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook assertion paulMcCartney |
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	assertion := customerBook doAction: 'remove' with: paulMcCartney in: 100.
	self assert: assertion
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 10/9/2021 18:00:52'!
test03CanNotAddACustomerWithEmptyName 
	| customerBook |			
	customerBook := CustomerBook new.
	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 10/9/2021 18:01:25'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook johnLennon |	
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 10/9/2021 18:36:56'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| customerBook paulMcCartney assertion|
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.	
	assertion := customerBook NumOfActiveCustomers: 0 NumOfSuspendedCustomers: 1 NumOfCustomers: 1 Name: paulMcCartney Belongs: true.
	
	self assert: assertion.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 10/9/2021 18:37:39'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	| customerBook paulMcCartney assertion|	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	assertion := customerBook NumOfActiveCustomers: 0 NumOfSuspendedCustomers: 0 NumOfCustomers: 0 Name: paulMcCartney Belongs: false.
	
	self assert: assertion.

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 10/12/2021 16:26:28'!
test07CanNotSuspendAnInvalidCustomer
	| customerBook johnLennon assertion|	
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	assertion := customerBook suspendErrorOn: 'Ringo Starr' verifyExsistenseOf: johnLennon.
	self assert: assertion.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'fm 10/12/2021 16:27:11'!
test08CanNotSuspendAnAlreadySuspendedCustomer	
	| customerBook johnLennon assertion|			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.	
	assertion := customerBook suspendErrorOn: johnLennon verifyExsistenseOf: johnLennon.
	self assert: assertion.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'fm 10/12/2021 16:30:17'!
initialize
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'fm 10/12/2021 16:32:57'!
addCustomerNamed: aName
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'fm 10/12/2021 16:47:52'!
removeCustomerIn: List with: aCustomer  

	1 to: List size do: 
	[ :index |
		aCustomer = (List at: index)
			ifTrue: [
				List removeAt: index.
				^ aCustomer 
			] 
	].

	^''
	

! !

!CustomerBook methodsFor: 'customer management' stamp: 'fm 10/12/2021 16:52:48'!
removeCustomerNamed: aName  
	|customerInActive customerInSuspended|
	
	customerInActive := self removeCustomerIn: active with: aName.
	customerInSuspended := self removeCustomerIn: suspended with: aName.
	
	(customerInActive = '') ifFalse:[^customerInActive].
	(customerInSuspended = '') ifFalse:[^customerInSuspended].
	
	^NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'fm 10/12/2021 16:53:11'!
suspendCustomerNamed: aName 
	(active includes: aName) ifFalse: [^CantSuspend signal].	
	active remove: aName.	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'fm 10/12/2021 16:54:25'!
numberOfActiveCustomers	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'fm 10/12/2021 16:55:38'!
numberOfCustomers
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'fm 10/9/2021 19:00:13'!
NumOfActiveCustomers: numActive NumOfSuspendedCustomers: numSuspended NumOfCustomers: numCustomers Name: name Belongs: belongs

	|assertionActive assertionSuspended assertionCustomers assertionbelongs|
	
	assertionActive := numActive = self numberOfActiveCustomers.
	assertionSuspended := numSuspended = self numberOfSuspendedCustomers.
	assertionCustomers :=  numCustomers = self numberOfCustomers.
	
	belongs ifTrue:[assertionbelongs := self includesCustomerNamed: name]
	
	ifFalse:[assertionbelongs := (self includesCustomerNamed: name) not	].
	
	^assertionActive and: assertionSuspended and: assertionCustomers and: assertionbelongs.! !

!CustomerBook methodsFor: 'testing' stamp: 'fm 10/9/2021 17:54:52'!
doAction: action with: customer in: time

	|millisecondsBeforeRunning millisecondsAfterRunning|

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.

	action = 'add' ifTrue:[self addCustomerNamed: customer].
	
	action = 'remove' ifTrue:[self removeCustomerNamed: customer].
	
	action = 'suspend' ifTrue:[self suspendCustomerNamed: customer].
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning-millisecondsBeforeRunning)<(time*millisecond).! !

!CustomerBook methodsFor: 'testing' stamp: 'fm 10/12/2021 16:55:57'!
includesCustomerNamed: aName
	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'fm 10/12/2021 16:56:15'!
isEmpty	
	^active isEmpty and: [ suspended isEmpty ]! !

!CustomerBook methodsFor: 'testing' stamp: 'fm 10/12/2021 16:25:00'!
suspendErrorOn: aCustomer verifyExsistenseOf: anotherCustomer

	|assertionNumberOfCustomers assertionIncludes|

	[self suspendCustomerNamed: aCustomer.
		Error signal.]
		on: CantSuspend 
		do: [ :anError | 
			assertionNumberOfCustomers := self numberOfCustomers = 1.
			assertionIncludes := (self includesCustomerNamed: anotherCustomer) ].
		
		^assertionNumberOfCustomers and: assertionIncludes.! !

!CustomerBook methodsFor: 'testing' stamp: 'fm 10/9/2021 17:42:44'!
timeInCustomerList: list doing: action with: customer

	action = 'add' ifTrue:[list addCustomerNamed: customer]
	! !


!CustomerBook methodsFor: 'signal errors' stamp: 'fm 10/12/2021 16:57:33'!
signalCustomerAlreadyExists 
	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'fm 10/12/2021 16:57:27'!
signalCustomerNameCannotBeEmpty 
	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
