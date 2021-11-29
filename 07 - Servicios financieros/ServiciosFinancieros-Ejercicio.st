!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'portfolio account1 account2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 12:32:40'!
setUp
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 12:42:36'!
test01NewPortfolioBalanceEquals0
		
	self assert: (portfolio getBalance) equals: 0*peso! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 12:49:46'!
test02PortfolioKnowHowManyItemsItHas
	
	portfolio register: account1.
	
	self assert: (portfolio itemsQuantity ) equals: 1! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 12:53:19'!
test03PortfolioWithOneEmptyAccountMatchesBalanceExpected
	
	portfolio register: account1.
	
	self assert: (portfolio getBalance) equals: 0 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 12:52:39'!
test04PortfolioWithOneAccountMatchesBalanceExpected
	
	Deposit register: 100*peso on: account1.
	
	portfolio register: account1.
	
	self assert: (portfolio getBalance) equals: 100 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 12:52:28'!
test05PortfolioKnowsItsAccountsTransactions
	
	|deposit|
	
	deposit := Deposit register: 100*peso on: account1.
	
	portfolio register: account1.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 12:54:42'!
test06PortfolioWithTwoAccountsMatchesBalanceExpected
	
	Deposit register: 100*peso on: account1.
	
	portfolio register: account1.
	portfolio register: account2.
	
	self assert: (portfolio getBalance) equals: 100 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 12:54:27'!
test07PortfolioWithTwoAccountsMatchesBalanceExpected
	
	Deposit register: 100*peso on: account1.
	Deposit register: 200*peso on: account2.
	
	portfolio register: account1.
	portfolio register: account2.
	
	self assert: (portfolio getBalance) equals: 300 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 12:55:18'!
test08PortfolioWithOneAccountAndOneEmptyPortfolioMatchesExpectedBalance
	
	|portfolio2|
	portfolio2 := Portfolio new.
	
	Deposit register: 100*peso on: account1.
	
	portfolio register: account1.
	portfolio register: portfolio2.
	
	self assert: (portfolio2 getBalance) equals: 0 * peso.
	self assert: (portfolio getBalance) equals: 100 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 13:00:41'!
test09PortfolioWithOneAccountAndOnePortfolioMatchesBalanceExpected
	
	|portfolio2|
	
	portfolio2 := Portfolio new.
	Deposit register: 100* peso on: account1.
	Deposit register: 300* peso on: account2.
	
	portfolio2 register: account2.
	portfolio register: account1.
	portfolio register: portfolio2.
	
	self assert: portfolio getBalance equals: 400*peso! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 13:11:10'!
test10PortfolioCanGetTheTransactionsOfAnAccount
	
	|deposit transactions|
	
	deposit := Deposit register: 100*peso on: account1.
	
	portfolio register: account1.
	
	transactions := portfolio getTransactionsOf: account1.
	
	self assert: (transactions at: 1) equals: deposit.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 13:47:32'!
test11PortfolioCanGetTheTransactionsOfAnAccountInsideAnotherPortfolio
	
	|portfolio2 deposit transactions|
	
	portfolio2 := Portfolio new.
	deposit := Deposit register: 100*peso on: account1.
	
	portfolio2 register: account1.
	portfolio register: portfolio2.
	
	transactions := portfolio getTransactionsOf: account1.
	self assert: (transactions includes: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 16:32:22'!
test12CanGetTransactionOfAllAccounts
	
	|deposit1 deposit2 transactions|
	
	deposit1 := Deposit register: 100*peso on: account1.
	deposit2 := Deposit register: 50*peso on: account2.
	
	portfolio register: account1.
	portfolio register: account2.
	
	transactions := portfolio transactions.
	
	self assert: (transactions includes: deposit1).
	self assert: (transactions includes: deposit2).! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 16:27:14'!
test13CanNotAddTwiceAnAccount

	portfolio register: account1.
	
	self	should: [portfolio register: account1]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'La cuenta ya fue registrada' ].
! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 16:27:07'!
test14CanNotAddTwiceAPortfolio

	|portfolio2|
	portfolio2 := Portfolio new.
	portfolio register: portfolio2.	
	
	self	should: [portfolio register: portfolio2]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'La cuenta ya fue registrada' ].
! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 16:26:56'!
test15CanNotAddAnAccountThatBelongsToAnotherPortfolio

	|portfolio2|
	portfolio2 := Portfolio new.
	portfolio2 register: account1.
	portfolio register: portfolio2.	

	self	should: [portfolio register: account1]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'La cuenta ya fue registrada' ].
! !

!PortfolioTest methodsFor: 'tests' stamp: 'TC 11/29/2021 16:26:14'!
test16CanNotAddSelfPortfolio

	self	should: [portfolio register: portfolio]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'Un portfolio no puede contenerse a si mismo'].
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #ReceptiveAccountTransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTransferTest
	instanceVariableNames: 'originAccount destinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTransferTest methodsFor: 'tests' stamp: 'TC 11/29/2021 11:43:26'!
setUp

	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.! !

