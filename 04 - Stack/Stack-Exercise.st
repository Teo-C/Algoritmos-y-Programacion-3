!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'Tests' stamp: 'TC 11/3/2021 16:14:13'!
test01DoesNotFindSentenceInEmptyStack

	|stack sentences|
	
	stack := OOStack new.
	
	sentences := SentenceFinderByPrefix find: 'Alg' at: stack.
	
	self assert: sentences isEmpty.
	! !

!SentenceFinderByPrefixTest methodsFor: 'Tests' stamp: 'TC 11/4/2021 16:51:47'!
test02FindsOneSentenceAndStackIsNotEmpty
	
	|stack sentences|
	
	stack := OOStack new.
	
	stack push: 'Winter is coming'.
	stack push: 'winter is coming'.
	
	
	sentences := SentenceFinderByPrefix find: 'win' at: stack.
	
	self assert: ((sentences at: 1) = 'winter is coming' and: (stack isEmpty = false)).
	! !

!SentenceFinderByPrefixTest methodsFor: 'Tests' stamp: 'TC 11/3/2021 16:36:27'!
test03DoesNotFindSentenceInStack
	
	|stack sentences|
	
	stack := OOStack new.
	
	stack push: 'Winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of winter'.
	
	sentences := SentenceFinderByPrefix find: 'wint' at: stack.
	
	self assert: sentences isEmpty.
	! !

!SentenceFinderByPrefixTest methodsFor: 'Tests' stamp: 'TC 11/3/2021 16:38:10'!
test04FindsMoreThanOneSentence
	
	|stack sentences|
	
	stack := OOStack new.
	
	stack push: 'Winter is coming'.
	stack push: 'Winter is cold'.
	stack push: 'The winds of Winter'.
	
	sentences := SentenceFinderByPrefix find: 'Wint' at: stack.
	
	self assert: sentences size = 2.
	! !

!SentenceFinderByPrefixTest methodsFor: 'Tests' stamp: 'TC 11/3/2021 16:40:08'!
test05StackKeepsTheOrder
	
	|stack|
	
	stack := OOStack new.
	
	stack push: 'Winter is coming'.
	stack push: 'Winter is cold'.
	stack push: 'The winds of Winter'.
	
	SentenceFinderByPrefix find: 'Wint' at: stack.
	
	self assert: stack top equals: 'The winds of Winter'.
	! !

!SentenceFinderByPrefixTest methodsFor: 'Tests' stamp: 'TC 11/3/2021 16:56:33'!
test06CanNotFindEmptyString

	| stack|
	
	stack := OOStack new.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is coming'.
	
	self	should: [SentenceFinderByPrefix find: '' at: stack]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix InvalidPrefix].! !

!SentenceFinderByPrefixTest methodsFor: 'Tests' stamp: 'TC 11/3/2021 16:57:14'!
test07CanNotFindSpaceString

	| stack|
	
	stack := OOStack new.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is coming'.
	
	self	should: [SentenceFinderByPrefix find: ' ' at: stack]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix InvalidPrefix].! !

!SentenceFinderByPrefixTest methodsFor: 'Tests' stamp: 'TC 11/4/2021 16:50:47'!
test08FindsOneCorrectSentence

	| stack sentences|
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	sentences := SentenceFinderByPrefix find: 'Wint' at: stack.
	self assert: ((sentences at: 1) = 'Winter is here' and: sentences size = 1).! !


!classDefinition: #Node category: 'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: 'element previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'Actions' stamp: 'TC 11/3/2021 15:36:03'!
remove
	
	self subclassResponsibility ! !


!Node methodsFor: 'Accessing' stamp: 'TC 11/3/2021 15:35:41'!
previous
	
	self subclassResponsibility.! !

!Node methodsFor: 'Accessing' stamp: 'TC 11/3/2021 15:36:21'!
seeValue
	
	self subclassResponsibility ! !


!Node methodsFor: 'Initializer' stamp: 'TC 11/1/2021 21:39:18'!
initializeNull
	
	self subclassResponsibility.! !

!Node methodsFor: 'Initializer' stamp: 'TC 11/1/2021 21:42:49'!
initializeWith: anElement previous: aNode

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: 'Stack-Exercise'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'instance creation' stamp: 'TC 11/1/2021 20:41:12'!
with: anElement previous: aNode

	^self new initializeWith: anElement previous: aNode.
	! !


