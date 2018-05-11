FileStream fileIn: 'src/Robot.st'.

Namespace current: ToyRobot [

Object subclass: CLI [
    run [
        | robot |
        robot := ToyRobot.Robot new.
        robot report.
    ]
]

]
