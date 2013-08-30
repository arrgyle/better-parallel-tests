module BetterParallelTests
  class Launcher

    attr_reader :threads

    def initialize
      @threads = []
    end

    def launch(thread_count)
      thread_count.times do
        @threads << Thread.new do
          begin
            yield
          rescue
            raise 'Block execution failure'
          end
        end
      end
      threads.each { |thread| thread.join }
    end

  end # Runner
end # BetterParallelTests