!ReceptiveAccountTransferTest methodsFor: 'tests' stamp: 'TC 11/29/2021 11:43:43'!
test01BalanceAfterTransferMatchesExpectedValues

	Transfer register: 100*peso from: originAccount to:destinationAccount.
	
	self assert: originAccount balance equals: -100*peso.
	self assert: destinationAccount balance equals: 100*peso.! !

!ReceptiveAccountTransferTest methodsFor: 'tests' stamp: 'TC 11/29/2021 11:44:00'!
test02TransferValueMatchesExpectedValue

	|transfer|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	transfer := Transfer register: 100 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer value equals: 100 * peso.! !

!ReceptiveAccountTransferTest methodsFor: 'tests' stamp: 'TC 11/29/2021 11:44:25'!
test03BalanceWhenAccountHasPreviousTransactionsMatchesExpectedValues

	Deposit register: 300* peso on: originAccount.
	Withdraw register: 100 * peso on: destinationAccount.
	Transfer register: 100 * peso from: originAccount to: destinationAccount.
	
	self assert: originAccount balance equals: 200 * peso.
	self assert: destinationAccount balance equals: 0 * peso! !

!ReceptiveAccountTransferTest methodsFor: 'tests' stamp: 'TC 11/29/2021 11:44:50'!
test04OriginAndDestinationAccountKnowEachOther

	|transfer transferDeposit transferWithdraw|
	
	transfer := Transfer register: 100 * peso from: originAccount to: destinationAccount.
	transferWithdraw := transfer getWithdraw.
	transferDeposit := transfer getDeposit.
	
	self assert: (transferWithdraw counterpart) equals: destinationAccount.
	self assert: (transferDeposit counterpart) equals: originAccount.
	
	! !

!ReceptiveAccountTransferTest methodsFor: 'tests' stamp: 'TC 11/29/2021 11:49:27'!
test05OriginAndDestinationAccountKnowTheTransfer

	|transfer transferDeposit transferWithdraw|
	
	transfer := Transfer register: 100 * peso from: originAccount to: destinationAccount.
	transferWithdraw := transfer getWithdraw.
	transferDeposit := transfer getDeposit.
	
	self assert: (originAccount hasRegistered: transferWithdraw).
	self assert: (destinationAccount hasRegistered: transferDeposit).
	! !

!ReceptiveAccountTransferTest methodsFor: 'tests' stamp: 'TC 11/29/2021 11:47:45'!
test06CanNotTransferNegativeAmounts
	
	self	should: [Transfer register: -100 * peso from: originAccount to: destinationAccount.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'Monto a transferir invalido' ].
	
	
	! !

!ReceptiveAccountTransferTest methodsFor: 'tests' stamp: 'TC 11/29/2021 11:47:38'!
test07CanNotTransferEmptyAmount
	
	self 	should: [Transfer register: 0 * peso from: originAccount to: destinationAccount.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'Monto a transferir invalido' ].
	
	
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'TC 11/29/2021 16:52:36'!
representativeValue 
	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'TC 11/29/2021 16:07:23'!
value 
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'TC 11/29/2021 16:57:07'!
initializeFor: aValue
	value := aValue .! !


!Deposit methodsFor: 'value' stamp: 'TC 11/25/2021 12:48:50'!
representativeValue
	^ value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !



!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'value origin destination'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'initialization' stamp: 'TC 11/29/2021 16:57:21'!
initializeWith: anAmount from: anOriginAccount to: aDestinationAccount

	value := anAmount.
	origin := anOriginAccount.
	destination := aDestinationAccount.! !


!TransferDeposit methodsFor: 'value' stamp: 'TC 11/25/2021 20:41:52'!
representativeValue
	
	^ value.! !


!TransferDeposit methodsFor: 'partsOfTransfer' stamp: 'TC 11/26/2021 16:20:05'!
counterpart
	
	^ origin! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'TC 11/26/2021 16:17:44'!
with: anAmount from: anOriginAccount to: aDestinationAccount
	
	^ self new initializeWith: anAmount from: anOriginAccount to: aDestinationAccount.! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value origin destination'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'initialization' stamp: 'TC 11/29/2021 16:57:37'!
initializeWith: anAmount from: anOriginAccount to: aDestinationAccount

	value := anAmount.
	origin := anOriginAccount.
	destination := aDestinationAccount.! !


!TransferWithdraw methodsFor: 'partsOfTransfer' stamp: 'TC 11/26/2021 16:20:18'!
counterpart
	
	^ destination! !


!TransferWithdraw methodsFor: 'value' stamp: 'TC 11/25/2021 20:41:31'!
representativeValue

	^ value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'TC 11/26/2021 16:19:52'!
with: anAmount from: anOriginAccount to: aDestinationAccount
	
	^ self new initializeWith: anAmount from: anOriginAccount to: aDestinationAccount.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'TC 11/29/2021 16:57:47'!
initializeFor: aValue
	value := aValue.! !


!Withdraw methodsFor: 'value' stamp: 'TC 11/25/2021 12:49:06'!
representativeValue
	^ value negated.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'TC 11/29/2021 16:59:14'!
