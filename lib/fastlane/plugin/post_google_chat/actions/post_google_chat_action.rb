require 'fastlane/action'
require_relative '../helper/post_google_chat_helper'
require 'net/http'
require 'uri'
require 'json'

module Fastlane
  module Actions
    class PostGoogleChatAction < Action
      def self.run(params)
        uri = URI.parse(params[:webhook])
        cards = { cards: [
          {
            header: {
              title: params[:title],
              subtitle: params[:description],
              imageUrl: params[:imageUrl]
            },
            sections: [
              {
                widgets: [
                  {
                    keyValue: {
                      topLabel: params[:section1Title],
                      content: params[:section1Description],
                      contentMultiline: true
                    }
                  }
                ]
              }
            ]
          }
        ] }
        # Create the HTTP objects
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        request = Net::HTTP::Post.new(uri.request_uri)
        request.content_type = "application/json"
        request.body = cards.to_json

        # Send the request
        response = http.request(request)

        case response
        when Net::HTTPSuccess
          UI.message("Message sent!")
        when Net::HTTPServerError
          UI.message(response.message)
        else
          UI.message(response.message)
        end
      end

      def self.description
        "Send message to google chat"
      end

      def self.authors
        ["“tumlw”"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "post google chat"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "GOOGLE_CHAT_V2_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
          FastlaneCore::ConfigItem.new(key: :imageUrl,
                                    env_name: "GOOGLE_CHAT_imageUrl",
                                description: "A description of your option",
                                    optional: false,
                                        type: String),
          FastlaneCore::ConfigItem.new(key: :webhook,
                                  env_name: "GOOGLE_CHAT_webhook",
                              description: "A description of your option",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :title,
                                              env_name: "GOOGLE_CHAT_title",
                                          description: "A description of your option",
                                              optional: false,
                                                  type: String),
          FastlaneCore::ConfigItem.new(key: :description,
                                              env_name: "GOOGLE_CHAT_webhook",
                                          description: "A description of your option",
                                              optional: false,
                                                  type: String),
          FastlaneCore::ConfigItem.new(key: :section1Title,
                                              env_name: "GOOGLE_CHAT_section1Title",
                                          description: "A description of your option",
                                              optional: false,
                                                  type: String),
          FastlaneCore::ConfigItem.new(key: :section1Description,
                                              env_name: "GOOGLE_CHAT_section1Description",
                                          description: "A description of your option",
                                              optional: false,
                                                  type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
