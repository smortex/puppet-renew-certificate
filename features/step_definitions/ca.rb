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