initialize
	
	items := OrderedCollection new.
! !


!Portfolio methodsFor: 'mainProtocol' stamp: 'TC 11/29/2021 12:02:05'!
balance

	^items sum: [ :anItem | anItem balance] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'mainProtocol' stamp: 'TC 11/29/2021 10:43:37'!
getBalance

	^items sum: [ :anItem | anItem balance] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'mainProtocol' stamp: 'TC 11/29/2021 15:05:28'!
getTransactionsOf: anItem

	(self hasAnItemRegistered: anItem) ifTrue:[^ anItem transactions].
	^ self error: Portfolio cuentaInvalidaErrorDescription.! !

!Portfolio methodsFor: 'mainProtocol' stamp: 'TC 11/29/2021 15:03:19'!
hasAnItemRegistered: anItem
		
	|index isItemRegistered|
	index := 1.
	isItemRegistered := (items includes: anItem).
	
	[(index = (items size + 1)) or: (isItemRegistered = true)] whileFalse:[
		isItemRegistered := (items at: index) hasAnItemRegistered: anItem.
		index := index + 1.
		].
	^ isItemRegistered .! !

!Portfolio methodsFor: 'mainProtocol' stamp: 'TC 11/29/2021 14:58:19'!
hasRegistered: aTransaction
		
	|index isRegistered|
	index := 1.
	isRegistered := false.
	
	[(index = (items size + 1)) or: (isRegistered = true)] whileFalse:[
		isRegistered := (items at: index) hasRegistered: aTransaction.
		index := index + 1
		].
	^ isRegistered.! !

!Portfolio methodsFor: 'mainProtocol' stamp: 'TC 11/26/2021 16:43:50'!
itemsQuantity
	
	^ items size! !

!Portfolio methodsFor: 'mainProtocol' stamp: 'TC 11/29/2021 16:59:25'!
register: anItem

	(self hasAnItemRegistered: anItem) ifTrue:[^ self error: Portfolio cuentaYaRegistradaErrorDescription].
	(anItem = self) ifTrue:[^ self error: Portfolio noPuedeContenerseErrorDescription].
	
	items add: anItem.! !

!Portfolio methodsFor: 'mainProtocol' stamp: 'TC 11/29/2021 14:37:33'!
transactions
	
	|index transactionsRegistered item|	
	transactionsRegistered := OrderedCollection new.
	index := 1.
	[index = (items size + 1)] whileFalse:[
		item := items at: index.
		transactionsRegistered := transactionsRegistered, (item transactions).
		index := index + 1.
		].
	^ transactionsRegistered.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'TC 11/29/2021 12:05:00'!
cuentaInvalidaErrorDescription
	
	^ 'La cuenta no pertence al portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'TC 11/29/2021 12:00:53'!
cuentaYaRegistradaErrorDescription
	
	^ 'La cuenta ya fue registrada'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'TC 11/29/2021 15:32:50'!
noPuedeContenerseErrorDescription
	
	^ 'Un portfolio no puede contenerse a si mismo'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TC 11/25/2021 20:41:13'!
balance	
	^transactions sum: [ :aTransaction | aTransaction representativeValue] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TC 11/29/2021 17:00:03'!
getCounterpartOn: aTransfer
	
	^ aTransfer getCounterpartOf: self.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TC 11/29/2021 15:03:30'!
hasAnItemRegistered: anItem
	
	^ false.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TC 11/29/2021 17:00:10'!
hasRegistered: aTransaction
	^ (transactions includes: aTransaction).
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TC 11/25/2021 14:02:32'!
register: aTransaction
	transactions add: aTransaction 
	
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'withdraw deposit value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'geters' stamp: 'TC 11/26/2021 16:14:34'!
getDeposit
	
	^ deposit.! !

!Transfer methodsFor: 'geters' stamp: 'TC 11/26/2021 16:14:47'!
getWithdraw
	
	^withdraw.! !

!Transfer methodsFor: 'geters' stamp: 'TC 11/25/2021 20:43:45'!
value
	
	^ value! !


!Transfer methodsFor: 'initialization' stamp: 'TC 11/25/2021 20:37:56'!
initializeFor: anAmount with: transferWithdraw and: transferDeposit
	
	value := anAmount.
	withdraw := transferWithdraw.
	deposit := transferDeposit.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'TC 11/29/2021 11:01:12'!
invalidAmountErrorDescription
	
	^'Monto a transferir invalido'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'TC 11/29/2021 11:02:12'!
register: anAmount from: originAccount to: destinationAccount

	|transferDeposit transferWithdraw transfer|
	
	(anAmount > 0) ifFalse:[^ self error: self invalidAmountErrorDescription].
	
	transfer := self new.
	
	transferDeposit := TransferDeposit with: anAmount from: originAccount to: destinationAccount.
	transferWithdraw := TransferWithdraw with: anAmount from: originAccount to: destinationAccount.
	
	originAccount register: transferWithdraw.
	destinationAccount register: transferDeposit.
	transfer initializeFor: anAmount with: transferWithdraw and: transferDeposit.
	
	^ transfer! !
