module RubyTrelloCli
  module CLI
    class List

      def initialize
        parse_options
        connect_to_trello
      end

      def list
        ll = RubyTrelloCli::Requests::ListLists.new

        lists = ll.list @options

        lists.each do |list|
          name = list.attributes[:name]
          id   = list.attributes[:id]

          puts "Name : #{name}"
          puts "ID   : #{id}"
          puts "------"
        end
      end

      private

      def parse_options
        @options = {}

        OptionParser.new do |opts|

          opts.banner = "Usage: ruby-trello-cli list [list] [options]"

          opts.on("-b", "--board [BOARD]", "Trello Board Id") do |b|
            @options[:board_id] = b
          end

        end.parse!
      end

    end
  end
end
