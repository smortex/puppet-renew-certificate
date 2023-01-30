# puppet-renew-certificate

Tool to renew Puppet CA and client certificates.

## Usage

Clone the repository and renew CA and client certificates:

```
user@puppetserver ~ $ git clone https://github.com/smortex/puppet-renew-certificate.git
user@puppetserver ~ $ bundle install
user@puppetserver ~ $ sudo bundle exec exe/puppet-renew-certificate /etc/puppetlabs/puppet/ssl/ca/ca_crt.pem /etc/puppetlabs/puppet/ssl/ca/signed/*.pem
```

After renewal, remove the old certificates from the nodes:
* If you renewed the CA certificate, remove it from each node (an orchestration tool like choria is helpful). Puppet will download it on next run.  If you are paranoid, copy the updated certificate on each remote node: when no CA certificate is installed, puppet cannot verify the identity of the remote node and use a Trust On First Use (TOFU) authentication scheme;
* If you renewed a client certificates, remove that certificate on the node using it.  Puppet will download the updated certificate on the next run.
