describe Fastlane::Actions::GoogleChatV2Action do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The google_chat_v2 plugin is working!")

      Fastlane::Actions::GoogleChatV2Action.run(nil)
    end
  end
end
