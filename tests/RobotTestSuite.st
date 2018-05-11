TestSuite subclass: RobotTestSuite [
    RobotTestSuite class >> suite [
        ^super new initialize
    ]

    initialize [
        FileStream fileIn: 'tests/ExampleSetTest.st'.

        self name: 'Robot-Test'.
        self addTest: (ExampleSetTest selector: #testAdd).
        self addTest: (ExampleSetTest selector: #testGrow).
        self addTest: (ExampleSetTest selector: #testIllegal).
        self addTest: (ExampleSetTest selector: #testIncludes).
        self addTest: (ExampleSetTest selector: #testOccurrences).
        self addTest: (ExampleSetTest selector: #testRemove).
    ]
]
"RobotTestSuite new initialize; run."
RobotTestSuite suite run.
