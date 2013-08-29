require_relative '../lib/parser'

describe 'Parser' do

  let(:parser) { BetterParallelTests::Parser.new }

  it 'gets line numbers of a single spec' do
    parser.file 'a_spec.rb', /it /
    parser.output.each { |output| output.should include('it ') }
  end

end
