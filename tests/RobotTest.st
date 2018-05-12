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

    testMove [
        <category: 'Testing'>
        subject := ToyRobot.Robot new.
        subject move.

        self assert: (subject x = 0).
        self assert: (subject y = 1).
        self assert: (subject facing = 'NORTH').
    ]

    testMoveWESTFrom11 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new x: 1 y: 1 facing: 'WEST'.
        subject move.

        self assert: (subject x = 0).
        self assert: (subject y = 1).
        self assert: (subject facing = 'WEST').
    ]

    testMoveEASTFrom22 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new x: 2 y: 2 facing: 'EAST'.
        subject move.

        self assert: (subject x = 3).
        self assert: (subject y = 2).
        self assert: (subject facing = 'EAST').
    ]

    testMoveSOUTHFrom22 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new x: 2 y: 2 facing: 'SOUTH'.
        subject move.

        self assert: (subject x = 2).
        self assert: (subject y = 1).
        self assert: (subject facing = 'SOUTH').
    ]
    testMoveWESTFrom22 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new x: 2 y: 2 facing: 'WEST'.
        subject move.

        self assert: (subject x = 1).
        self assert: (subject y = 2).
        self assert: (subject facing = 'WEST').
    ]

    testMoveEASTFrom00 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new facing: 'EAST'.
        subject move.

        self assert: (subject x = 1).
        self assert: (subject y = 0).
        self assert: (subject facing = 'EAST').
    ]

    testMoveSOUTHFrom00 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new facing: 'SOUTH'.
        subject move.

        self assert: (subject x = 0).
        self assert: (subject y = 0).
        self assert: (subject facing = 'SOUTH').
    ]

    testMoveWESTFrom00 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new facing: 'WEST'.
        subject move.

        self assert: (subject x = 0).
        self assert: (subject y = 0).
        self assert: (subject facing = 'WEST').
    ]

    testMoveWESTFrom04 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new x: 0 y: 4 facing: 'WEST'.
        subject move.

        self assert: (subject x = 0).
        self assert: (subject y = 4).
        self assert: (subject facing = 'WEST').
    ]

    testMoveNORTHFrom04 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new x: 0 y: 4 facing: 'NORTH'.
        subject move.

        self assert: (subject x = 0).
        self assert: (subject y = 4).
        self assert: (subject facing = 'NORTH').
    ]

    testMoveNORTHFrom44 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new x: 4 y: 4 facing: 'NORTH'.
        subject move.

        self assert: (subject x = 4).
        self assert: (subject y = 4).
        self assert: (subject facing = 'NORTH').
    ]

    testMoveEASTFrom44 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new x: 4 y: 4 facing: 'EAST'.
        subject move.

        self assert: (subject x = 4).
        self assert: (subject y = 4).
        self assert: (subject facing = 'EAST').
    ]

    testMoveEASTFrom40 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new x: 4 y: 0 facing: 'EAST'.
        subject move.

        self assert: (subject x = 4).
        self assert: (subject y = 0).
        self assert: (subject facing = 'EAST').
    ]

    testMoveSOUTHFrom40 [
        <category: 'Testing'>
        subject := ToyRobot.Robot new x: 4 y: 0 facing: 'SOUTH'.
        subject move.

        self assert: (subject x = 4).
        self assert: (subject y = 0).
        self assert: (subject facing = 'SOUTH').
    ]

    testPlace [
        <category: 'Testing'>
        subject := ToyRobot.Robot new.
        subject place: '2,3,WEST'.

        self assert: (subject x = 2).
        self assert: (subject y = 3).
        self assert: (subject facing = 'WEST').
    ]
]
