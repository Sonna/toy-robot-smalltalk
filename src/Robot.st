Namespace current: ToyRobot [

Smalltalk.Object subclass: Robot [
    | x y facing |

    <comment: nil>
    <category: 'Class'>

    Robot class >> new [
        "Create a new robot set at coordinates 0, 0, facing NORTH"

        <category: 'instance creation'>
        ^self basicNew x: 0 y: 0 facing: 'NORTH'
    ]

    Robot class >> x: xInteger y: yInteger facing: facingString [
        "Create a new robot with given coordinates"

        <category: 'instance creation'>
        ^self basicNew x: xInteger y: yInteger facing: facingString
    ]

    Robot class >> MOVE [
        <category: 'constant'>
        | moveMap north east south west |
        north := Dictionary new.
        east := Dictionary new.
        south := Dictionary new.
        west := Dictionary new.
        north at: 'x' put: 0; at: 'y' put: 1.
        east at: 'x' put: 1; at: 'y' put: 0.
        south at: 'x' put: 0; at: 'y' put: -1.
        west at: 'x' put: -1; at: 'y' put: 0.

        moveMap := Dictionary new.
        moveMap
            at: 'NORTH' put: north;
            at: 'EAST' put: east;
            at: 'SOUTH' put: south;
            at: 'WEST' put: west.
        ^moveMap.
    ]

    Robot class >> TURN [
        <category: 'constant'>
        | turnMap north east south west |
        north := Dictionary new.
        east := Dictionary new.
        south := Dictionary new.
        west := Dictionary new.
        north at: 'LEFT' put: 'WEST'; at: 'RIGHT' put: 'EAST'.
        east at: 'LEFT' put: 'NORTH'; at: 'RIGHT' put: 'SOUTH'.
        south at: 'LEFT' put: 'EAST'; at: 'RIGHT' put: 'WEST'.
        west at: 'LEFT' put: 'SOUTH'; at: 'RIGHT' put: 'NORTH'.

        turnMap := Dictionary new.
        turnMap
            at: 'NORTH' put: north;
            at: 'EAST' put: east;
            at: 'SOUTH' put: south;
            at: 'WEST' put: west.
        ^turnMap.
    ]

    x [
        "Answer the x coordinate"

        <category: 'accessing'>
        ^x
    ]

    y [
        "Answer the y coordinate"

        <category: 'accessing'>
        ^y
    ]

    facing [
        "Answer the facing coordinate"

        <category: 'accessing'>
        ^facing
    ]

    x: aNumber [
        "Set the x coordinate to aNumber"

        <category: 'accessing'>
        x := aNumber
    ]

    y: aNumber [
        "Set the y coordinate to aNumber"

        <category: 'accessing'>
        y := aNumber
    ]

    facing: aString [
        "Set the facing coordinate to aString"

        <category: 'accessing'>
        facing := aString
    ]

    x: anXNumber y: aYNumber facing: aFacingString [
        "Set the x, y and facing coordinates to anXNumber, aYNumber and"
        "aFacingString, respectively"

        <category: 'accessing'>
        x := anXNumber.
        y := aYNumber.
        facing := aFacingString
    ]

    report [
        x asString, ',', y asString, ',', facing displayOn: stdout.
        "x asString, ',', y asString, ',', facing, (String with: Character cr) displayOn: stdout."
        "x asString, ',', y asString, ',', facing, Character cr displayOn: stdout"
        Transcript cr.
        ^self
    ]

    left [
        | dict |
        dict := Robot TURN.
        facing := (dict at: facing) at: 'LEFT'.
        self
    ]

    right [
        | dict |
        dict := Robot TURN.
        facing := (dict at: facing) at: 'RIGHT'.
        self
    ]

    move [
        | moveMap |
        moveMap := Robot MOVE.

        x := x + ((moveMap at: facing) at: 'x').
        y := y + ((moveMap at: facing) at: 'y').

        (x < 0 or: [ x > 4 ]) ifTrue: [
            x := x - ((moveMap at: facing) at: 'x').
        ].

        (y < 0 or: [ y > 4 ]) ifTrue: [
            y := y - ((moveMap at: facing) at: 'y').
        ].

        ^self
    ]

    place: coordinateString [
        | coordinates |
        coordinates := coordinateString allOccurrencesOfRegex: '[^,]+'.

        x := (coordinates first) asInteger.
        y := (coordinates at: 2) asInteger.
        facing := coordinates at: 3.

        ^self
    ]

    exec: command with: rawArgs [
        | commands |
        commands := Dictionary new.
        commands
            at: 'PLACE' put: [ self place: rawArgs ];
            at: 'MOVE' put: [ self move ];
            at: 'LEFT' put: [ self left ];
            at: 'RIGHT' put: [ self right ];
            at: 'REPORT' put: [ self report ].

        (commands keys includes: command)
            ifTrue: [ (commands at: command) value. ];
            ifFalse: [ self ].
    ]
]

]
