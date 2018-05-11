FileStream fileIn: 'src/Robot.st'.

TestCase subclass: RobotTest [
    | file fileContents oldStdout subject sstream |

    <comment: nil>
    <category: 'SUnitTests'>

    setUp [
        <category: 'Running'>
        "File remove: 'tmp/output.txt'."
        "(File name: 'tmp/output.txt') remove."
        "File touch: 'tmp/output.txt'."

        "Overwrite `stdout` with temporary FileStream"
        oldStdout := stdout copy.
        "stdout := FileStream open: 'tmp/output.txt' mode: FileStream readWrite."
        stdout := ReadWriteStream on: String new.
        '' displayOn: stdout.

        "file := FileStream open: 'tmp/output.txt' mode: FileStream read."
    ]

    tearDown [
        fileContents := nil.
        file := nil.
        subject := nil.

        "reset `stdout` back to old `stdout`"
        stdout := oldStdout.
        oldStdout := nil.
        "File remove: 'tmp/output.txt'."
    ]

    testReport [
        <category: 'Testing'>
        subject := ToyRobot.Robot new.
        subject report.

        sstream := ReadWriteStream on: String new.
        subject report: sstream.
        "sstream contents printNl."
        self assert: (sstream contents = '0,0,NORTH').
"
        fileContents := file contents.
        fileContents printNl.
        self assert: (fileContents = '0,0,NORTH').
        "
        self assert: (stdout contents = '0,0,NORTH').
    ]

    testReportAtDifferentPosition [
        <category: 'Testing'>
        subject := ToyRobot.Robot x: 1 y: 2 facing: 'EAST'.
        subject report.

        sstream := ReadWriteStream on: String new.
        subject report: sstream.
        "sstream contents printNl."
        self assert: (sstream contents = '1,2,EAST').
"
        fileContents := file contents.
        fileContents printNl.
        self assert: (fileContents = '1,2,EAST').
        "
        self assert: (stdout contents = '1,2,EAST').
    ]
]
