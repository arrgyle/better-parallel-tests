require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/better-parallel-tests'

describe BetterParallelTests::Parser do

  let(:parser)      { BetterParallelTests::Parser.new                                               }
  let(:spec_file)   { File.join((File.expand_path File.dirname(__FILE__)), 'examples', 'a_spec.rb') }
  let(:regex)       { /it /                                                                         }

  it 'gets line numbers of a single spec' do
    parser.file spec_file, regex
    parser.output[0].include?('3').must_equal true
    parser.output[1].include?('7').must_equal true
    parser.output[2].include?('11').must_equal true
    parser.output[3].include?('15').must_equal true
  end

  it 'returns a collection of filename with line numbers appended' do
    parser.file spec_file, regex
    parser.output[0].must_equal "#{spec_file}:3"
    parser.output[1].must_equal "#{spec_file}:7"
    parser.output[2].must_equal "#{spec_file}:11"
    parser.output[3].must_equal "#{spec_file}:15"
  end

end
