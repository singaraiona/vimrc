" racoon config syntax file
" Maintainer:	Peter Sagerson <psagers at ignorare dot net>
" Version:      0.1
" Last Change:	June 4, 2013


"
" Basics
"

syntax match racComment "^\s*#.*"
syntax match racNumber "\v<(0x)?\d+>"
syntax region racString start=/"/ skip=/\\"/ end=/"/
syntax keyword racTimeUnit contained sec secs second seconds min mins minute minutes hour hours

" Naive IP address matching
syntax case ignore
syntax match racIPv4 "\v<\d{1,3}(\.\d{1,3}){3}>"
syntax match racIPv6 "\v[0-9a-f]{,4}(:[0-9a-f]{,4})+"
syntax case match

" Elements that can appear pretty much anywhere.
syntax cluster racUniversal contains=racComment,racNumber,racString,racIPv4,racIPv6,racTimeUnit


"
" Directives
"

syntax match racConfig containedin=TOP "\v^(gss_id_enc|pfkey_buffer|complex_bundle)>"
syntax match racDirective containedin=TOP "\v^(privsep|include|timer|listen|remote|log|padding|mode_cfg|ldapcfg|radiuscfg)>"
syntax keyword racDirective containedin=TOP inherit
syntax match racDirective containedin=TOP contains=racPathType "\v^path(\s+\k+)?"he=s+4
syntax keyword racPathType contained include pre_shared_key certificate backupsa script pidfile
syntax match racDirective containedin=TOP contains=racSainfoKeywords,@racTopLevel "\v^sainfo>[^{]*"he=s+6
syntax keyword racSainfoKeywords contained from group

syntax region racStatements contains=@racTopLevel,racStatement matchgroup=Special start="{" end="}"

syntax cluster racTopLevel contains=@racUniversal,racStatements,racConst


"
" Statements
"

" privsep
syntax keyword racStatement contained user group chroot

" timer
syntax keyword racStatement contained counter interval persend phase1 phase2 natt_keepalive

" listen
syntax keyword racStatement contained isakmp isakmp_natt strict_adress adminsock

" remote
syntax match racStatement contained "\vdoi(\s+ipsec_doi)?"
syntax match racStatement contained "\vsituation(\s+identity_only)?"
syntax match racStatement contained "\vlifetime(\s+time)?"
syntax keyword racStatement contained remote_address exchange_mode
            \ xauth_login verify_identifier mode_cfg weak_phase1_check
            \ send_cert send_cr match_empty_cr verify_cert  ike_frag esp_frag
            \ initial_contact passive proposal_check support_proxy
            \ generate_policy nat_traversal dpd_delay dpd_retry dpd_maxfail
            \ rekey nonce_size  ph1id proposal encryption_algorithm
            \ hash_algorithm authentication_method dh_group gss_id
syntax match racStatement contained contains=racIdType "\vmy_identifier(\s+\k+)?"he=s+13
syntax match racStatement contained contains=racIdType "\vpeers_identifier(\s+\k+)?"he=s+16
syntax match racIdType contained "\v(address|user_fqdn|fqdn|keyid(\s+(file|tag))?|asn1dn)>"
syntax match racStatement contained contains=racCertSpec "\vcertificate_type(\s+\k+)?"he=s+16
syntax keyword racCertSpec contained x509 plain_rsa
syntax match racStatement contained contains=racCaSpec "\vca_type(\s+\k+)?"he=s+7
syntax keyword racCaSpec contained x509
syntax match racStatement contained contains=racPeersCertType,racString "\vpeers_certfile.*"he=s+14
syntax keyword racPeersCertType contained dnssec plain_rsa
syntax match racStatement contained contains=racScriptType,racString "\vscript.*"he=s+6
syntax keyword racScriptType contained phase1_up phase1_down phase1_dead

" sainfo
syntax keyword racStatement contained pfs_group remoteid encryption_algorithm
            \ authentication_algorithm compression_algorithm

" padding
syntax keyword racStatement contained randomize randomize_length maximum_length
            \ exclusive_tail strict_check

" mode_cfg
syntax keyword racStatement contained auth_source auth_groups group_source
            \ conf_source accounting pool_size network4 netmask4 dns4 wins4
            \ default_domain split_dns banner auth_throttle pfs_group
            \ save_passwd
syntax match racStatement contained contains=racSplitType "\vsplit_network(\s+\k+)?"he=s+13
syntax keyword racSplitType contained include local_lan

" ldapcfg
syntax keyword racStatement contained version host port base subtree bind_dn
            \ bind_pw attr_user attr_addr attr_mask attr_group attr_member

" radiuscfg
syntax keyword racStatement contained auth account timeout retries


"
" Constants
"

syntax keyword racConst anonymous clientaddr

syntax keyword racConst contained main aggressive base
syntax keyword racConst contained utf-16le latin1
syntax keyword racConst contained ipsec_doi identity_only
syntax keyword racConst contained on off force require unique disabled
syntax keyword racConst contained obey strict claim exact
syntax keyword racConst contained des 3des des_iv64 des_iv32 rc5 rc4 idea 3idea blowfish cast128 aes camilla null_enc twofish rijndael
syntax keyword racConst contained md5 sha1 sha256 sha384 sha512 hmac_md5 hmac_sha1 hmac_sha256 hmac_sha384 hmac_sha512 non_auth
syntax keyword racConst contained deflate
syntax keyword racConst contained pre_shared_key rsasig gssapi_krb hybrid_rsa_server hybrid_rsa_client xauth_rsa_server xauth_rsa_client xauth_psk_server xauth_psk_client
syntax keyword racConst contained modp768 modp1024 modp1536 modp2048 modp3072 modp4096 modp6144 modp8192
syntax keyword racConst contained error warning notify info debug debug2
syntax keyword racConst contained none local system radius pam ldap


" Define the default highlighting.
command -nargs=+ HiLink hi def link <args>

HiLink racComment      Comment
HiLink racNumber       Number
HiLink racString       String
HiLink racIPv4         Constant
HiLink racIPv6         Constant
HiLink racNetmask      Constant
HiLink racTimeUnit     Type
HiLink racConfig       Statement
HiLink racDirective    Statement
HiLink racSainfoKeywords Keyword

HiLink racPathType     Type
HiLink racIdType       Type
HiLink racCertSpec     Type
HiLink racCaSpec       Type
HiLink racPeersCertType Type
HiLink racScriptType   Type
HiLink racSplitType    Type

HiLink racConst        Constant
HiLink racStatement    Keyword

delcommand HiLink
