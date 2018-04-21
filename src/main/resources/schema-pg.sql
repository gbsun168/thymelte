/*
Navicat PGSQL Data Transfer

Source Server         : local
Source Server Version : 90501
Source Host           : localhost:5432
Source Database       : thymelte
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90501
File Encoding         : 65001

Date: 2018-04-22 03:06:35
*/


-- ----------------------------
-- Sequence structure for log_login_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."log_login_id_seq1";
CREATE SEQUENCE "public"."log_login_id_seq1"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 92
 CACHE 1;
SELECT setval('"public"."log_login_id_seq1"', 92, true);

-- ----------------------------
-- Sequence structure for qr_code_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."qr_code_id_seq";
CREATE SEQUENCE "public"."qr_code_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 151
 CACHE 1;
SELECT setval('"public"."qr_code_id_seq"', 151, true);

-- ----------------------------
-- Sequence structure for user_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_info_id_seq";
CREATE SEQUENCE "public"."user_info_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;
SELECT setval('"public"."user_info_id_seq"', 5, true);

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 13
 CACHE 1;
SELECT setval('"public"."users_id_seq"', 13, true);

-- ----------------------------
-- Sequence structure for veri_code_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."veri_code_id_seq";
CREATE SEQUENCE "public"."veri_code_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."veri_code_id_seq"', 1, true);

