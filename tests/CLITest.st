FileStream fileIn: 'src/CLI.st'.

TestCase subclass: CLITest [
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

    testRunExampleA [
        <category: 'Testing'>
        | argsV |
        argsV := Array new: 1.
        argsV at: 1 put: 'examples/example_a.txt'.
        ToyRobot.CLI run: argsV.

        self assert: (stdout contents = '0,0,NORTH').
        "self assert: (stdout contents = ('0,0,NORTH', (String with: Character cr)))."
    ]

    testRunExampleB [
        <category: 'Testing'>
        ToyRobot.CLI run: #('examples/example_b.txt').
        self assert: (stdout contents = '0,0,WEST').
        "self assert: (stdout contents = ('0,0,WEST', (String with: Character cr)))."
    ]

    testRunExampleC [
        <category: 'Testing'>
        ToyRobot.CLI run: #('examples/example_c.txt').
        self assert: (stdout contents = '3,3,NORTH').
        "self assert: (stdout contents = ('3,3,NORTH', (String with: Character cr)))."
    ]

    testRunEXIT [
        <category: 'Testing'>
        stdin := ReadWriteStream on: ('EXIT', (String with: Character cr)).
        ToyRobot.CLI run: #().

        self assert: (stdout contents = '').
        "self assert: (stdout contents = '0,0,NORTH')."
        "self assert: (stdout contents = ('0,0,NORTH', (String with: Character cr)))."
    ]

    testRunReport [
        <category: 'Testing'>
        stdin := ReadWriteStream on: (
            'REPORT', (String with: Character cr),
            'EXIT', (String with: Character cr)
        ).
        ToyRobot.CLI run: #().

        self assert: (stdout contents = '0,0,NORTH').
        "self assert: (stdout contents = ('0,0,NORTH', (String with: Character cr)))."
    ]

    testRunMoveReport [
        <category: 'Testing'>
        stdin := ReadWriteStream on: (
            'MOVE', (String with: Character cr),
            'REPORT', (String with: Character cr),
            'EXIT', (String with: Character cr)
        ).
        ToyRobot.CLI run: #().

        self assert: (stdout contents = '0,1,NORTH').
        "self assert: (stdout contents = ('0,0,NORTH', (String with: Character cr)))."
    ]

    testRunReportMoveReport [
        <category: 'Testing'>
        stdin := ReadWriteStream on: (
            'REPORT', (String with: Character cr),
            'MOVE', (String with: Character cr),
            'REPORT', (String with: Character cr),
            'EXIT', (String with: Character cr)
        ).
        ToyRobot.CLI run: #().

        self assert: (stdout contents = ('0,0,NORTH', '0,1,NORTH')).
    ]
]
