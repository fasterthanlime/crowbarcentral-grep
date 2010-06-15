import io/FileReader, structs/ArrayList, os/Terminal

main: func (args: ArrayList<String>) -> Int {

    if (args size() < 3) {
        "Usage: %s PATTERN FILE" format(args[0]) println()
        return -1
    }

    pattern := args[1]
    path := args[2]

    FileReader new(path) eachLine(|line|
        idx := line indexOf(pattern)
        if(idx != -1) {
            line[0..idx] print() // before the pattern
            Terminal setFgColor(Color red). setAttr(Attr bright)
            pattern print() // the pattern itself
            Terminal reset()
            line[(idx + pattern length())..line length()] println() // after the pattern
        }

        true
    )
    0

}
