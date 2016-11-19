require 'spec_helper'

describe Installer do
  it 'should return success and faild packages' do
    allow(OsDetector).to receive(:current_os).and_return('macosx')
    data = %w(vim nano)

    allow(Installer).to receive(:macosx_install)
      .with(data[0]).and_return(true)

    allow(Installer).to receive(:macosx_install)
      .with(data[1]).and_return(false)

    expect(Installer.install(data)).to eq(success: [data[0]], fail: [data[1]])
  end

  context '#macosx' do
    it 'should install packages if not installed' do
      allow(OsDetector).to receive(:current_os).and_return('macosx')
      data = %w(vim nano)

      allow(Installer).to receive(:macosx_install)
        .with(any_args).and_return(true)

      expect(Installer.install(data)).to eq(success: data, fail: [])
    end
  end

  context '#linux' do
    it 'should install packages if not installed' do
      allow(OsDetector).to receive(:current_os).and_return('linux')
      data = %w(vim nano)

      allow(Installer).to receive(:linux_install)
        .with(any_args).and_return(true)

      expect(Installer.install(data)).to eq(success: data, fail: [])
    end
  end
end
