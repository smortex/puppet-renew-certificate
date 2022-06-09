# frozen_string_literal: true

require 'fileutils'
require 'tmpdir'

Then('the CA should be valid') do
  ca = 'ssldir/ca/ca_crt.pem'
  step("I successfully run `openssl verify -CAfile #{ca} #{ca}`")
  step("the stdout should contain '#{ca}: OK'")
end

Then('the serial should be {int}') do |value|
  step(%(the file "ssldir/ca/serial" should contain "#{value}"))
end

Then('the CA should be valid for {string}') do |domain|
  in_current_directory do
    ca = 'ssldir/ca/ca_crt.pem'

    cert = OpenSSL::X509::Certificate.new(File.read(ca))
    extension = cert.extensions.select { |ext| ext.oid == 'subjectAltName' }.first
    domains = extension.value.split(', ').map { |dom| dom.sub(/^DNS:/, '') }

    expect(domains).to include(domain)
  end
end
