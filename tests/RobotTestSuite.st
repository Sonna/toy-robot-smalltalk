TestSuite subclass: RobotTestSuite [
    RobotTestSuite class >> suite [
        ^super new initialize
    ]

    initialize [
        FileStream fileIn: 'tests/RobotTest.st'.
        FileStream fileIn: 'tests/ExampleSetTest.st'.

        self name: 'Robot-Test'.
        self addTest: (ExampleSetTest selector: #testAdd).
        self addTest: (ExampleSetTest selector: #testGrow).
        self addTest: (ExampleSetTest selector: #testIllegal).
        self addTest: (ExampleSetTest selector: #testIncludes).
        self addTest: (ExampleSetTest selector: #testOccurrences).
        self addTest: (ExampleSetTest selector: #testRemove).

        self addTest: (RobotTest selector: #testReport).
        self addTest: (RobotTest selector: #testReportAtDifferentPosition).
    ]
]
"RobotTestSuite new initialize; run."
RobotTestSuite suite run.
