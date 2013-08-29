module BetterParallelTests
  class Parser

    attr_reader :output

    def file(filename, regex)
      greplines(filename, regex)
    end

    private

      def greplines(filename, regex)
        @output = []
        line_number = 0
        File.open(filename).each_line do |line|
          line_number += 1
          @output << line_number if line =~ regex
        end
      end

  end # Parser
end # BetterParallelTests
