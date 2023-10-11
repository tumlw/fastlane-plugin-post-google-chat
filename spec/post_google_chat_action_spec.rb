describe Fastlane::Actions::PostGoogleChatAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("Message sent!")

      message = {
        imageUrl: 'https://img.icons8.com/material/24/000000/tags.png',
        webhook: 'https://chat.googleapis.com/v1/spaces/AAAANJ6a2uo/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=ry53Lk7Mr9IpvGXVYQKRSHaT-limus8EPVhtyN-uN3c%3D',
        title: 'Test title',
        description: 'Test description',
        section1Title: 'Test section title',
        section1Description: 'Test section description'
      }

      Fastlane::Actions::PostGoogleChatAction.run(message)
    end
  end
end
