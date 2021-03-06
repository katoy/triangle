{spawn, exec} = require 'child_process'

fs = require 'fs'
util = require 'util'

SRC_DIR = 'src'
SRC_INST_DIR = 'src-inst'
SPEC_DIR = 'spec'
TEST_DIR = 'test'
TOP_DIR = '.'

appFiles = []
jsFiles = []
backFiles = []

finds = (folders) ->
  coffee_re = new RegExp(/.*\.coffee$/)
  js_re = new RegExp(/.*\.js$/)
  back_re = new RegExp(/.*~$/)

  traverseFileSystem = (currentPath) ->
    files = fs.readdirSync currentPath
    for file in files
      do (file) ->
         currentFile = currentPath + '/' + file
         stats = fs.statSync(currentFile)
         if stats.isFile() and currentFile.match(coffee_re) and not ~appFiles.indexOf( currentFile )
           appFiles.push currentFile
         else if stats.isFile() and currentFile.match(js_re) and not ~appFiles.indexOf( currentFile )
           jsFiles.push currentFile
         else if stats.isFile() and currentFile.match(back_re) and not ~appFiles.indexOf( currentFile )
           backFiles.push currentFile
         else if stats.isDirectory() and currentFile.indexOf('node_modules') < 0
             traverseFileSystem currentFile
  for folder in folders
    traverseFileSystem folder

run = (args...) ->
  for a in args
    switch typeof a
      when 'string' then command = a
      when 'object'
        if a instanceof Array then params = a
        else options = a
      when 'function' then callback = a

  command += ' ' + params.join ' ' if params?
  cmd = spawn '/bin/sh', ['-c', '-b', command], options
  cmd.stdout.on 'data', (data) -> process.stdout.write data
  cmd.stderr.on 'data', (data) -> process.stderr.write data
  process.on 'SIGHUP', -> cmd.kill()
  cmd.on 'exit', (code) -> callback() if callback? and code is 0


runSync = (str, callback) ->
    exec str, (err, stdout, stderr) ->
      console.log err  if err != null
      console.log stderr if stderr != null
      console.log stdout if !stdout != null
      callback() if callback != null

task 'count', 'how much files (*.coffee, *.js, *~)', ->
  finds([SRC_DIR, SPEC_DIR])
  util.log "#{appFiles.length} coffee files found."
  util.log "#{jsFiles.length} js files found."
  util.log "#{backFiles.length} *~ files found."

task 'compile', 'Compile *.coffee', ->
  invoke 'count'
  util.log "compileing #{appFiles.length} files (*.coffee) ..."
  for file, index in appFiles then do (file, index) ->
    util.log "\t#{file}"
    run "coffee -c #{file}"

task 'clean', 'Clean compiled *.js *~', ->
  finds([SRC_DIR, SPEC_DIR])
  util.log "removing #{jsFiles.length}  files (*.js) ..."
  for file, index in jsFiles then do (file, index) ->
    util.log "\t#{file}"
    run "rm #{file}"

  finds([TOP_DIR])
  util.log "removing #{backFiles.length}  files (*.*~) ..."
  for file, index in backFiles then do (file, index) ->
    util.log "\t#{file}"
    run "rm #{file}"

  run "rm -f test_jstestdriver/report/*"
  run "rm -fr  test_jstestdriver/html/*"
  run "rm -fr #{SRC_INST_DIR}"
  run "rm -fr #{TEST_DIR}/*.js"

# cake -e "development"
option '-e', '--environment [ENVIRONMENT_NAME]', 'set the environment for `task:run` (production|development, default=development)'
option '-p', '--port [ENVIRONMENT_NAME]', 'set the port for `task:run` (default=3000)'
task 'run', "run application", (options) ->
  options.environment or= 'development'
  options.port or= 3000
  run "NODE_ENV=#{options.environment} coffee server.coffee #{options.port}"

task "setup", "setup node-modules", ->
  run "npm install"

