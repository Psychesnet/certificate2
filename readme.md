
* private/public key: private key一般用於加密，public key可以對應的解密。
* CA(Certificate Authority): 頒發certificate的機構。一般的用戶在產生private/public key後，private key自行保留，而public key會送給CA第三方認證單位來加密(ca.key)成certicate發放給大家。
* CSR(Certificate Signing Request): CA接受user要求認證的格式，由user private key對應的public key生成。
* Use Script Step:
  * sh create_rootca.sh
  * sh create_user_key_and_certificate.sh user1
  * sh create_user_key_and_certificate.sh user2
  * ....
  * sh verify_user_certificate_from_ca.sh user1 user2 ...
