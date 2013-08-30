require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/better-parallel-tests'

describe BetterParallelTests::Launcher do

  let(:launcher)  { BetterParallelTests::Launcher.new                                             }
  let(:spec_file) { File.join((File.expand_path File.dirname(__FILE__)), 'examples', 'a_spec.rb') }

  it 'returns number of threads requested' do
    launcher.launch(5) { "no-op" }
    launcher.threads.count.must_equal 5
  end

end
