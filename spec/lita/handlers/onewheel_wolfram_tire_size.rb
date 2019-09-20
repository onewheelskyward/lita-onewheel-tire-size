require_relative '../../spec_helper'

describe Lita::Handlers::OnewheelTireSize, :lita_handler => true do
  it { is_expected.to route_command('tire') }
  it { is_expected.to route_command('tiresize') }

  it 'will work' do
    send_command 'tire 245/40R17'
    expect(replies.last).to eq('3.141592653589793238462643383279502884197169399375105820974...')
  end

  it 'will work' do
    send_command 'tire 245 40 R17'
    expect(replies.last).to eq('3.141592653589793238462643383279502884197169399375105820974...')
  end

  it 'will work' do
    send_command 'tire 245 40 17'
    expect(replies.last).to eq('3.141592653589793238462643383279502884197169399375105820974...')
  end

  it 'will work' do
    send_command 'tire 245/40 17'
    expect(replies.last).to eq('3.141592653589793238462643383279502884197169399375105820974...')
  end
end
