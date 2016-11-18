require "spec_helper"

describe GemListServer do
  it "should return correct dependencies as array" do
    data = ['nvim', 'tmux', 'docker']
    allow(GemListServer).to receive(:get).with(any_args).and_return(data)

    expect(GemListServer.new(['my_dev_setup']).get_dependencies).to eq(data)
  end
end