-- ----------------------------
-- Table structure for authorities
-- ----------------------------
DROP TABLE IF EXISTS "public"."authorities";
CREATE TABLE "public"."authorities" (
"username" varchar(50) COLLATE "default" NOT NULL,
"authority" varchar(50) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO "public"."authorities" VALUES ('jeesun', 'ROLE_ADMIN');
INSERT INTO "public"."authorities" VALUES ('jeesun', 'ROLE_USER');
INSERT INTO "public"."authorities" VALUES ('user2711', 'ROLE_USER');
INSERT INTO "public"."authorities" VALUES ('user6745', 'ROLE_USER');
INSERT INTO "public"."authorities" VALUES ('user8102', 'ROLE_USER');

-- ----------------------------
-- Table structure for log_login
-- ----------------------------
DROP TABLE IF EXISTS "public"."log_login";
CREATE TABLE "public"."log_login" (
"id" int8 DEFAULT nextval('log_login_id_seq1'::regclass) NOT NULL,
"create_time" timestamp(6),
"ip" varchar(255) COLLATE "default",
"username" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of log_login
-- ----------------------------
INSERT INTO "public"."log_login" VALUES ('1', '2018-04-02 14:33:31.654', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('2', '2018-04-02 14:36:07.92', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('3', '2018-04-02 14:37:23.698', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('4', '2018-04-02 14:41:57.799', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('5', '2018-04-02 14:45:50.411', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('6', '2018-04-03 15:42:50.615', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('7', '2018-04-03 15:43:45.005', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('8', '2018-04-03 15:45:59.675', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('9', '2018-04-03 15:48:17.857', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('10', '2018-04-03 15:50:38.943', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('11', '2018-04-03 16:01:41.01', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('12', '2018-04-03 16:09:24.812', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('13', '2018-04-03 23:00:42.191', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('14', '2018-04-03 23:10:59.478', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('15', '2018-04-03 23:17:23.516', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('16', '2018-04-03 23:18:39.402', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('17', '2018-04-03 23:21:03.175', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('18', '2018-04-03 23:23:32.71', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('19', '2018-04-03 23:25:28.853', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('20', '2018-04-03 23:25:51.084', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('21', '2018-04-03 23:27:45.918', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('22', '2018-04-03 23:30:20.057', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('23', '2018-04-03 23:31:26.018', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('24', '2018-04-03 23:31:38.631', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('25', '2018-04-03 23:34:54.222', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('26', '2018-04-03 23:35:56.486', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('27', '2018-04-03 23:36:26.419', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('28', '2018-04-03 23:37:55.481', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('29', '2018-04-03 23:40:09.473', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('30', '2018-04-03 23:40:28.277', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('31', '2018-04-03 23:45:08.387', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('32', '2018-04-03 23:45:32.442', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('33', '2018-04-03 23:46:21.298', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('34', '2018-04-03 23:46:34.764', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('35', '2018-04-03 23:47:51.367', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('36', '2018-04-03 23:48:05.688', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('37', '2018-04-03 23:48:25.693', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('38', '2018-04-03 23:50:15.862', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('39', '2018-04-03 23:50:41.418', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('40', '2018-04-03 23:54:35.899', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('41', '2018-04-03 23:55:07.769', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('42', '2018-04-03 23:56:55.808', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('43', '2018-04-04 00:01:39.353', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('44', '2018-04-04 00:01:56.559', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('45', '2018-04-04 00:02:13.981', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('46', '2018-04-04 00:02:39.371', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('47', '2018-04-04 00:04:02.403', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('48', '2018-04-04 00:04:53.032', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('49', '2018-04-04 00:06:48.871', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('50', '2018-04-04 00:07:21.927', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('51', '2018-04-04 00:11:06.351', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('52', '2018-04-04 00:11:37.857', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('53', '2018-04-04 00:16:22.386', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('54', '2018-04-04 00:19:05.446', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('55', '2018-04-04 00:19:23.878', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('56', '2018-04-04 00:21:09.805', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('57', '2018-04-04 00:21:23.772', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('58', '2018-04-04 00:23:48.189', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('59', '2018-04-04 00:24:10.967', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('60', '2018-04-04 00:27:36.009', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('61', '2018-04-04 00:27:54.495', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('62', '2018-04-04 00:33:03.68', '192.168.200.1', '15506297546');
INSERT INTO "public"."log_login" VALUES ('63', '2018-04-04 00:33:17.074', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('64', '2018-04-04 00:33:34.439', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('65', '2018-04-04 00:34:05.763', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('66', '2018-04-04 00:43:57.54', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('67', '2018-04-04 00:44:08.626', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('68', '2018-04-04 00:57:24.208', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('69', '2018-04-04 00:57:38.207', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('70', '2018-04-04 00:58:09.191', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('71', '2018-04-04 01:05:04.734', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('72', '2018-04-04 01:05:35.612', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('73', '2018-04-04 01:05:53.892', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('74', '2018-04-04 09:32:05.389', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('75', '2018-04-04 10:09:57.277', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('76', '2018-04-04 10:15:30.645', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('77', '2018-04-04 10:15:52.85', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('78', '2018-04-04 11:22:33.08', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('79', '2018-04-04 11:31:10.73', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('80', '2018-04-04 12:02:24.193', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('81', '2018-04-04 12:18:02.914', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('82', '2018-04-04 12:36:44.953', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('83', '2018-04-04 12:46:49.079', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('84', '2018-04-04 13:31:23.386', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('85', '2018-04-04 15:16:13.68', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('86', '2018-04-16 11:24:02.728', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('87', '2018-04-16 17:31:18.951', '192.168.200.1', '18860902711');
INSERT INTO "public"."log_login" VALUES ('88', '2018-04-16 17:51:54.052', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('89', '2018-04-16 17:53:06.267', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('90', '2018-04-16 18:03:35.79', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('91', '2018-04-20 17:02:33.613', '192.168.200.1', 'jeesun');
INSERT INTO "public"."log_login" VALUES ('92', '2018-04-22 03:02:18.508', '192.168.200.1', 'jeesun');

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_access_token";
CREATE TABLE "public"."oauth_access_token" (
"token_id" varchar(255) COLLATE "default",
"token" bytea,
"authentication_id" varchar(255) COLLATE "default" NOT NULL,
"user_name" varchar(255) COLLATE "default",
"client_id" varchar(255) COLLATE "default",
"authentication" bytea,
"refresh_token" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------
INSERT INTO "public"."oauth_access_token" VALUES ('0f2691182f1af0a7f68b36f2b6e5ceb1', E'\\254\\355\\000\\005sr\\000Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken\\014\\262\\2366\\033$\\372\\316\\002\\000\\006L\\000\\025additionalInformationt\\000\\017Ljava/util/Map;L\\000\\012expirationt\\000\\020Ljava/util/Date;L\\000\\014refreshTokent\\000?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\\000\\005scopet\\000\\017Ljava/util/Set;L\\000\\011tokenTypet\\000\\022Ljava/lang/String;L\\000\\005valueq\\000~\\000\\005xpsr\\000\\036java.util.Collections$EmptyMapY6\\024\\205Z\\334\\347\\320\\002\\000\\000xpsr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001b\\336\\250\\271\\246xsr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationq\\000~\\000\\002xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valueq\\000~\\000\\005xpt\\000$df152f6b-9afe-4daa-832c-dd2ae0b11772sq\\000~\\000\\011w\\010\\000\\000\\001d\\016\\220eKxsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001ct\\000\\026Ljava/util/Collection;xpsr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustxt\\000\\006bearert\\000$695f681c-c361-4d2f-8040-42ab5511a01d', '05443d1bf4a3b29a2ce751cce9170bbc', 'jeesun', 'clientIdPassword', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\000w\\004\\000\\000\\000\\000xq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUrit\\000\\022Ljava/lang/String;L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\021xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\017L\\000\\021requestParametersq\\000~\\000\\016L\\000\\005scopeq\\000~\\000\\021xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\016xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\003w\\010\\000\\000\\000\\004\\000\\000\\000\\002t\\000\\012grant_typet\\000\\010passwordt\\000\\010usernamet\\000\\006jeesunxsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000 w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\001L\\000\\004roleq\\000~\\000\\017xpt\\000\\011ROLE_USERsq\\000~\\000&t\\000\\012ROLE_ADMINxsq\\000~\\000\\027?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xpsr\\0009org.springframework.security.oauth2.provider.TokenRequest\\326*\\204\\270\\3178\\370\\001\\002\\000\\001L\\000\\011grantTypeq\\000~\\000\\017xq\\000~\\000\\022t\\000\\020clientIdPasswordsq\\000~\\000\\025sq\\000~\\000\\027?@\\000\\000\\000\\000\\000\\003w\\010\\000\\000\\000\\004\\000\\000\\000\\002t\\000\\012grant_typet\\000\\015refresh_tokent\\000\\015refresh_tokent\\000$df152f6b-9afe-4daa-832c-dd2ae0b11772xsq\\000~\\000\\035sq\\000~\\000\\037w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xq\\000~\\0002sq\\000~\\000 w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000 w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000[org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sr\\000\\037java.util.Collections$EmptyListz\\270\\027\\264<\\247\\236\\336\\002\\000\\000xppt\\000\\000sr\\000\\025com.simon.domain.Userfi\\004,\\024\\216\\246\\325\\002\\000\\003Z\\000\\007enabledL\\000\\010passwordq\\000~\\000\\017L\\000\\010usernameq\\000~\\000\\017xp\\001pt\\000\\006jeesun', 'd0967223da6527d22cdc34020fc4cec1');
INSERT INTO "public"."oauth_access_token" VALUES ('9470c0cef474145a73515bc80093c535', E'\\254\\355\\000\\005sr\\000Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken\\014\\262\\2366\\033$\\372\\316\\002\\000\\006L\\000\\025additionalInformationt\\000\\017Ljava/util/Map;L\\000\\012expirationt\\000\\020Ljava/util/Date;L\\000\\014refreshTokent\\000?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\\000\\005scopet\\000\\017Ljava/util/Set;L\\000\\011tokenTypet\\000\\022Ljava/lang/String;L\\000\\005valueq\\000~\\000\\005xpsr\\000\\036java.util.Collections$EmptyMapY6\\024\\205Z\\334\\347\\320\\002\\000\\000xpsr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001[\\376m\\311zxsr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationq\\000~\\000\\002xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valueq\\000~\\000\\005xpt\\000$06e42e63-4280-486a-ad3e-39225680e7c6sq\\000~\\000\\011w\\010\\000\\000\\001]2\\375|zxsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001ct\\000\\026Ljava/util/Collection;xpsr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustxt\\000\\006bearert\\000$cda3ffc2-0c5b-4384-88bb-3b0317b576bd', '2417ee4cdd9c4cca7846cb9382971863', '18051614065', 'clientIdPassword', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\011ROLE_USERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002t\\000\\012grant_typet\\000\\010passwordt\\000\\010usernamet\\000\\01318051614065xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0004sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002q\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000 sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\01318051614065', 'fd9793c7420f9bfba10412d4febe3186');
INSERT INTO "public"."oauth_access_token" VALUES ('06f0a47d68c11448a240066d420fc309', E'\\254\\355\\000\\005sr\\000Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken\\014\\262\\2366\\033$\\372\\316\\002\\000\\006L\\000\\025additionalInformationt\\000\\017Ljava/util/Map;L\\000\\012expirationt\\000\\020Ljava/util/Date;L\\000\\014refreshTokent\\000?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\\000\\005scopet\\000\\017Ljava/util/Set;L\\000\\011tokenTypet\\000\\022Ljava/lang/String;L\\000\\005valueq\\000~\\000\\005xpsr\\000\\036java.util.Collections$EmptyMapY6\\024\\205Z\\334\\347\\320\\002\\000\\000xpsr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001\\\\/\\023\\241\\232xsr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationq\\000~\\000\\002xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valueq\\000~\\000\\005xpt\\000$e51f9626-a4e7-42ed-a575-6cf62f316ed3sq\\000~\\000\\011w\\010\\000\\000\\001]?\\275\\320\\331xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001ct\\000\\026Ljava/util/Collection;xpsr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\004?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustxt\\000\\006bearert\\000$79d0fc0d-8cc0-46c3-947a-c0a505b2ab15', '32c3ddf300e76e36ff2075109cceed02', '18860902711', 'clientIdPassword', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\012ROLE_ADMINxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002t\\000\\012grant_typet\\000\\010passwordt\\000\\010usernamet\\000\\01318860902711xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0004sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002q\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000 sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\01318860902711', 'be360393983dee1d3355ed393ed34f25');
INSERT INTO "public"."oauth_access_token" VALUES ('742148de36224f0637331af3ba67c59d', E'\\254\\355\\000\\005sr\\000Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken\\014\\262\\2366\\033$\\372\\316\\002\\000\\006L\\000\\025additionalInformationt\\000\\017Ljava/util/Map;L\\000\\012expirationt\\000\\020Ljava/util/Date;L\\000\\014refreshTokent\\000?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\\000\\005scopet\\000\\017Ljava/util/Set;L\\000\\011tokenTypet\\000\\022Ljava/lang/String;L\\000\\005valueq\\000~\\000\\005xpsr\\000\\036java.util.Collections$EmptyMapY6\\024\\205Z\\334\\347\\320\\002\\000\\000xpsr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001b\\336\\270\\037,xsr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationq\\000~\\000\\002xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valueq\\000~\\000\\005xpt\\000$29921cea-4a09-4ed3-b896-b7d1a6a53461sq\\000~\\000\\011w\\010\\000\\000\\001d\\023G\\322+xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001ct\\000\\026Ljava/util/Collection;xpsr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustxt\\000\\006bearert\\000$d512cb9f-fdc6-439c-a4b5-0ec8c77ecdd5', 'e58b1a963ae8d7e8b25784970ab997de', 'user6745', 'clientIdPassword', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\011ROLE_USERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\003t\\000\\012grant_typet\\000\\010passwordt\\000\\011client_idt\\000\\020clientIdPasswordt\\000\\010usernamet\\000\\010user6745xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0006sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\004t\\000\\015client_secrett\\000\\006secretq\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037q\\000~\\000 q\\000~\\000!x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000"sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\010user6745', '9f537dfc14357ef2c06943b304980114');
INSERT INTO "public"."oauth_access_token" VALUES ('4f78a369bc090ef3f6ecd0bb8f834066', E'\\254\\355\\000\\005sr\\000Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken\\014\\262\\2366\\033$\\372\\316\\002\\000\\006L\\000\\025additionalInformationt\\000\\017Ljava/util/Map;L\\000\\012expirationt\\000\\020Ljava/util/Date;L\\000\\014refreshTokent\\000?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\\000\\005scopet\\000\\017Ljava/util/Set;L\\000\\011tokenTypet\\000\\022Ljava/lang/String;L\\000\\005valueq\\000~\\000\\005xpsr\\000\\036java.util.Collections$EmptyMapY6\\024\\205Z\\334\\347\\320\\002\\000\\000xpsr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001[\\376r\\024\\342xsr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationq\\000~\\000\\002xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valueq\\000~\\000\\005xpt\\000$c9f933b9-0a9d-4ce1-8ec6-2756cf4f6242sq\\000~\\000\\011w\\010\\000\\000\\001]"s\\253Jxsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001ct\\000\\026Ljava/util/Collection;xpsr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\004?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustxt\\000\\006bearert\\000$465c5860-c317-4528-804c-5c16cae4ddde', 'e6bf9a3ae33236b55570ed289b89232b', '15506297546', 'clientIdPassword', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\011ROLE_USERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002t\\000\\012grant_typet\\000\\010passwordt\\000\\010usernamet\\000\\01315506297546xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0004sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002q\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000 sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\01315506297546', 'e5e4bf86581785f28562c3838276567a');
INSERT INTO "public"."oauth_access_token" VALUES ('7d70608dc6b23526081f747497c7d05d', E'\\254\\355\\000\\005sr\\000Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken\\014\\262\\2366\\033$\\372\\316\\002\\000\\006L\\000\\025additionalInformationt\\000\\017Ljava/util/Map;L\\000\\012expirationt\\000\\020Ljava/util/Date;L\\000\\014refreshTokent\\000?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\\000\\005scopet\\000\\017Ljava/util/Set;L\\000\\011tokenTypet\\000\\022Ljava/lang/String;L\\000\\005valueq\\000~\\000\\005xpsr\\000\\036java.util.Collections$EmptyMapY6\\024\\205Z\\334\\347\\320\\002\\000\\000xpsr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001b\\342<\\345Qxsr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationq\\000~\\000\\002xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valueq\\000~\\000\\005xpt\\000$f937c50f-58d0-4c1f-a8ca-cde59953d310sq\\000~\\000\\011w\\010\\000\\000\\001d\\022\\252\\033\\025xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001ct\\000\\026Ljava/util/Collection;xpsr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\004?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustxt\\000\\006bearert\\000$e35aaada-a61d-4c89-bd82-04ea382408bd', 'fd838fccd3a1ca061514f32930eec3c4', 'user2711', 'clientIdPassword', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\011ROLE_USERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\003t\\000\\012grant_typet\\000\\010passwordt\\000\\011client_idt\\000\\020clientIdPasswordt\\000\\010usernamet\\000\\010user2711xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0006sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\004t\\000\\015client_secrett\\000\\006secretq\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037q\\000~\\000 q\\000~\\000!x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000"sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\010user2711', '8f237ff6dfa22de1602fb3b36bcf2d06');

-- ----------------------------
-- Table structure for oauth_approvals
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_approvals";
CREATE TABLE "public"."oauth_approvals" (
"userid" varchar(255) COLLATE "default",
"clientid" varchar(255) COLLATE "default",
"scope" varchar(255) COLLATE "default",
"status" varchar(10) COLLATE "default",
"expiresat" timestamp(6),
"lastmodifiedat" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of oauth_approvals
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_client_details";
CREATE TABLE "public"."oauth_client_details" (
"client_id" varchar(255) COLLATE "default" NOT NULL,
"resource_ids" varchar(255) COLLATE "default",
"client_secret" varchar(255) COLLATE "default",
"scope" varchar(255) COLLATE "default",
"authorized_grant_types" varchar(255) COLLATE "default",
"web_server_redirect_uri" varchar(255) COLLATE "default",
"authorities" varchar(255) COLLATE "default",
"access_token_validity" int4,
"refresh_token_validity" int4,
"additional_information" varchar(4096) COLLATE "default",
"autoapprove" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO "public"."oauth_client_details" VALUES ('clientIdPassword', 'oauth2-resource', 'secret', 'read,write,trust', 'password,authorization_code,refresh_token', null, 'ROLE_ADMIN,ROLE_USER', '7200', '5184000', null, null);

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_client_token";
CREATE TABLE "public"."oauth_client_token" (
"token_id" varchar(255) COLLATE "default",
"token" bytea,
"authentication_id" varchar(255) COLLATE "default" NOT NULL,
"user_name" varchar(255) COLLATE "default",
"client_id" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of oauth_client_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_code";
CREATE TABLE "public"."oauth_code" (
"code" varchar(255) COLLATE "default",
"authentication" bytea
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of oauth_code
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_refresh_token";
CREATE TABLE "public"."oauth_refresh_token" (
"token_id" varchar(255) COLLATE "default",
"token" bytea,
"authentication" bytea
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of oauth_refresh_token
-- ----------------------------
INSERT INTO "public"."oauth_refresh_token" VALUES ('350a315835fab8e9b1ac52299206c4c0', E'\\254\\355\\000\\005sr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationt\\000\\020Ljava/util/Date;xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valuet\\000\\022Ljava/lang/String;xpt\\000$9dbbfe91-04d6-490b-831e-0c377593b63bsr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001\\\\\\351\\375p\\324x', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\012ROLE_ADMINxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002t\\000\\012grant_typet\\000\\010passwordt\\000\\010usernamet\\000\\01318860902711xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0004sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002q\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000 sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\01318860902711');
INSERT INTO "public"."oauth_refresh_token" VALUES ('5b00ffdc7727aa0d65b6272e0748ee66', E'\\254\\355\\000\\005sr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationt\\000\\020Ljava/util/Date;xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valuet\\000\\022Ljava/lang/String;xpt\\000$f40d730e-54cb-4ff0-88f6-f3d1dd0fafb8sr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001]2\\332\\370\\260x', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\012ROLE_ADMINxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002t\\000\\012grant_typet\\000\\010passwordt\\000\\010usernamet\\000\\01318860902711xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0004sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002q\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000 sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\01318860902711');
INSERT INTO "public"."oauth_refresh_token" VALUES ('5d0e87b5f5e21570f5fadb97aa6a97c1', E'\\254\\355\\000\\005sr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationt\\000\\020Ljava/util/Date;xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valuet\\000\\022Ljava/lang/String;xpt\\000$f6524ffe-0da7-4f64-99c5-9641c3668292sr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001\\\\\\325\\025\\314\\017x', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\011ROLE_USERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\003t\\000\\012grant_typet\\000\\010passwordt\\000\\011client_idt\\000\\020clientIdPasswordt\\000\\010usernamet\\000\\01318860902711xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0006sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\004q\\000~\\000\\034q\\000~\\000\\035t\\000\\015client_secrett\\000\\006secretq\\000~\\000\\036q\\000~\\000\\037q\\000~\\000 q\\000~\\000!x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000"sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\01318860902711');
INSERT INTO "public"."oauth_refresh_token" VALUES ('7f9e1283789f47cec861aa10e48ee268', E'\\254\\355\\000\\005sr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationt\\000\\020Ljava/util/Date;xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valuet\\000\\022Ljava/lang/String;xpt\\000$df14404b-b747-4e16-8d8c-3c257b650e63sr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001\\\\\\325U\\011\\271x', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\011ROLE_USERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002t\\000\\012grant_typet\\000\\010passwordt\\000\\010usernamet\\000\\01318860902711xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0004sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002q\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000 sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\01318860902711');
INSERT INTO "public"."oauth_refresh_token" VALUES ('8f237ff6dfa22de1602fb3b36bcf2d06', E'\\254\\355\\000\\005sr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationt\\000\\020Ljava/util/Date;xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valuet\\000\\022Ljava/lang/String;xpt\\000$f937c50f-58d0-4c1f-a8ca-cde59953d310sr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001d\\022\\252\\033\\025x', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\011ROLE_USERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\003t\\000\\012grant_typet\\000\\010passwordt\\000\\011client_idt\\000\\020clientIdPasswordt\\000\\010usernamet\\000\\010user2711xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0006sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\004t\\000\\015client_secrett\\000\\006secretq\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037q\\000~\\000 q\\000~\\000!x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000"sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\010user2711');
INSERT INTO "public"."oauth_refresh_token" VALUES ('9f537dfc14357ef2c06943b304980114', E'\\254\\355\\000\\005sr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationt\\000\\020Ljava/util/Date;xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valuet\\000\\022Ljava/lang/String;xpt\\000$29921cea-4a09-4ed3-b896-b7d1a6a53461sr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001d\\023G\\322+x', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\011ROLE_USERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\003t\\000\\012grant_typet\\000\\010passwordt\\000\\011client_idt\\000\\020clientIdPasswordt\\000\\010usernamet\\000\\010user6745xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0006sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\004t\\000\\015client_secrett\\000\\006secretq\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037q\\000~\\000 q\\000~\\000!x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000"sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\010user6745');
INSERT INTO "public"."oauth_refresh_token" VALUES ('b494b86891f7cc05875c2a0f5cc25ef3', E'\\254\\355\\000\\005sr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationt\\000\\020Ljava/util/Date;xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valuet\\000\\022Ljava/lang/String;xpt\\000$79338181-3fb2-451b-9e98-bc7aa7c977b0sr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001]:\\257&:x', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\012ROLE_ADMINxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002t\\000\\012grant_typet\\000\\010passwordt\\000\\010usernamet\\000\\01318860902711xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0004sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002q\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000 sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\01318860902711');
INSERT INTO "public"."oauth_refresh_token" VALUES ('be360393983dee1d3355ed393ed34f25', E'\\254\\355\\000\\005sr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationt\\000\\020Ljava/util/Date;xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valuet\\000\\022Ljava/lang/String;xpt\\000$e51f9626-a4e7-42ed-a575-6cf62f316ed3sr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001]?\\275\\320\\331x', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\012ROLE_ADMINxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002t\\000\\012grant_typet\\000\\010passwordt\\000\\010usernamet\\000\\01318860902711xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0004sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002q\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000 sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\01318860902711');
INSERT INTO "public"."oauth_refresh_token" VALUES ('d0967223da6527d22cdc34020fc4cec1', E'\\254\\355\\000\\005sr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationt\\000\\020Ljava/util/Date;xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valuet\\000\\022Ljava/lang/String;xpt\\000$df152f6b-9afe-4daa-832c-dd2ae0b11772sr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001d\\016\\220eKx', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\002w\\004\\000\\000\\000\\002sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\012ROLE_ADMINsq\\000~\\000\\015t\\000\\011ROLE_USERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\026xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\024L\\000\\005scopeq\\000~\\000\\026xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\024xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\003w\\010\\000\\000\\000\\004\\000\\000\\000\\002t\\000\\012grant_typet\\000\\010passwordt\\000\\010usernamet\\000\\006jeesunxsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\034?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000%w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\002w\\004\\000\\000\\000\\002q\\000~\\000\\017q\\000~\\000\\021xq\\000~\\0006sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\034?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002q\\000~\\000\\036q\\000~\\000\\037q\\000~\\000 q\\000~\\000!x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\026L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000"sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\244\\002\\000\\000xpw\\004\\000\\000\\000\\002q\\000~\\000\\017q\\000~\\000\\021xpt\\000\\006jeesun');
INSERT INTO "public"."oauth_refresh_token" VALUES ('e5e4bf86581785f28562c3838276567a', E'\\254\\355\\000\\005sr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationt\\000\\020Ljava/util/Date;xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valuet\\000\\022Ljava/lang/String;xpt\\000$c9f933b9-0a9d-4ce1-8ec6-2756cf4f6242sr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001]"s\\253Jx', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\011ROLE_USERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002t\\000\\012grant_typet\\000\\010passwordt\\000\\010usernamet\\000\\01315506297546xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0004sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002q\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000 sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\01315506297546');
INSERT INTO "public"."oauth_refresh_token" VALUES ('fd9793c7420f9bfba10412d4febe3186', E'\\254\\355\\000\\005sr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationt\\000\\020Ljava/util/Date;xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valuet\\000\\022Ljava/lang/String;xpt\\000$06e42e63-4280-486a-ad3e-39225680e7c6sr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001]2\\375|zx', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\001w\\004\\000\\000\\000\\001sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\011ROLE_USERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000\\024xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000\\022L\\000\\005scopeq\\000~\\000\\024xpt\\000\\020clientIdPasswordsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000\\022xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002t\\000\\012grant_typet\\000\\010passwordt\\000\\010usernamet\\000\\01318051614065xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\003t\\000\\004readt\\000\\005writet\\000\\005trustx\\001sq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002sq\\000~\\000\\015t\\000\\011ROLE_USERsq\\000~\\000\\015t\\000\\012ROLE_ADMINxsq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\017oauth2-resourcexsq\\000~\\000#w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\001w\\004\\000\\000\\000\\001q\\000~\\000\\017xq\\000~\\0004sr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000\\032?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\002q\\000~\\000\\034q\\000~\\000\\035q\\000~\\000\\036q\\000~\\000\\037x\\000psr\\0002org.springframework.security.core.userdetails.User\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\007Z\\000\\021accountNonExpiredZ\\000\\020accountNonLockedZ\\000\\025credentialsNonExpiredZ\\000\\007enabledL\\000\\013authoritiesq\\000~\\000\\024L\\000\\010passwordq\\000~\\000\\016L\\000\\010usernameq\\000~\\000\\016xp\\001\\001\\001\\001sq\\000~\\000 sr\\000\\021java.util.TreeSet\\335\\230P\\223\\225\\355\\207[\\003\\000\\000xpsr\\000Forg.springframework.security.core.userdetails.User$AuthorityComparator\\000\\000\\000\\000\\000\\000\\001\\232\\002\\000\\000xpw\\004\\000\\000\\000\\001q\\000~\\000\\017xpt\\000\\01318051614065');

-- ----------------------------
-- Table structure for qr_code
-- ----------------------------
DROP TABLE IF EXISTS "public"."qr_code";
CREATE TABLE "public"."qr_code" (
"id" int8 DEFAULT nextval('qr_code_id_seq'::regclass) NOT NULL,
"is_ok" bool,
"sid" varchar(255) COLLATE "default",
"token" varchar(255) COLLATE "default",
"username" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of qr_code
-- ----------------------------
INSERT INTO "public"."qr_code" VALUES ('1', 't', '003265cbc63f4275b4e33b8f9d816139', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('2', 'f', '975c122847aa475c987b06cb5563491a', null, null);
INSERT INTO "public"."qr_code" VALUES ('3', 'f', '5fdd28e82a324365bc73e056ca182cce', null, null);
INSERT INTO "public"."qr_code" VALUES ('4', 'f', 'ae5107dba95b494e863eb913d2dcec70', null, null);
INSERT INTO "public"."qr_code" VALUES ('5', 'f', 'bf4f0fe05fd14d4bb770faa96d05be47', null, null);
INSERT INTO "public"."qr_code" VALUES ('6', 'f', '5fb6d0a95a674655b37049263df59264', null, null);
INSERT INTO "public"."qr_code" VALUES ('7', 'f', '6853ff600ec54f73a085ae68870c0101', null, null);
INSERT INTO "public"."qr_code" VALUES ('8', 'f', '2bbefa65870a4b9f968d8f87e0c49f3f', null, null);
INSERT INTO "public"."qr_code" VALUES ('9', 'f', '9cefdac441e241319cc2329c04a5b777', null, null);
INSERT INTO "public"."qr_code" VALUES ('10', 'f', '1fe97fde29cb4cf1b6bd3c43caca7307', null, null);
INSERT INTO "public"."qr_code" VALUES ('11', 't', '5d87e08850e844fea5a54a29289584b2', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('12', 't', '80e4b84e6dac4980a84ed67445abd65a', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('13', 'f', 'fcde0b145893481f9fa70146f5a40a68', null, null);
INSERT INTO "public"."qr_code" VALUES ('14', 't', '916e38ddf7f54d08afa728ff688e3edb', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('15', 't', 'a686a84642f94288af467235467b91ea', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('16', 't', 'fe116a6f4eb14ee59cdb380bf11af8ba', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('17', 't', 'db696526091d4acea18b64398b281a5b', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('18', 't', 'a4aaf7c5802c40afac54e306e04c4599', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('19', 't', '535aba41be0943678ab50dc2837d9dfa', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('20', 'f', 'd4610418b7ac4fb8a8041d6f36194ee3', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('21', 't', '26278fea7b764274af23f5c92133fc6a', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('22', 't', 'e3ea24f593344f05981074b450393663', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('23', 't', '12cd3fe9dd274df182b327f914dcc7f6', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('24', 'f', 'b008724e17b340a2a8044b23f48eb4fe', null, null);
INSERT INTO "public"."qr_code" VALUES ('25', 't', '7839549aca164052aa5a1116b1d30c53', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('26', 't', '4d403808890a434fac944610819622b7', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('27', 't', '78b385138b1144c3abdab6377201e2ab', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('28', 'f', '00675fdd79ce4d47a5a21e8c3974bd70', null, null);
INSERT INTO "public"."qr_code" VALUES ('29', 'f', '419a994c7c774cd9aad0186e88b2d6fd', null, null);
INSERT INTO "public"."qr_code" VALUES ('30', 'f', '26766b0eebda4879a1d2b6be6f4732b9', null, null);
INSERT INTO "public"."qr_code" VALUES ('31', 'f', 'be7cf514e83b493f88e0a6a2ea477e12', null, null);
INSERT INTO "public"."qr_code" VALUES ('32', 'f', 'e02853d9e0f245cfa32b31f3783a193a', null, null);
INSERT INTO "public"."qr_code" VALUES ('33', 'f', '4f70698ed3584ca193f91dfb0f7c3f38', null, null);
INSERT INTO "public"."qr_code" VALUES ('34', 'f', 'dea868f2eedb4a18a728389507e7f3ff', null, null);
INSERT INTO "public"."qr_code" VALUES ('35', 'f', 'a928ed9a9f874d498d93e2b3941e3672', null, null);
INSERT INTO "public"."qr_code" VALUES ('36', 'f', '69b6b8de2d144ca0a28363a5a90a37ec', null, null);
INSERT INTO "public"."qr_code" VALUES ('37', 'f', 'f864f86e318440d0a4b6ee06f3596936', null, null);
INSERT INTO "public"."qr_code" VALUES ('38', 'f', '117ea65541c5459a850ef8934afcb43e', null, null);
INSERT INTO "public"."qr_code" VALUES ('39', 'f', '1095007302584cb388d7574fc510565f', null, null);
INSERT INTO "public"."qr_code" VALUES ('40', 'f', '492b99f37dd949bf8effae301f0b3a03', null, null);
INSERT INTO "public"."qr_code" VALUES ('41', 'f', '85ce6053710e47fb8b74685fca97005b', null, null);
INSERT INTO "public"."qr_code" VALUES ('42', 'f', 'd64574f32f7545e1844a25def1cd2563', null, null);
INSERT INTO "public"."qr_code" VALUES ('43', 'f', 'd740b4bc4d1d4dabac03011995a9e86b', null, null);
INSERT INTO "public"."qr_code" VALUES ('44', 'f', '5f98a899b5f24faf93526913c0cbfebd', null, null);
INSERT INTO "public"."qr_code" VALUES ('45', 'f', '86ababb9a6f74ec086d8b023b722f57c', null, null);
INSERT INTO "public"."qr_code" VALUES ('46', 'f', '9c31d85318ab473a8fb21f7a870fc7a5', null, null);
INSERT INTO "public"."qr_code" VALUES ('47', 'f', 'aeef87df72f44050887f687cbe175fa0', null, null);
INSERT INTO "public"."qr_code" VALUES ('48', 'f', 'bfe1168ab5f34a0e88239489d04df693', null, null);
INSERT INTO "public"."qr_code" VALUES ('49', 'f', 'afa54073109a418d8bda933631cfe0be', null, null);
INSERT INTO "public"."qr_code" VALUES ('50', 'f', '5bf2156908294e478102d14ec997fbd4', null, null);
INSERT INTO "public"."qr_code" VALUES ('51', 'f', '1bc2ade5d1ad47c393318867c410ab25', null, null);
INSERT INTO "public"."qr_code" VALUES ('52', 'f', '3f2fe7b8918f4e46b534d000c7205726', null, null);
INSERT INTO "public"."qr_code" VALUES ('53', 'f', '5ec51243e1bf4eab814e9f27cf0e8e26', null, null);
INSERT INTO "public"."qr_code" VALUES ('54', 'f', 'c7bc73cf78bb4ae3a8c92c79e1e8fb97', null, null);
INSERT INTO "public"."qr_code" VALUES ('55', 'f', '3ae2379a73e04b7087930027351351f0', null, null);
INSERT INTO "public"."qr_code" VALUES ('56', 'f', '5adc2972c3cb49e7b19ffedac07948d5', null, null);
INSERT INTO "public"."qr_code" VALUES ('57', 'f', 'efb307ca2005441d8e71e4be7d998bbf', null, null);
INSERT INTO "public"."qr_code" VALUES ('58', 'f', '3559174d4d8b42a3a2140824d71a938d', null, null);
INSERT INTO "public"."qr_code" VALUES ('59', 'f', '33a89c281e2345c3b9202f56ac189f08', null, null);
INSERT INTO "public"."qr_code" VALUES ('60', 'f', '609393940e88412cbb2267f42623d708', null, null);
INSERT INTO "public"."qr_code" VALUES ('61', 'f', '48709fcfdf39448b85d58a73a9f06c22', null, null);
INSERT INTO "public"."qr_code" VALUES ('62', 'f', '719c8cc3e797402cb94d9b3d200501dc', null, null);
INSERT INTO "public"."qr_code" VALUES ('63', 'f', '4da5adc68d9c4343aa2d6353f9efb866', null, null);
INSERT INTO "public"."qr_code" VALUES ('64', 'f', '629ff078be3940f88fa34fa278ad09c6', null, null);
INSERT INTO "public"."qr_code" VALUES ('65', 'f', 'b95b96af8c944eaab4f5d4f816627216', null, null);
INSERT INTO "public"."qr_code" VALUES ('66', 'f', '49b26904dedd4b1aabc0917df01e332b', null, null);
INSERT INTO "public"."qr_code" VALUES ('67', 'f', 'f1b911dce7fb409b9b32ff31d382b882', null, null);
INSERT INTO "public"."qr_code" VALUES ('68', 'f', '7aea4c196064475fa330f0d5c842bb92', null, null);
INSERT INTO "public"."qr_code" VALUES ('69', 'f', 'cafdd97a400149f7a7a931cb7fd13b79', null, null);
INSERT INTO "public"."qr_code" VALUES ('70', 'f', 'fb381850216647aa9ae74efa1d387ee5', null, null);
INSERT INTO "public"."qr_code" VALUES ('71', 'f', '3b0cd965d69944d49c4c362e80283de9', null, null);
INSERT INTO "public"."qr_code" VALUES ('72', 'f', '0a6dcc4ebc53435991e82aee3307b11c', null, null);
INSERT INTO "public"."qr_code" VALUES ('73', 'f', 'dce079c3932f4bddbd36fa22d024a53a', null, null);
INSERT INTO "public"."qr_code" VALUES ('74', 'f', '06b360b940654151b9b248a7d190969c', null, null);
INSERT INTO "public"."qr_code" VALUES ('75', 'f', '28af22963ef44c76b2b4b2de522f8ebb', null, null);
INSERT INTO "public"."qr_code" VALUES ('76', 'f', '2301f943ec6544cbba4f7b9644e046c8', null, null);
INSERT INTO "public"."qr_code" VALUES ('77', 'f', '79e68a544def494cb024d95e2da26237', null, null);
INSERT INTO "public"."qr_code" VALUES ('78', 'f', '6b6e315605f0420f95221458507ce767', null, null);
INSERT INTO "public"."qr_code" VALUES ('79', 'f', '655c3414a48c4cd69024f0b199c27950', null, null);
INSERT INTO "public"."qr_code" VALUES ('80', 'f', 'de85a672174443daa3123e3139877e3c', null, null);
INSERT INTO "public"."qr_code" VALUES ('81', 'f', 'f0ae008a9e204b0ab4379bb571dfafeb', null, null);
INSERT INTO "public"."qr_code" VALUES ('82', 'f', 'e40eb6763be142f5bcaa9c82ca551ff1', null, null);
INSERT INTO "public"."qr_code" VALUES ('83', 'f', 'e93f1b95d8a44cf7924603eed2dbf2ba', null, null);
INSERT INTO "public"."qr_code" VALUES ('84', 'f', 'e483f34f635c47978cda2b5bd5fe954c', null, null);
INSERT INTO "public"."qr_code" VALUES ('85', 'f', '8a2583b2567d4a1a8d8e870031cb9c3f', null, null);
INSERT INTO "public"."qr_code" VALUES ('86', 'f', '6fd1dc9d575e4fa7ab1c2199b77263a2', null, null);
INSERT INTO "public"."qr_code" VALUES ('87', 'f', '50ee49611242439e99fe8d44a5d79ece', null, null);
INSERT INTO "public"."qr_code" VALUES ('88', 'f', '819b9f0a6bc448258cc03d163d79fab7', null, null);
INSERT INTO "public"."qr_code" VALUES ('89', 'f', '62944d88b2e8454a84195be78d805a83', null, null);
INSERT INTO "public"."qr_code" VALUES ('90', 'f', 'bfb3381c3edf43aea3c2570f871685c8', null, null);
INSERT INTO "public"."qr_code" VALUES ('91', 'f', 'afd5305b264f452aa3a14ddc4ee0ebbd', null, null);
INSERT INTO "public"."qr_code" VALUES ('92', 'f', 'c10d101c7d694f2ebc5cd6c020e5bb6e', null, null);
INSERT INTO "public"."qr_code" VALUES ('93', 'f', 'c058918b4a604a159a414cdb7abb8f80', null, null);
INSERT INTO "public"."qr_code" VALUES ('94', 'f', '841d5ceca57a46a498e74b35b966bb94', null, null);
INSERT INTO "public"."qr_code" VALUES ('95', 'f', 'd34bec63a1034ab6a451b234f6bf60ae', null, null);
INSERT INTO "public"."qr_code" VALUES ('96', 'f', '0dc4bc3833084add93854e81bc9d7638', null, null);
INSERT INTO "public"."qr_code" VALUES ('97', 'f', 'e3b3f8ea878140db9efb47797203010e', null, null);
INSERT INTO "public"."qr_code" VALUES ('98', 'f', '3379b3d3ee404a3eb06100c50edcae16', null, null);
INSERT INTO "public"."qr_code" VALUES ('99', 'f', '5ece216ea71d4985ba568ea1fb294f9d', null, null);
INSERT INTO "public"."qr_code" VALUES ('100', 'f', '231d2130632346bb97afbab58998e43b', null, null);
INSERT INTO "public"."qr_code" VALUES ('101', 't', 'a21e20d98e7f4103ae9cb3966f78a411', 'ssss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('102', 'f', 'b8150a015e2a443aaf0fed5521e83bbf', null, null);
INSERT INTO "public"."qr_code" VALUES ('103', 'f', '8357a37a7cfd481b953e66b5c41f3667', null, null);
INSERT INTO "public"."qr_code" VALUES ('104', 'f', 'a76e9cdfdd41442fa769ca480ccb31da', null, null);
INSERT INTO "public"."qr_code" VALUES ('105', 'f', '478e11179a564f10a1c24e476062d215', null, null);
INSERT INTO "public"."qr_code" VALUES ('106', 'f', '512b58e2e8ae4c4fb0b2c0e79d33d3e2', null, null);
INSERT INTO "public"."qr_code" VALUES ('107', 'f', '92c93c93c3564c5987fb1ce005844780', null, null);
INSERT INTO "public"."qr_code" VALUES ('108', 'f', 'e4d84c14c082492ab9b9559b5dfac21f', null, null);
INSERT INTO "public"."qr_code" VALUES ('109', 'f', '50c3530cf86243c890b7296cde98ce6a', null, null);
INSERT INTO "public"."qr_code" VALUES ('110', 'f', 'c9b7cd0c08fb41a8a76785ab7a552362', null, null);
INSERT INTO "public"."qr_code" VALUES ('111', 't', 'd23d1cf9a290485691d6d1c36adf93b7', 'esss', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('112', 'f', '58f77ba4ce39496296efa6d6198ca60e', null, null);
INSERT INTO "public"."qr_code" VALUES ('113', 't', '930e223f1f844e8eb86a554bb9dd1b4b', null, 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('114', 'f', '746bd100f92644c2b41037d8ff03c5fc', null, null);
INSERT INTO "public"."qr_code" VALUES ('115', 'f', 'ac4aa5aafccf494d922d90b40c87010f', null, null);
INSERT INTO "public"."qr_code" VALUES ('116', 'f', '291ce2ab4fb941249271a11f5c824eec', null, null);
INSERT INTO "public"."qr_code" VALUES ('117', 'f', '598156cd04a5409cae3fb7c8022cd34e', null, null);
INSERT INTO "public"."qr_code" VALUES ('118', 'f', '145d308b0ddd4efd846368a2a3b9322e', null, null);
INSERT INTO "public"."qr_code" VALUES ('119', 'f', 'b0aa6f99d91e49a4ae9663cda2485600', null, null);
INSERT INTO "public"."qr_code" VALUES ('120', 'f', 'fbb939682bae454f878c594f5cbd0633', null, null);
INSERT INTO "public"."qr_code" VALUES ('121', 'f', '4c98537aa3a246b98c7b3bc73d6df3be', null, null);
INSERT INTO "public"."qr_code" VALUES ('122', 'f', 'c49be5c835e441e2bb27182658979124', null, null);
INSERT INTO "public"."qr_code" VALUES ('123', 'f', 'f515815bb8a44490925f0a3cb85dabb1', null, null);
INSERT INTO "public"."qr_code" VALUES ('124', 'f', '91d7891bc7a54e799a9432e6f274c86d', null, null);
INSERT INTO "public"."qr_code" VALUES ('125', 'f', '9cced08d6ae84624aeb409d631f2bf94', null, null);
INSERT INTO "public"."qr_code" VALUES ('126', 'f', 'e0049c30f8a34a429f0bef546174aa7b', null, null);
INSERT INTO "public"."qr_code" VALUES ('127', 'f', '8d3c39515d6d4e9697eb75de41a4a246', null, null);
INSERT INTO "public"."qr_code" VALUES ('128', 't', 'fe116c12c9644760953679333173f1fa', '', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('129', 'f', 'b6672dd43acc4b2fad96f598edd7def6', null, null);
INSERT INTO "public"."qr_code" VALUES ('130', 't', '725c534143944a12b6605c84b2b508aa', '', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('131', 't', '4a6ab6990a2543fbb4c3981e60112ff2', '', 'jeesun');
INSERT INTO "public"."qr_code" VALUES ('132', 'f', '6aa16b0bb9cf40f0a17b4d9a0cab7d68', null, null);
INSERT INTO "public"."qr_code" VALUES ('133', 'f', 'a6d45933883d4f299f1421946b4835e7', null, null);
INSERT INTO "public"."qr_code" VALUES ('134', 'f', '26b9ceabce764cfea2f8bc3f0c38ac5c', null, null);
INSERT INTO "public"."qr_code" VALUES ('135', 'f', '7409582e4d4344b794a8d670cc97b3e4', null, null);
INSERT INTO "public"."qr_code" VALUES ('136', 'f', '8f39a961dc044bd29f1c70fd4fd3d0f7', null, null);
INSERT INTO "public"."qr_code" VALUES ('137', 't', '25131554187141eaa162f17093f029b5', 'aee0f45d-0518-4d55-ae51-320ff4682589', 'user2711');
INSERT INTO "public"."qr_code" VALUES ('138', 'f', 'f4e536edb6024d71bded5d8cc153e1b2', null, null);
INSERT INTO "public"."qr_code" VALUES ('139', 't', 'c9c5995722c14fcea341acae71ec1750', 'aee0f45d-0518-4d55-ae51-320ff4682589', 'user2711');
INSERT INTO "public"."qr_code" VALUES ('140', 't', '5499aea29810413fa7ea29a36d96f51b', 'aee0f45d-0518-4d55-ae51-320ff4682589', 'user2711');
INSERT INTO "public"."qr_code" VALUES ('141', 't', '1721f7e9f4334876866f9e9f46c6d6de', 'aee0f45d-0518-4d55-ae51-320ff4682589', 'user2711');
INSERT INTO "public"."qr_code" VALUES ('142', 't', '06140817730e4a3a902f2667dd05a697', 'aee0f45d-0518-4d55-ae51-320ff4682589', 'user2711');
INSERT INTO "public"."qr_code" VALUES ('143', 't', '6c6ef62e2e6341ef819bc77040d06158', '5746bf2e-c8f6-4eeb-a666-d4cf7a0a15be', 'user2711');
INSERT INTO "public"."qr_code" VALUES ('144', 'f', 'c401fa7dcd22444f87dcc5dc885aae0f', null, null);
INSERT INTO "public"."qr_code" VALUES ('145', 'f', '4cdf42472a8c405bbd22b818ec52ffd7', null, null);
INSERT INTO "public"."qr_code" VALUES ('146', 't', '250592edb0624f8f85d8a175a7018546', 'e35aaada-a61d-4c89-bd82-04ea382408bd', 'user2711');
INSERT INTO "public"."qr_code" VALUES ('147', 't', 'ee29c4488f34479a8202874af614cf8b', 'e35aaada-a61d-4c89-bd82-04ea382408bd', 'user2711');
INSERT INTO "public"."qr_code" VALUES ('148', 't', '85897b924cc74cac8ba28f5ec1935feb', 'e35aaada-a61d-4c89-bd82-04ea382408bd', 'user2711');
INSERT INTO "public"."qr_code" VALUES ('149', 't', '368db8d91af244c48f6e12622eeca41a', 'e35aaada-a61d-4c89-bd82-04ea382408bd', 'user2711');
INSERT INTO "public"."qr_code" VALUES ('150', 'f', '0bd2a73c6ea540f38c19f59c73e10a25', null, null);
INSERT INTO "public"."qr_code" VALUES ('151', 'f', 'aeced9282e9d4a45a34e94fa0a0fe47c', null, null);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_info";
CREATE TABLE "public"."user_info" (
"id" int8 DEFAULT nextval('user_info_id_seq'::regclass) NOT NULL,
"address" varchar(255) COLLATE "default",
"age" int4,
"birth" varchar(255) COLLATE "default",
"email" varchar(255) COLLATE "default",
"head_photo" varchar(255) COLLATE "default",
"person_brief" varchar(255) COLLATE "default",
"phone" varchar(255) COLLATE "default",
"sex" bool,
"user_id" varchar(255) COLLATE "default",
"username" varchar(255) COLLATE "default",
"visit_card" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO "public"."user_info" VALUES ('1', null, null, null, 'simon.sun.dev@hotmail.com', null, null, '18362102427', null, '6', 'jeesun', null);
INSERT INTO "public"."user_info" VALUES ('3', null, null, null, null, null, null, '18860902711', null, '11', 'user2711', null);
INSERT INTO "public"."user_info" VALUES ('4', null, null, null, null, null, null, '18206298102', null, '12', 'user8102', null);
INSERT INTO "public"."user_info" VALUES ('5', null, null, null, null, null, null, '18550046745', null, '13', 'user6745', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
"username" varchar(50) COLLATE "default" NOT NULL,
"password" varchar(255) COLLATE "default" NOT NULL,
"enabled" bool NOT NULL,
"id" int4 DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
"email" varchar(255) COLLATE "default",
"phone" varchar(16) COLLATE "default",
"enable" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES ('jeesun', '$2a$11$t4akVchfgOv00XxB/ZKLlOmweUoL/Aed4CiJqQjaiRLZpBU3AWfxu', 't', '6', 'simon.sun.dev@hotmail.com', '18362102427', null);
INSERT INTO "public"."users" VALUES ('user2711', '$2a$11$BUiKPp8.pcym7sxXYPvZeOjl0BOoVl3PZT.1Wfb3kmIgooO/GfQ4G', 't', '11', null, '18860902711', null);
INSERT INTO "public"."users" VALUES ('user6745', '$2a$11$a7XDbu2RvLjZdr4kCvqh2u7gwVXhwxdauIzbX3ZizbBU.HeV8BOky', 't', '13', null, '18550046745', null);
INSERT INTO "public"."users" VALUES ('user8102', '$2a$11$pCmZkN9JZ8PzJpgBKXYEKOetZr8VnwlVdtysQggTAGhY9QHbQE2Ry', 't', '12', null, '18206298102', null);

-- ----------------------------
-- Table structure for veri_code
-- ----------------------------
DROP TABLE IF EXISTS "public"."veri_code";
CREATE TABLE "public"."veri_code" (
"id" int4 DEFAULT nextval('veri_code_id_seq'::regclass) NOT NULL,
"code" int4,
"create_time" int8,
"expires" int4,
"phone" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of veri_code
-- ----------------------------
INSERT INTO "public"."veri_code" VALUES ('1', '399212', '1524334283227', '1800', '18860902711');

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------
ALTER SEQUENCE "public"."log_login_id_seq1" OWNED BY "log_login"."id";
ALTER SEQUENCE "public"."qr_code_id_seq" OWNED BY "qr_code"."id";
ALTER SEQUENCE "public"."user_info_id_seq" OWNED BY "user_info"."id";
ALTER SEQUENCE "public"."users_id_seq" OWNED BY "users"."id";

-- ----------------------------
-- Indexes structure for table authorities
-- ----------------------------
CREATE UNIQUE INDEX "ix_auth_username" ON "public"."authorities" USING btree ("username", "authority");

-- ----------------------------
-- Primary Key structure for table log_login
-- ----------------------------
ALTER TABLE "public"."log_login" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table oauth_access_token
-- ----------------------------
ALTER TABLE "public"."oauth_access_token" ADD PRIMARY KEY ("authentication_id");

-- ----------------------------
-- Primary Key structure for table oauth_client_details
-- ----------------------------
ALTER TABLE "public"."oauth_client_details" ADD PRIMARY KEY ("client_id");

-- ----------------------------
-- Primary Key structure for table oauth_client_token
-- ----------------------------
ALTER TABLE "public"."oauth_client_token" ADD PRIMARY KEY ("authentication_id");

-- ----------------------------
-- Primary Key structure for table qr_code
-- ----------------------------
ALTER TABLE "public"."qr_code" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table user_info
-- ----------------------------
ALTER TABLE "public"."user_info" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD UNIQUE ("email");
ALTER TABLE "public"."users" ADD UNIQUE ("phone");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD PRIMARY KEY ("username");

-- ----------------------------
-- Primary Key structure for table veri_code
-- ----------------------------
ALTER TABLE "public"."veri_code" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."authorities"
-- ----------------------------
ALTER TABLE "public"."authorities" ADD FOREIGN KEY ("username") REFERENCES "public"."users" ("username") ON DELETE NO ACTION ON UPDATE NO ACTION;
