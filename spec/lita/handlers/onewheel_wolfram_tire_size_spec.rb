require_relative '../../spec_helper'

describe Lita::Handlers::OnewheelTireSize, :lita_handler => true do
  it { is_expected.to route_command('tire') }
  it { is_expected.to route_command('tiresize') }

  it 'will work' do
    send_command 'tire 245/40R17'
    expect(replies.last).to eq('diameter for 245/40R17 is 24.72 inches')
  end

  it 'will work' do
    send_command 'tire 245 40 R17'
    expect(replies.last).to eq('diameter for 245 40 R17 is 24.72 inches')
  end

  it 'will work' do
    send_command 'tire 245 40 17'
    expect(replies.last).to eq('diameter for 245 40 17 is 24.72 inches')
  end

  it 'will work' do
    send_command 'tire 245/40 17'
    expect(replies.last).to eq('diameter for 245/40 17 is 24.72 inches')
  end
end
