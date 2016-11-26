# centos-serverspec-windows
[![Build Status](https://travis-ci.org/josephkumarmichael/centos-serverspec-windows-testbed.svg?branch=master)](https://travis-ci.org/josephkumarmichael/centos-serverspec-windows-testbed)

using https://hub.docker.com/r/josephkumarmichael/centos-serverspec-windows/ as base container

# Build
```
docker build -t centos-serverspec-windows-container .
```
# DEV
```
docker run -e TARGET_HOST_USERNAME="username" -e TARGET_HOST_PASSWORD="***" -e TARGET_HOST="192.0.0.0" -w /serverspec/tests centos-serverspec-windows-container rake
```
## Output
```shell
/usr/bin/ruby -I/usr/local/share/gems/gems/rspec-core-3.5.4/lib:/usr/local/share/gems/gems/rspec-support-3.5.0/lib /usr/local/share/gems/gems/rspec-core-3.5.4/exe/rspec --pattern spec/windowshost/\*_spec.rb

File "c:/windows"
  should be directory

File "c:/temp/testfile.txt"
  should be file

Service "Schedule"
  should be installed
  should be enabled
  should be running
  should have start mode "Automatic"

Port "139"
  should be listening

User "Administrator"
  should exist
  should belong to group "Administrators"

Finished in 12.72 seconds (files took 0.69431 seconds to load)
9 examples, 0 failures
```
## Debug
```
docker run -it -e TARGET_HOST_USERNAME="username" -e TARGET_HOST_PASSWORD="***" -e TARGET_HOST="192.0.0.0" -w /serverspec/tests centos-serverspec-windows-container bash
```
and from the container
```
rake
```

# CI
```
docker run -e CI_FLAG=true -e TARGET_HOST_USERNAME="username" -e TARGET_HOST_PASSWORD="***" -e TARGET_HOST="192.0.0.0" -w /serverspec/tests centos-serverspec-windows-container rake
```
Note:

Junit report (using rspec_junit_formatter) is created in ./reports folder with in the container

## Report

```xml
<testsuite name="rspec" tests="9" failures="0" errors="0" time="12.434326" timestamp="">
  <!-- Randomized with seed 10175 -->
  <properties/>
  <testcase classname="spec.windowshost.sample_spec" name="File &quot;c:/windows&quot; should be directory" file="./spec/windowshost/sample_spec.rb" time="1.272238"/>
  <testcase classname="spec.windowshost.sample_spec" name="File &quot;c:/temp/testfile.txt&quot; should be file" file="./spec/windowshost/sample_spec.rb" time="1.174061"/>
  <testcase classname="spec.windowshost.sample_spec" name="Service &quot;Schedule&quot; should be installed" file="./spec/windowshost/sample_spec.rb" time="1.489733"/>
  <testcase classname="spec.windowshost.sample_spec" name="Service &quot;Schedule&quot; should be enabled" file="./spec/windowshost/sample_spec.rb" time="1.560738"/>
  <testcase classname="spec.windowshost.sample_spec" name="Service &quot;Schedule&quot; should be running" file="./spec/windowshost/sample_spec.rb" time="1.504575"/>
  <testcase classname="spec.windowshost.sample_spec" name="Service &quot;Schedule&quot; should have start mode &quot;Automatic&quot;" file="./spec/windowshost/sample_spec.rb" time="1.743139"/>
  <testcase classname="spec.windowshost.sample_spec" name="Port &quot;139&quot; should be listening" file="./spec/windowshost/sample_spec.rb" time="1.217949"/>
  <testcase classname="spec.windowshost.sample_spec" name="User &quot;Administrator&quot; should exist" file="./spec/windowshost/sample_spec.rb" time="1.330324"/>
  <testcase classname="spec.windowshost.sample_spec" name="User &quot;Administrator&quot; should belong to group &quot;Administrators&quot;" file="./spec/windowshost/sample_spec.rb" time="1.134787"/>
</testsuite>

```

# Reference

1. https://github.com/mizzy/serverspec/blob/master/WINDOWS_SUPPORT.md
2. https://github.com/WinRb/WinRM
3. https://github.com/sj26/rspec_junit_formatter
4. http://qiita.com/rk05231977/items/d4b05f7c92631be79d53
5. http://qiita.com/o-hayato/items/f39d86ee171ec62a8a52
