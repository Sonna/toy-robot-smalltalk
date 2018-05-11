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
]
