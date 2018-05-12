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
        self addTest: (RobotTest selector: #testLeft).
        self addTest: (RobotTest selector: #testLeftFromWEST).
        self addTest: (RobotTest selector: #testLeftFromSOUTH).
        self addTest: (RobotTest selector: #testLeftFromEAST).
        self addTest: (RobotTest selector: #testRight).
        self addTest: (RobotTest selector: #testRightFromEAST).
        self addTest: (RobotTest selector: #testRightFromSOUTH).
        self addTest: (RobotTest selector: #testRightFromWEST).
        self addTest: (RobotTest selector: #testMove).
        self addTest: (RobotTest selector: #testMoveWESTFrom11).
        self addTest: (RobotTest selector: #testMoveEASTFrom22).
        self addTest: (RobotTest selector: #testMoveSOUTHFrom22).
        self addTest: (RobotTest selector: #testMoveWESTFrom22).
        self addTest: (RobotTest selector: #testMoveEASTFrom00).
        self addTest: (RobotTest selector: #testMoveSOUTHFrom00).
        self addTest: (RobotTest selector: #testMoveWESTFrom00).
        self addTest: (RobotTest selector: #testMoveWESTFrom04).
        self addTest: (RobotTest selector: #testMoveNORTHFrom04).
        self addTest: (RobotTest selector: #testMoveNORTHFrom44).
        self addTest: (RobotTest selector: #testMoveEASTFrom44).
        self addTest: (RobotTest selector: #testMoveEASTFrom40).
        self addTest: (RobotTest selector: #testMoveSOUTHFrom40).
        self addTest: (RobotTest selector: #testPlace).
        self addTest: (RobotTest selector: #testExecPlace).
        self addTest: (RobotTest selector: #testExecMove).
        self addTest: (RobotTest selector: #testExecLeft).
        self addTest: (RobotTest selector: #testExecRight).
        self addTest: (RobotTest selector: #testExecReport).
    ]
]
"RobotTestSuite new initialize; run."
RobotTestSuite suite run.