!classDefinition: #FilledNode category: 'Stack-Exercise'!
Node subclass: #FilledNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledNode methodsFor: 'Initializer' stamp: 'TC 11/1/2021 20:37:54'!
initializeWith: anElement previous: aNode
	
	element := anElement.
	previous := aNode.! !


!FilledNode methodsFor: 'Accessing' stamp: 'TC 11/1/2021 20:46:18'!
previous
	
	^ previous.! !

!FilledNode methodsFor: 'Accessing' stamp: 'TC 11/1/2021 20:44:29'!
seeValue

	^element.! !


!FilledNode methodsFor: 'Actions' stamp: 'TC 11/1/2021 20:31:23'!
remove
	
	^ element.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledNode class' category: 'Stack-Exercise'!
FilledNode class
	instanceVariableNames: ''!

!FilledNode class methodsFor: 'instance creation' stamp: 'TC 11/1/2021 20:53:14'!
with: anElement previous: aNode


	^self new initializeWith: anElement previous: aNode.
	! !


!classDefinition: #NullNode category: 'Stack-Exercise'!
Node subclass: #NullNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullNode methodsFor: 'Initializer' stamp: 'TC 11/1/2021 21:38:42'!
initializeNull

	element := nil.
	previous := nil.! !


!NullNode methodsFor: 'Accessing' stamp: 'TC 11/1/2021 20:47:16'!
previous

	^ nil.! !

!NullNode methodsFor: 'Accessing' stamp: 'TC 11/1/2021 20:44:44'!
seeValue
	
	^ self error: OOStack stackEmptyErrorDescription.	! !


!NullNode methodsFor: 'Actions' stamp: 'TC 11/1/2021 20:32:06'!
remove
	
	^ self error: OOStack stackEmptyErrorDescription.
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top quantity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'Actions' stamp: 'TC 11/4/2021 16:56:08'!
pop
	
	|removed newTop|
	
	removed := top.
	newTop := removed previous.
	top := newTop.
	quantity := quantity - 1.
	
	^ (removed remove).! !

!OOStack methodsFor: 'Actions' stamp: 'TC 11/4/2021 16:56:35'!
push: anElement
	
	|previousTop|
	
	previousTop := top.
	top := FilledNode with: anElement previous: previousTop.
	quantity := quantity + 1.
	^ anElement
	
	
	
"	
	stack addFirst: anElement.
	quantity := quantity + 1.
	^ anElement
"! !


!OOStack methodsFor: 'Accessing' stamp: 'TC 11/1/2021 12:59:36'!
isEmpty

	^ quantity = 0.! !

!OOStack methodsFor: 'Accessing' stamp: 'TC 11/1/2021 11:59:09'!
size

	^ quantity.! !

!OOStack methodsFor: 'Accessing' stamp: 'TC 11/1/2021 20:43:06'!
top
	
	^ top seeValue.! !


!OOStack methodsFor: 'Initializer' stamp: 'TC 11/3/2021 15:34:46'!
initialize

	top := NullNode new.
	quantity := 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'Find' stamp: 'TC 11/3/2021 17:10:14'!
find: prefix at: aStack

	|auxStack aStackIsEmpy sentencesContainingPrefix sentence|
	
	(('' = prefix) or: (' ' = prefix)) ifTrue:[^self error: SentenceFinderByPrefix InvalidPrefix].
	
	sentencesContainingPrefix := OrderedCollection new.
	auxStack := OOStack new.
	
	aStackIsEmpy  := aStack isEmpty.
	[aStackIsEmpy] whileFalse: [
		sentence := aStack pop.
		(sentence beginsWith: prefix) ifTrue:[
			sentencesContainingPrefix add: sentence.
			].
		auxStack push: sentence.
		aStackIsEmpy  := aStack isEmpty.
		].
	
	self moveFromStack: auxStack to: aStack.
	
	^ sentencesContainingPrefix.
	
	! !

!SentenceFinderByPrefix methodsFor: 'Find' stamp: 'TC 11/3/2021 17:07:57'!
moveFromStack: aStack to: anotherStack
	
	|aStackIsEmpty|
	
	aStackIsEmpty := aStack  isEmpty.
	
	[aStackIsEmpty] whileFalse: [
		anotherStack push: (aStack pop).
		aStackIsEmpty := aStack  isEmpty.
		].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error' stamp: 'TC 11/3/2021 16:49:25'!
InvalidPrefix

	^'El prefijo no es valido'! !


!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'TC 11/3/2021 16:15:00'!
find: prefix at: aStack
	
	^ self new find: prefix at: aStack.! !
