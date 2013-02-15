module RubyTrelloCli
  module CLI
    class Card

      def initialize
        parse_options
        connect_to_trello
      end

      def create
        card        = create_card
        name        = card.attributes[:name]
        description = card.attributes[:description]

        puts "Card Created."
        puts "Name        : #{name}"
        puts "Description : #{description}"
      end

      private

      def create_card
        cc = RubyTrelloCli::Requets::CreateCard.new
        cc.create @options
      end

      def parse_options
        @options = {}

        OptionParser.new do |opts|

          opts.banner = "Usage: ruby-trello-cli card [create] [options]"

          opts.on("-b", "--board [BOARD]", "Trello Board Id") do |b|
            @options[:board_id] = b
          end

          opts.on("-d", "--description [DESCRIPTION]", "Description Of Card") do |d|
            @options[:description] = d
          end

          opts.on("-l", "--list [LIST]", "List Of Card") do |l|
            @options[:list_id] = l
          end

          opts.on("-n", "--name [NAME]", "Name Of Card") do |n|
            @options[:name] = n
          end

        end.parse!
      end

    end
  end
end