task "spec", "spec and coverage", ->
  # run "jasmine-node spec --coffee spec"
  runSync "rm -f coverage.html", ->
    runSync "vows spec/triangle*_spec.coffee -v --spec --cover-html", ->
      run "cp -f coverage.html public/coverage_spec.html" if fs.existsSync('coverage.html')
      console.log "------------------------------------"
      console.log "   Triangle_bad は３つのテストが error になります。"
      console.log "   After finished, See ./coverage.html for coverage."
      console.log "------------------------------------"

task "spec_better_lib", "spec and coverage for better lib", ->
  runSync "rm -f coverage.html", ->
    runSync "vows spec/triangle_spec.coffee --cover-html", ->
      run "cp -f coverage.html public/coverage_spec.html" if fs.existsSync('coverage.html')

task "test", "test and coverage", ->
  runSync "rm -f coverage.html", ->
    runSync "vows test/triangle_test_0.coffee -v --spec --cover-html", ->
      runSync "vows test/triangle_test_1.coffee -v --spec --cover-html", ->
        run "cp -f coverage.html public/coverage_test.html" if fs.existsSync('coverage.html')
        console.log "------------------------------------"
        console.log "   After finished, See ./coverage.html for coverage."
        console.log "------------------------------------"

task "test_better_lib", "test and coverage", ->
  runSync "rm -f coverage.html", ->
    runSync "vows test/triangle_test_1.coffee --cover-html", ->
      run "cp -f coverage.html public/coverage_test.html" if fs.existsSync('coverage.html')

task "inst", "inst", ->
  runSync "rm -fr #{SRC_INST_DIR}", ->
    run "mkdir #{SRC_INST_DIR}"

  runSync "cake compile", ->
    runSync "jscov #{SRC_DIR} #{SRC_INST_DIR}", ->
      run "mv #{SRC_INST_DIR}/*.js #{SRC_DIR}"

task "test-client", "test-client", ->
  console.log "------------------------------------"
  console.log "   1. run server ($ cake run)"
  console.log "   2. access http://localhost:3000/test"
  console.log "     or "
  console.log "     $ phantomjs public/test/run-qunit.coffee http://localhost:3000/test "
  console.log "   3. stop server ( ctrl-c)"
  console.log "------------------------------------"

task "test-jsTestDriver", "jsTestDriver", ->
  console.log "------------------------------------"
  console.log "   1. run server on prt 3000 ($ cake run)"
  console.log "   2. cd test_jstestdriver"
  console.log "   3. ./script/jstestdriver.sh"
  console.log "------------------------------------"

task "test-phantomjs", "phantomjs", ->
  console.log "------------------------------------"
  console.log "   1. run server on prt 3000 ($ cake run)"
  console.log "   2. cd test_jstestdriver"
  console.log "   3. ./script/phantomjs_test.sh"
  console.log "------------------------------------"

task "test-selenium_1", "selenium_1", ->
  console.log "------------------------------------"
  console.log "   1. run server on prt 3000 ($ cake run)"
  console.log "   2. acccss http://localhost:3000 using firefox"
  console.log "   3. Use Selenium IDE, load selenium_1/sample and play"
  console.log "------------------------------------"

task "test-selenium_2", "selenium_2", ->
  console.log "------------------------------------"
  console.log "   1. run server on prt 3000 ($ cake run)"
  console.log "   2. cd selenium_2"
  console.log "   2. java -jar selenium-server-standalone-2.20.0.jar"
  console.log "   3. ruby test01.rb"
  console.log "   4. coffee test01.coffee"
  console.log "------------------------------------"

task "lint", "lint", ->
    run "coffee --lint *.coffee */*.coffee"

task "make-docs", "make docs/*.html, *.epub", ->
    run "cd docs; ./makedoc.sh"

task "clean-docs", "clean gnerated docs/*", ->
    run "cd docs; ./cleandoc.sh"
