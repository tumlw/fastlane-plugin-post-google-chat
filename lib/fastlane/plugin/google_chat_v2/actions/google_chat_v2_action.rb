require 'fastlane/action'
require_relative '../helper/google_chat_v2_helper'

module Fastlane
  module Actions
    class GoogleChatV2Action < Action
      def self.run(params)
        UI.message("The google_chat_v2 plugin is working!")
      end

      def self.description
        "google chat v2"
      end

      def self.authors
        ["“mao-karrostech”"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "google chat v2"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "GOOGLE_CHAT_V2_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
