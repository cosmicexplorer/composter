#!/usr/bin/env coffee

# node standard modules
fs = require 'fs'
path = require 'path'
# npm modules
byline = require 'byline'
# local modules
analyzeLines = require './analyzeLines'

addDefineStr = 'add-define'
removeDefineStr = 'remove-define'
includeStr = 'include-dir'
outputStr = 'output'

getOpt = new (require('node-getopt'))([
  # -D HELLO for #define HELLO,
  # -D HELLO=3 for #define HELLO 3
  ['D', "#{addDefineStr}=ARG+", 'Add cpp define.'],
  # -U HELLO for #undef HELLO
  ['U', "#{removeDefineStr}=ARG+", 'Remove cpp define.'],
  # -I dir adds to include dirs
  ['I', "#{includeStr}=ARG+", 'Include directory for header files.'],
  # -o file
  ['o', "#{outputStr}=ARG", 'Define file to output to.'],
  ['h', 'help', 'Display this help.'],
  ['v', 'version', 'Display version number.']])

getOpt.setHelp(
  "Usage: comppp [OPTION..] FILE\n\n" +
  "[[OPTIONS]]\n"
)

# this should error out appropriately if any incorrect options are given
opts = getOpt.bindHelp().parseSystem()

if 1 != opts.argv.length
  console.error "Please input a single file for preprocessing."
  process.exit -1

# read from file
fs.exists opts.argv[0], (exists) ->
  if !exists
    console.error "Input file not found."
    process.exit -1

  processedStream =
    analyzeLines(byline(fs.createReadStream(opts.argv[0])), {
      defines : opts.options[addDefineStr],
      undefines: opts.options[removeDefineStr],
      includes: opts.options[includeStr]
      })

  if opts.options[outputStr]
    fs.exists path.dirname(opts.options[outputStr]), (exists) ->
      if !exists
        console.error "Directory for output file not found."
        process.exit -1
      fs.stat opts.options[outputStr], (err, stats) ->
        if err and err.code isnt 'ENOENT' # don't care if file doesn't exist
          throw err
        if not err and stats.isDirectory()
          console.error "Output file should be file, not directory."
          process.exit -1
        else
          processedStream.pipe fs.createWriteStream(opts.options[outputStr])
  else
    processedStream.pipe process.stdout
