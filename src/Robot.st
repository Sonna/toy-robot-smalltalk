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
        x asString, ',', y asString, ',', facing displayOn: stdout
        "x asString, ',', y asString, ',', facing, Character cr displayOn: stdout"
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
            at: 'EAST' put: [ 'NORTH' ];
            at: 'SOUTH' put: [ 'EAST' ];
            at: 'WEST' put: [ 'SOUTH' ].
        facing := (dict at: facing) value.
        self
    ]
]

]
