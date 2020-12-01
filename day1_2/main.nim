import logging, os, sequtils, strutils

let logger = newConsoleLogger()
addHandler(logger)

let inputFilename = commandLineParams()[0]
let entries = map(split(readFile(inputFilename), '\n'), parseInt)

block entryLoop:
  for i, firstEntry in entries:
    for j, secondEntry in entries:
      if j != i:
        for k, thirdEntry in entries:
          if k != i and k != j and firstEntry + secondEntry + thirdEntry == 2020:
            echo firstEntry * secondEntry * thirdEntry
            break entryLoop
