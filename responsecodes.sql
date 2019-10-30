-- MySQL dump 10.13  Distrib 5.6.33, for Linux (i686)
--
-- Host: localhost    Database: responsecodes
-- ------------------------------------------------------
-- Server version	5.6.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `codes`
--

DROP TABLE IF EXISTS `codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codes` (
  `code` varchar(4) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codes`
--

LOCK TABLES `codes` WRITE;
/*!40000 ALTER TABLE `codes` DISABLE KEYS */;
INSERT INTO `codes` VALUES
('400','Bad Request','The server cannot or will not process the request due to an apparent client error (e.g., malformed request syntax, size too large, invalid request message framing, or deceptive request routing).'),
('401','Unauthorized (RFC 7235)','Similar to 403 Forbidden, but specifically for use when authentication is required and has failed or has not yet been provided. The response must include a WWW-Authenticate header field containing a challenge applicable to the requested resource. See Basi'),
('402','Payment Required','Note: Some sites issue HTTP 401 when an IP address is banned from the website (usually the website domain) and that specific address is refused permission to access a website.Reserved for future use. The original intention was that this code might be used'),
('403','Forbidden','The request was valid, but the server is refusing action. The user might not have the necessary permissions for a resource, or may need an account of some sort.'),
('404','Not Found','The requested resource could not be found but may be available in the future. Subsequent requests by the client are permissible.'),
('405','Method Not Allowed','A request method is not supported for the requested resource; for example, a GET request on a form that requires data to be presented via POST, or a PUT request on a read-only resource.'),
('406','Not Acceptable','The requested resource is capable of generating only content not acceptable according to the Accept headers sent in the request.[38] See Content negotiation.'),
('407','Proxy Authentication Required','The client must first authenticate itself with the proxy.'),
('408','Request Timeout','The server timed out waiting for the request. According to HTTP specifications: \"The client did not produce a request within the time that the server was prepared to wait. The client MAY repeat the request without modifications at any later time.\"'),
('409','Conflict','Indicates that the request could not be processed because of conflict in the request, such as an edit conflict between multiple simultaneous updates.'),
('410','Gone','Indicates that the resource requested is no longer available and will not be available again. This should be used when a resource has been intentionally removed and the resource should be purged. Upon receiving a 410 status code, the client should not req'),
('411','Length Required','The request did not specify the length of its content, which is required by the requested resource.[42]'),
('412','Precondition Failed (RFC 7232)','The server does not meet one of the preconditions that the requester put on the request.'),
('413','Payload Too Large (RFC 7231)','The request is larger than the server is willing or able to process. Previously called \"Request Entity Too Large\".'),
('414','URI Too Long (RFC 7231)','The URI provided was too long for the server to process. Often the result of too much data being encoded as a query-string of a GET request, in which case it should be converted to a POST request.[45] Called \"Request-URI Too Long\" previously.'),
('415','Unsupported Media Type','The request entity has a media type which the server or resource does not support. For example, the client uploads an image as image/svg+xml, but the server requires that images use a different format.'),
('416','Range Not Satisfiable (RFC 7233)','The client has asked for a portion of the file (byte serving), but the server cannot supply that portion. For example, if the client asked for a part of the file that lies beyond the end of the file.[47] Called \"Requested Range Not Satisfiable\" previously'),
('417','Expectation Failed','The server cannot meet the requirements of the Expect request-header field.'),
('418','Im a teapot (RFC 2324)','This HTTP status is used as an Easter egg in some websites, including Google.com'),
('421','Misdirected Request (RFC 7540)','The request was directed at a server that is not able to produce a response.[52] (for example because of a connection reuse)'),
('422','Unprocessable Entity (WebDAV; RFC 4918)','The request was well-formed but was unable to be followed due to semantic errors.'),
('423','Locked (WebDAV; RFC 4918)','The resource that is being accessed is locked.'),
('424','Failed Dependency (WebDAV; RFC 4918)','The request failed due to failure of a previous request (e.g., a PROPPATCH).'),
('426','Upgrade Required','The client should switch to a different protocol such as TLS/1.0, given in the Upgrade header field.'),
('428','Precondition Required (RFC 6585)','The origin server requires the request to be conditional. Intended to prevent the lost update problem, where a client GETs a resources state, modifies it, and PUTs it back to the server, when meanwhile a third party has modified the state on the server, l'),
('429','Too Many Requests (RFC 6585)','The user has sent too many requests in a given amount of time. Intended for use with rate-limiting schemes.'),
('431','Request Header Fields Too Large (RFC 6585)','The server is unwilling to process the request because either an individual header field, or all the header fields collectively, are too large.'),
('451','Unavailable For Legal Reasons (RFC 7725)','A server operator has received a legal demand to deny access to a resource or to a set of resources that includes the requested resource.[56] The code 451 was chosen as a reference to the novel Fahrenheit 451.'),
('500','Internal Server Error','A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.'),
('501','Not Implemented','The server either does not recognize the request method, or it lacks the ability to fulfill the request. Usually this implies future availability (e.g., a new feature of a web-service API).'),
('502','Bad Gateway','The server was acting as a gateway or proxy and received an invalid response from the upstream server.'),
('503','Service Unavailable','The server is currently unavailable (because it is overloaded or down for maintenance). Generally, this is a temporary state.'),
('504','Gateway Timeout','The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.'),
('505','HTTP Version Not Supported','The server does not support the HTTP protocol version used in the request.'),
('506','Variant Also Negotiates (RFC 2295)','Transparent content negotiation for the request results in a circular reference.'),
('507','Insufficient Storage (WebDAV; RFC 4918)','The server is unable to store the representation needed to complete the request.'),
('508','Loop Detected (WebDAV; RFC 5842)','The server detected an infinite loop while processing the request (sent in lieu of 208 Already Reported).'),
('510','Not Extended (RFC 2774)','Further extensions to the request are required for the server to fulfil it.'),
('511','Network Authentication Required (RFC 6585)','The client needs to authenticate to gain network access. Intended for use by intercepting proxies used to control access to the network (e.g., \"captive portals\" used to require agreement to Terms of Service before granting full Internet access via a Wi-Fi')
;
/*!40000 ALTER TABLE `codes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-07  6:26:11
