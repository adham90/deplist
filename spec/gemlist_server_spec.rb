require 'spec_helper'

describe GemListServer do
  context '#dependencies' do
    let(:packages) { ['nvim-pkg', 'tmux-pkg', 'docker-pkg'] }

    before do
      allow(GemListServer).to receive(:get).with(any_args).and_return(packages)
    end

    it 'should return correct dependencies as array' do
      expect(GemListServer.new(['my_dev_setup']).dependencies).to eq(packages)
    end

    it 'should return only not installed dependencies' do
      allow_any_instance_of(GemListServer).to receive(:pkg_exists?).with(packages[0]).and_return(false)
      allow_any_instance_of(GemListServer).to receive(:pkg_exists?).with(packages[1]).and_return(true)
      allow_any_instance_of(GemListServer).to receive(:pkg_exists?).with(packages[2]).and_return(true)

      expect(GemListServer.new(['my_dev_setup']).dependencies).to eq([packages[0]])
    end
  end
end
