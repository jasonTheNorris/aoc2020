import logging, os, sequtils, strutils

let logger = newConsoleLogger()
addHandler(logger)

let inputFilename = commandLineParams()[0]
let entries = map(split(readFile(inputFilename), '\n'), parseInt)

block entryLoop:
  for i, firstEntry in entries:
    for j, secondEntry in entries:
      if i != j and firstEntry + secondEntry == 2020:
        echo firstEntry * secondEntry
        break entryLoop
