FileStream fileIn: 'src/CLI.st'.

Smalltalk arguments isEmpty
  ifTrue: [
      "f := FileStream open: 'afile.txt' mode: FileStream read."
      "[ f = atEnd ] whileFalse: [ (f nextLine) displayNl ] ."
      f := stdin.
      [
        line := (f nextLine).
        line displayNl.

        line = 'EXIT'. "Loop whilst line is not 'EXIT'"
      ] whileFalse.

  ];
  ifFalse: [
    filename := Smalltalk getArgv: 1.
    filename printNl.

    instream := FileStream open: filename mode: FileStream read.
    "Read line by line"
    "instream do: [:c | stdout nextPut: c ]."
    instream do: [:c |
      stdout nextPut: c.
    ].
  ] !
