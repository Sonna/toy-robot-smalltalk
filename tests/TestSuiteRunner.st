TestCase subclass: TestSuiteRunner [
    <comment: nil>
    <category: 'SUnit-SUnitTests'>

    run [
        <category: 'Not categorized'>
        | exampleSetTest result suite |
        suite := TestSuite new.

        FileStream fileIn: 'tests/ExampleSetTest.st'.
        exampleSetTest := ExampleSetTest new.
        suite addTest: (exampleSetTest class selector: #testAdd).
        suite addTest: (exampleSetTest class selector: #testGrow).
        suite addTest: (exampleSetTest class selector: #testIllegal).
        suite addTest: (exampleSetTest class selector: #testIncludes).
        suite addTest: (exampleSetTest class selector: #testOccurrences).
        suite addTest: (exampleSetTest class selector: #testRemove).

        result := suite run.
        self
            assert: result failures size = 0;
            assert: result errors size = 0
    ]
]

runner := TestSuiteRunner new.
runner run
