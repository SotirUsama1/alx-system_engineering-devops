# Ensure stdlib module is installed
# You can add this in your Puppetfile if using r10k or directly install the module using the following command:
# puppet module install puppetlabs-stdlib

file_line { 'SSH Private Key':
  path               => '/etc/ssh/ssh_config',
  line               => '    IdentityFile ~/.ssh/school',
  match              => '^#?\s*IdentityFile\s+~/.ssh/id_rsa$',
  replace            => true,
  append_on_no_match => true,
}

# Regex match explanation
#
# ^       beginning of the line
# #?      optional hash character
# \s*     zero or more white space characters
# IdentityFile case insensitive "IdentityFile" (no need for (?i) as it's case sensitive by default)
# \s+     at least one whitespace character
# ~/.ssh/id_rsa The ssh private key file path we want to replace
# $       end of the line

file_line { 'Deny Password Auth':
  path               => '/etc/ssh/ssh_config',
  line               => '    PasswordAuthentication no',
  match              => '^#?\s*PasswordAuthentication\s+(yes|no)$',
  replace            => true,
  append_on_no_match => true,
}

# Regex match explanation
#
# ^       beginning of the line
# #?      optional hash character
# \s*     zero or more white space characters
# PasswordAuthentication case insensitive "PasswordAuthentication" (no need for (?i) as it's case sensitive by default)
# \s+     at least one whitespace character
# (yes|no) with the value "yes" or the value "no"
# $       end of the line

