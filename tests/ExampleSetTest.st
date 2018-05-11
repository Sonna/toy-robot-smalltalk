"An Example Set Test class"
TestCase subclass: ExampleSetTest [
    | full empty |

    <comment: nil>
    <category: 'SUnitTests'>

    testAdd [
        <category: 'Testing'>
        empty add: 5.
        self assert: (empty includes: 5)
    ]

    testGrow [
        <category: 'Testing'>
        empty addAll: (1 to: 100).
        self assert: empty size = 100
    ]

    testIllegal [
        <category: 'Testing'>
        self should: [empty at: 5] raise: TestResult error.
        self should: [empty at: 5 put: #abc] raise: TestResult error
    ]

    testIncludes [
        <category: 'Testing'>
        self assert: (full includes: 5).
        self assert: (full includes: #abc)
    ]

    testOccurrences [
        <category: 'Testing'>
        self assert: (empty occurrencesOf: 0) = 0.
        self assert: (full occurrencesOf: 5) = 1.
        full add: 5.
        self assert: (full occurrencesOf: 5) = 1
    ]

    testRemove [
        <category: 'Testing'>
        full remove: 5.
        self assert: (full includes: #abc).
        self deny: (full includes: 5)
    ]

    setUp [
        <category: 'Running'>
        empty := Set new.
        full := Set with: 5 with: #abc
    ]
]
"
exampleSetTest := ExampleSetTest new.
suite := TestSuite new.
suite addTest: (exampleSetTest class selector: #testAdd).
suite addTest: (exampleSetTest class selector: #testAdd).
suite addTest: (exampleSetTest class selector: #testGrow).
suite addTest: (exampleSetTest class selector: #testIllegal).
suite addTest: (exampleSetTest class selector: #testIncludes).
suite addTest: (exampleSetTest class selector: #testOccurrences).
suite addTest: (exampleSetTest class selector: #testRemove).
result := suite run.
"

"
(TestSuite named: 'Money')
    addTest: (ExampleSetTest selector: #testAdd);
    addTest: (ExampleSetTest selector: #testRemove);
    run

"
