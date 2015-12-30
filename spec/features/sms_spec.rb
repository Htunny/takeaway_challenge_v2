require 'sms'

describe SMS do
  subject(:sms) { described_class.new(config, client: client)}

  let(:client) {double(:client, messages: messages) }
  let(:messages) { double(:messages) }
  let(:config) do
    {
      account_sid: "AC7065cbcdbb0e6ee7c3cc826a5266fae6",
      auth_token: "881c7342ab75ff58ebfe692d8499353f",
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
