module BetterParallelTests
  class Parser

    attr_reader :output

    def file(filename, regex)
      greplines(filename, regex)
    end

    private

      def greplines(filename, regex)
        @output = []
        lineno = 0
        File.open(filename).each_line do |line|
          @output << "#{lineno += 1}: #{line}" if line =~ regex
        end
      end

  end # Parser
end # BetterParallelTests
