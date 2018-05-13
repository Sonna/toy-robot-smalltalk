FileStream fileIn: 'src/Robot.st'.

Namespace current: ToyRobot [

Object subclass: CLI [
    CLI class >> run: argsV [
        | robot instream |
        robot := ToyRobot.Robot new.

        argsV isEmpty
            ifTrue: [ instream := stdin. ];
            ifFalse: [
                | filename |
                filename := argsV at: 1.
                instream := FileStream open: filename mode: FileStream read.
            ].
        CLI processInput: instream robot: robot.
    ]

    CLI class >> processInput: source robot: toyRobot [
        | commands line newRobot |
        [
            line := (source nextLine).
            commands := line allOccurrencesOfRegex: '[^ ]+'.

            "line = 'EXIT' ifTrue: [ ^newRobot. ]."
            commands size > 1
                ifTrue: [
                    "newRobot := toyRobot exec: (commands first) with: (commands at: 2)."
                    toyRobot exec: (commands first) with: (commands at: 2).
                ];
                ifFalse: [
                    commands size > 0 ifTrue: [
                        "newRobot := toyRobot exec: (commands first) with: ''."
                        toyRobot exec: (commands first) with: ''.
                    ].
                ].
            "CLI processInput: source robot: newRobot."
            line = 'EXIT' or: [ source atEnd. ]. "Loop whilst line is not 'EXIT'"
        ] whileFalse.
    ]
]

]
