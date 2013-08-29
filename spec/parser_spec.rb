require_relative '../lib/parser'

describe 'Parser' do

  let(:current_dir) { File.expand_path File.dirname(__FILE__) }
  let(:parser)      { BetterParallelTests::Parser.new         }

  it 'gets line numbers of a single spec' do
    parser.file "#{current_dir}/examples/a_spec.rb", /it /
    parser.output[0].should eq 3
    parser.output[1].should eq 7
    parser.output[2].should eq 11
    parser.output[3].should eq 15
  end

end
