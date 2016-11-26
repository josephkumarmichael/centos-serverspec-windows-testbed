require 'spec_helper'

describe file('c:/windows') do
  it { should be_directory }
end

describe file('c:/temp/testfile.txt') do
  it { should be_file }
end

describe service('Schedule') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
  it { should have_start_mode("Automatic") }
end

describe port(139) do
  it { should be_listening }
end

describe user('Administrator') do
  it { should exist }
  it { should belong_to_group('Administrators')}
end
