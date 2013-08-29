require 'better-parallel-tests'

describe BetterParallelTests::Parser do

  let(:parser)      { BetterParallelTests::Parser.new                                               }
  let(:spec_file)   { File.join((File.expand_path File.dirname(__FILE__)), 'examples', 'a_spec.rb') }
  let(:regex)       { /it /                                                                         }

  it 'gets line numbers of a single spec' do
    parser.file spec_file, regex
    parser.output[0].should include('3')
    parser.output[1].should include('7')
    parser.output[2].should include('11')
    parser.output[3].should include('15')
  end

  it 'returns a collection of filename with line numbers appended' do
    parser.file spec_file, regex
    parser.output[0].should eq "#{spec_file}:3"
    parser.output[1].should eq "#{spec_file}:7"
    parser.output[2].should eq "#{spec_file}:11"
    parser.output[3].should eq "#{spec_file}:15"
  end

end
