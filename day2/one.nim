import os, sequtils, strutils

let inputFilename = commandLineParams()[0]
let validEntries = filter(split(readFile(inputFilename), '\n'),
  proc (line: string): bool =
    let parts = split(line, ": ")

    let password = parts[1]

    let ruleParts = split(parts[0], ' ')
    let ruleLetter = ruleParts[1]
    let ruleRangeParts = split(ruleParts[0], '-')
    let ruleRange = parseInt(ruleRangeParts[0]) .. parseInt(ruleRangeParts[1])

    let charCount = count(password, ruleLetter)

    charCount in ruleRange
)

echo len(validEntries)
