Namespace current: ToyRobot [

Smalltalk.Object subclass: Robot [
    | x y facing |

    <comment: nil>
    <category: 'Class'>

    init [
        <category: 'initialization'>
        x := 0.
        y := 0.
        facing := 'NORTH'.
    ]

    report [
        (x asString, ',', y asString, ',', facing) printNl
    ]
]

]
