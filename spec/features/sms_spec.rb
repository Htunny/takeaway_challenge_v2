require 'sms'

describe SMS do
  subject(:sms) { described_class.new(config, client: client)}

  let(:client) {double(:client, messages: messages) }
  let(:messages) { double(:messages) }
  let(:config) do
    {
      account_sid: "AC0dc5de35f3b57841ad55af468655d657",
      auth_token: "6afed1886328e8e6952294535a8aac0a",
      from: "+441445295013",
      to: "+447921723500",
      body: "Thank you! Your order will be delivered before %s"
    }
  end
  it 'delivers an SMS with an estimated time' do
    args = {
        from: config[:from],
        to: config[:to],
        body: "Thank you! Your order will be delivered before 18:52",
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    expect(messages).to receive(:create).with(args)
    sms.deliver
  end

end
