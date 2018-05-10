"2 + 3 = 5 ifFalse: [self error: 'Wrong answer']"

"SetTestCase>>#testAdd
    empty add: 5.
    self should: [empty includes: 5]
"
"(SetTestCase selector: #testAdd) run"

"(TestSuite named: 'Money')
    add: (MoneyTestCase selector: #testAdd);
    add: (MoneyTestCase selector: #testSubtract);
    run
"

"An Example Set Test class"
TestCase subclass: #ExampleSetTest
    instanceVariableNames: 'full empty'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'SUnit-Tests'

"Setting up a fixture"
ExampleSetTest >> setUp
    empty := Set new.
    full := Set with: 5 with: 6

"Testing set membership"
ExampleSetTest >> testIncludes
    self assert: (full includes: 5).
    self assert: (full includes: 6)

"Testing occurrences"
ExampleSetTest >> testOccurrences
    self assert: (empty occurrencesOf: 0) = 0.
    self assert: (full occurrencesOf: 5) = 1.
    full add: 5.
    self assert: (full occurrencesOf: 5) = 1

"Testing removal"
ExampleSetTest >> testRemove
    full remove: 5.
    self assert: (full includes: 6).
    self deny: (full includes: 5)

ExampleSetTest suite run
