import os, sequtils, strutils

let inputFilename = commandLineParams()[0]
let validEntries = filter(split(readFile(inputFilename), '\n'),
  proc (line: string): bool =
    let parts = split(line, ": ")

    let password = parts[1]

    let ruleParts = split(parts[0], ' ')
    let ruleLetter = ruleParts[1]
    let rulePositionParts = split(ruleParts[0], '-')
    let rulePositionFirst = parseInt(rulePositionParts[0]) - 1
    let rulePositionSecond = parseInt(rulePositionParts[1]) - 1

    let doesMatchFirst = $password[rulePositionFirst] == ruleLetter
    let doesMatchSecond = $password[rulePositionSecond] == ruleLetter

    doesMatchFirst xor doesMatchSecond
)

echo len(validEntries)
