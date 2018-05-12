FileStream fileIn: 'src/Robot.st'.

TestCase subclass: RobotTest [
    | oldStdout subject |

    <comment: nil>
    <category: 'SUnitTests'>

    setUp [
        <category: 'Running'>

        "Overwrite `stdout` with temporary FileStream"
        oldStdout := stdout copy.
        stdout := ReadWriteStream on: String new.
        '' displayOn: stdout.
    ]

    tearDown [
        subject := nil.

        "reset `stdout` back to old `stdout`"
        stdout := oldStdout.
        oldStdout := nil.
    ]

    testReport [
        <category: 'Testing'>
        subject := ToyRobot.Robot new.
        subject report.

        self assert: (stdout contents = '0,0,NORTH').
    ]

    testReportAtDifferentPosition [
        <category: 'Testing'>
        subject := ToyRobot.Robot x: 1 y: 2 facing: 'EAST'.
        subject report.

        self assert: (stdout contents = '1,2,EAST').
    ]

    testLeft [
        <category: 'Testing'>
        subject := ToyRobot.Robot new.
        subject left.

        self assert: (subject x = 0).
        self assert: (subject y = 0).
        self assert: (subject facing = 'WEST').
    ]

    testLeftFromWEST [
        <category: 'Testing'>
        subject := ToyRobot.Robot new facing: 'WEST'.
        subject left.

        self assert: (subject x = 0).
        self assert: (subject y = 0).
        self assert: (subject facing = 'SOUTH').
    ]

    testLeftFromSOUTH [
        <category: 'Testing'>
        subject := ToyRobot.Robot new facing: 'SOUTH'.
        subject left.

        self assert: (subject x = 0).
        self assert: (subject y = 0).
        self assert: (subject facing = 'EAST').
    ]

    testLeftFromEAST [
        <category: 'Testing'>
        subject := ToyRobot.Robot new facing: 'EAST'.
        subject left.

        self assert: (subject x = 0).
        self assert: (subject y = 0).
        self assert: (subject facing = 'NORTH').
    ]

    testRight [
        <category: 'Testing'>
        subject := ToyRobot.Robot new.
        subject right.

        self assert: (subject x = 0).
        self assert: (subject y = 0).
        self assert: (subject facing = 'EAST').
    ]

    testRightFromEAST [
        <category: 'Testing'>
        subject := ToyRobot.Robot new facing: 'EAST'.
        subject right.

        self assert: (subject x = 0).
        self assert: (subject y = 0).
        self assert: (subject facing = 'SOUTH').
    ]

    testRightFromSOUTH [
        <category: 'Testing'>
        subject := ToyRobot.Robot new facing: 'SOUTH'.
        subject right.

        self assert: (subject x = 0).
        self assert: (subject y = 0).
        self assert: (subject facing = 'WEST').
    ]

    testRightFromWEST [
        <category: 'Testing'>
        subject := ToyRobot.Robot new facing: 'WEST'.
        subject right.

        self assert: (subject x = 0).
        self assert: (subject y = 0).
        self assert: (subject facing = 'NORTH').
    ]
]
