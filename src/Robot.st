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
        "x asString, ',', y asString, ',', facing, Character cr displayOn: stdout"
        ^self
    ]

    left [
        | dict |
        dict := Dictionary new.
        "dict := Dictionary newFrom: {
                    'NORTH' -> [ 'WEST' ].
                    'EAST' -> [ 'NORTH' ].
                    'SOUTH' -> [ 'EAST' ].
                    'WEST' -> [ 'SOUTH' ]
                }."
        dict
            at: 'NORTH' put: [ 'WEST' ];
            at: 'WEST' put: [ 'SOUTH' ];
            at: 'SOUTH' put: [ 'EAST' ];
            at: 'EAST' put: [ 'NORTH' ].
        facing := (dict at: facing) value.
        self
    ]

    right [
        | dict |
        dict := Dictionary new.
        dict
            at: 'NORTH' put: [ 'EAST' ];
            at: 'EAST' put: [ 'SOUTH' ];
            at: 'SOUTH' put: [ 'WEST' ];
            at: 'WEST' put: [ 'NORTH' ].
        facing := (dict at: facing) value.
        self
    ]

    move [
        | moveMap north east south west |
        north := Dictionary new.
        north at: 'x' put: [ 0 ]; at: 'y' put: [ 1 ].
        east := Dictionary new.
        east at: 'x' put: [ 1 ]; at: 'y' put: [ 0 ].
        south := Dictionary new.
        south at: 'x' put: [ 0 ]; at: 'y' put: [ -1 ].
        west := Dictionary new.
        west at: 'x' put: [ -1 ]; at: 'y' put: [ 0 ].

        moveMap := Dictionary new.
        moveMap
            at: 'NORTH' put: [ north ];
            at: 'EAST' put: [ east ];
            at: 'SOUTH' put: [ south ];
            at: 'WEST' put: [ west ].

        x := x + (((moveMap at: facing) value at: 'x') value).
        y := y + (((moveMap at: facing) value at: 'y') value).

        (x < 0 or: [ x > 4 ]) ifTrue: [
            x := x - (((moveMap at: facing) value at: 'x') value).
        ].

        (y < 0 or: [ y > 4 ]) ifTrue: [
            y := y - (((moveMap at: facing) value at: 'y') value).
        ].

        self
    ]

    place: coordinateString [
        | coordinates |
        coordinates := coordinateString allOccurrencesOfRegex: '[^,]+'.

        x := (coordinates first) asInteger.
        y := (coordinates at: 2) asInteger.
        facing := coordinates at: 3.

        ^self
    ]

    exec: command args: rawArgs [
        | commands |
        commands := Dictionary new.
        commands
            at: 'PLACE' put: [ self place: rawArgs ];
            at: 'MOVE' put: [ self move ];
            at: 'LEFT' put: [ self left ];
            at: 'RIGHT' put: [ self right ];
            at: 'REPORT' put: [ self report ].
"
            at: 'PLACE' put: #place:;
            at: 'MOVE' put: #move;
            at: 'LEFT' put: #left;
            at: 'RIGHT' put: #right;
            at: 'REPORT' put: #report.
"
        "commands at: 'REPORT' put: [ report ]."
        "1 perform: #+ with: 2."

        "self perform: (commands at: command) with: rawArgs."
        (commands at: command) value.
    ]
]

]
