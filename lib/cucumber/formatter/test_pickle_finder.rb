module Cucumber
  module Formatter
    class TestCaseUnknownError < StandardError; end

    class TestPickleFinder
      def initialize(config)
        @pickle_by_test_case_id = {}
        config.on_event :test_case_created, &method(:on_test_case_created)
      end

      def pickle_id(test_case)
        return @pickle_by_test_case_id[test_case.id] if @pickle_by_test_case_id.key?(test_case.id)

        raise TestCaseUnknownError, "No pickle found for #{test_case.id} }. Known: #{@pickle_by_test_case_id.keys}"
      end

      private

      def on_test_case_created(event)
        @pickle_by_test_case_id[event.test_case.id] = event.pickle.id
      end
    end
  end
end
