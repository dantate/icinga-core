-- --------------------------------------------------------
-- mysql.sql
-- DB definition for MySQL
-- 
--
-- -- --------------------------------------------------------

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `icinga`
--

-- --------------------------------------------------------

--
-- Table structure for table `icinga_acknowledgements`
--

CREATE TABLE IF NOT EXISTS `icinga_acknowledgements` (
  `acknowledgement_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `entry_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `entry_time_usec` int(11) NOT NULL default '0',
  `acknowledgement_type` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `state` smallint(6) NOT NULL default '0',
  `author_name` varchar(64) character set latin1 NOT NULL default '',
  `comment_data` varchar(255) character set latin1 NOT NULL default '',
  `is_sticky` smallint(6) NOT NULL default '0',
  `persistent_comment` smallint(6) NOT NULL default '0',
  `notify_contacts` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`acknowledgement_id`)
) ENGINE=MyISAM COMMENT='Current and historical host and service acknowledgements';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_commands`
--

CREATE TABLE IF NOT EXISTS `icinga_commands` (
  `command_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `command_line` varchar(1024) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`command_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`object_id`,`config_type`)
) ENGINE=MyISAM  COMMENT='Command definitions';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_commenthistory`
--

CREATE TABLE IF NOT EXISTS `icinga_commenthistory` (
  `commenthistory_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `entry_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `entry_time_usec` int(11) NOT NULL default '0',
  `comment_type` smallint(6) NOT NULL default '0',
  `entry_type` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `comment_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `internal_comment_id` int(11) NOT NULL default '0',
  `author_name` varchar(64) character set latin1 NOT NULL default '',
  `comment_data` varchar(255) character set latin1 NOT NULL default '',
  `is_persistent` smallint(6) NOT NULL default '0',
  `comment_source` smallint(6) NOT NULL default '0',
  `expires` smallint(6) NOT NULL default '0',
  `expiration_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `deletion_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `deletion_time_usec` int(11) NOT NULL default '0',
  PRIMARY KEY  (`commenthistory_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`comment_time`,`internal_comment_id`)
) ENGINE=MyISAM  COMMENT='Historical host and service comments';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_comments`
--

CREATE TABLE IF NOT EXISTS `icinga_comments` (
  `comment_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `entry_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `entry_time_usec` int(11) NOT NULL default '0',
  `comment_type` smallint(6) NOT NULL default '0',
  `entry_type` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `comment_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `internal_comment_id` int(11) NOT NULL default '0',
  `author_name` varchar(64) character set latin1 NOT NULL default '',
  `comment_data` varchar(255) character set latin1 NOT NULL default '',
  `is_persistent` smallint(6) NOT NULL default '0',
  `comment_source` smallint(6) NOT NULL default '0',
  `expires` smallint(6) NOT NULL default '0',
  `expiration_time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`comment_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`comment_time`,`internal_comment_id`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

--
-- Table structure for table `icinga_configfiles`
--

CREATE TABLE IF NOT EXISTS `icinga_configfiles` (
  `configfile_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `configfile_type` smallint(6) NOT NULL default '0',
  `configfile_path` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`configfile_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`configfile_type`,`configfile_path`)
) ENGINE=MyISAM  COMMENT='Configuration files';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_configfilevariables`
--

CREATE TABLE IF NOT EXISTS `icinga_configfilevariables` (
  `configfilevariable_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `configfile_id` int(11) NOT NULL default '0',
  `varname` varchar(64) character set latin1 NOT NULL default '',
  `varvalue` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`configfilevariable_id`)
) ENGINE=MyISAM  COMMENT='Configuration file variables';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_conninfo`
--

CREATE TABLE IF NOT EXISTS `icinga_conninfo` (
  `conninfo_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `agent_name` varchar(32) character set latin1 NOT NULL default '',
  `agent_version` varchar(8) character set latin1 NOT NULL default '',
  `disposition` varchar(16) character set latin1 NOT NULL default '',
  `connect_source` varchar(16) character set latin1 NOT NULL default '',
  `connect_type` varchar(16) character set latin1 NOT NULL default '',
  `connect_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `disconnect_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_checkin_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `data_start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `data_end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `bytes_processed` int(11) NOT NULL default '0',
  `lines_processed` int(11) NOT NULL default '0',
  `entries_processed` int(11) NOT NULL default '0',
  PRIMARY KEY  (`conninfo_id`)
) ENGINE=MyISAM  COMMENT='NDO2DB daemon connection information';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_contactgroups`
--

CREATE TABLE IF NOT EXISTS `icinga_contactgroups` (
  `contactgroup_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `contactgroup_object_id` int(11) NOT NULL default '0',
  `alias` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`contactgroup_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`config_type`,`contactgroup_object_id`)
) ENGINE=MyISAM  COMMENT='Contactgroup definitions';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_contactgroup_members`
--

CREATE TABLE IF NOT EXISTS `icinga_contactgroup_members` (
  `contactgroup_member_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `contactgroup_id` int(11) NOT NULL default '0',
  `contact_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`contactgroup_member_id`),
  UNIQUE KEY `instance_id` (`contactgroup_id`,`contact_object_id`)
) ENGINE=MyISAM  COMMENT='Contactgroup members';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_contactnotificationmethods`
--

CREATE TABLE IF NOT EXISTS `icinga_contactnotificationmethods` (
  `contactnotificationmethod_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `contactnotification_id` int(11) NOT NULL default '0',
  `start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `start_time_usec` int(11) NOT NULL default '0',
  `end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_time_usec` int(11) NOT NULL default '0',
  `command_object_id` int(11) NOT NULL default '0',
  `command_args` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`contactnotificationmethod_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`contactnotification_id`,`start_time`,`start_time_usec`)
) ENGINE=MyISAM  COMMENT='Historical record of contact notification methods';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_contactnotifications`
--

CREATE TABLE IF NOT EXISTS `icinga_contactnotifications` (
  `contactnotification_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `notification_id` int(11) NOT NULL default '0',
  `contact_object_id` int(11) NOT NULL default '0',
  `start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `start_time_usec` int(11) NOT NULL default '0',
  `end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_time_usec` int(11) NOT NULL default '0',
  PRIMARY KEY  (`contactnotification_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`contact_object_id`,`start_time`,`start_time_usec`)
) ENGINE=MyISAM  COMMENT='Historical record of contact notifications';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_contacts`
--

CREATE TABLE IF NOT EXISTS `icinga_contacts` (
  `contact_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `contact_object_id` int(11) NOT NULL default '0',
  `alias` varchar(64) character set latin1 NOT NULL default '',
  `email_address` varchar(255) character set latin1 NOT NULL default '',
  `pager_address` varchar(64) character set latin1 NOT NULL default '',
  `host_timeperiod_object_id` int(11) NOT NULL default '0',
  `service_timeperiod_object_id` int(11) NOT NULL default '0',
  `host_notifications_enabled` smallint(6) NOT NULL default '0',
  `service_notifications_enabled` smallint(6) NOT NULL default '0',
  `can_submit_commands` smallint(6) NOT NULL default '0',
  `notify_service_recovery` smallint(6) NOT NULL default '0',
  `notify_service_warning` smallint(6) NOT NULL default '0',
  `notify_service_unknown` smallint(6) NOT NULL default '0',
  `notify_service_critical` smallint(6) NOT NULL default '0',
  `notify_service_flapping` smallint(6) NOT NULL default '0',
  `notify_service_downtime` smallint(6) NOT NULL default '0',
  `notify_host_recovery` smallint(6) NOT NULL default '0',
  `notify_host_down` smallint(6) NOT NULL default '0',
  `notify_host_unreachable` smallint(6) NOT NULL default '0',
  `notify_host_flapping` smallint(6) NOT NULL default '0',
  `notify_host_downtime` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`contact_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`config_type`,`contact_object_id`)
) ENGINE=MyISAM  COMMENT='Contact definitions';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_contactstatus`
--

CREATE TABLE IF NOT EXISTS `icinga_contactstatus` (
  `contactstatus_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `contact_object_id` int(11) NOT NULL default '0',
  `status_update_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `host_notifications_enabled` smallint(6) NOT NULL default '0',
  `service_notifications_enabled` smallint(6) NOT NULL default '0',
  `last_host_notification` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_service_notification` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_attributes` int(11) NOT NULL default '0',
  `modified_host_attributes` int(11) NOT NULL default '0',
  `modified_service_attributes` int(11) NOT NULL default '0',
  PRIMARY KEY  (`contactstatus_id`),
  UNIQUE KEY `contact_object_id` (`contact_object_id`)
) ENGINE=MyISAM  COMMENT='Contact status';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_contact_addresses`
--

CREATE TABLE IF NOT EXISTS `icinga_contact_addresses` (
  `contact_address_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `contact_id` int(11) NOT NULL default '0',
  `address_number` smallint(6) NOT NULL default '0',
  `address` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`contact_address_id`),
  UNIQUE KEY `contact_id` (`contact_id`,`address_number`)
) ENGINE=MyISAM COMMENT='Contact addresses';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_contact_notificationcommands`
--

CREATE TABLE IF NOT EXISTS `icinga_contact_notificationcommands` (
  `contact_notificationcommand_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `contact_id` int(11) NOT NULL default '0',
  `notification_type` smallint(6) NOT NULL default '0',
  `command_object_id` int(11) NOT NULL default '0',
  `command_args` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`contact_notificationcommand_id`),
  UNIQUE KEY `contact_id` (`contact_id`,`notification_type`,`command_object_id`,`command_args`)
) ENGINE=MyISAM  COMMENT='Contact host and service notification commands';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_customvariables`
--

CREATE TABLE IF NOT EXISTS `icinga_customvariables` (
  `customvariable_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `has_been_modified` smallint(6) NOT NULL default '0',
  `varname` varchar(255) character set latin1 NOT NULL default '',
  `varvalue` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`customvariable_id`),
  UNIQUE KEY `object_id_2` (`object_id`,`config_type`,`varname`),
  KEY `varname` (`varname`)
) ENGINE=MyISAM COMMENT='Custom variables';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_customvariablestatus`
--

CREATE TABLE IF NOT EXISTS `icinga_customvariablestatus` (
  `customvariablestatus_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `status_update_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `has_been_modified` smallint(6) NOT NULL default '0',
  `varname` varchar(255) character set latin1 NOT NULL default '',
  `varvalue` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`customvariablestatus_id`),
  UNIQUE KEY `object_id_2` (`object_id`,`varname`),
  KEY `varname` (`varname`)
) ENGINE=MyISAM COMMENT='Custom variable status information';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_dbversion`
--

CREATE TABLE IF NOT EXISTS `icinga_dbversion` (
  `name` varchar(10) character set latin1 NOT NULL default '',
  `version` varchar(10) character set latin1 NOT NULL default ''
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `icinga_downtimehistory`
--

CREATE TABLE IF NOT EXISTS `icinga_downtimehistory` (
  `downtimehistory_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `downtime_type` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `entry_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `author_name` varchar(64) character set latin1 NOT NULL default '',
  `comment_data` varchar(255) character set latin1 NOT NULL default '',
  `internal_downtime_id` int(11) NOT NULL default '0',
  `triggered_by_id` int(11) NOT NULL default '0',
  `is_fixed` smallint(6) NOT NULL default '0',
  `duration` smallint(6) NOT NULL default '0',
  `scheduled_start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `scheduled_end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `was_started` smallint(6) NOT NULL default '0',
  `actual_start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `actual_start_time_usec` int(11) NOT NULL default '0',
  `actual_end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `actual_end_time_usec` int(11) NOT NULL default '0',
  `was_cancelled` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`downtimehistory_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`object_id`,`entry_time`,`internal_downtime_id`)
) ENGINE=MyISAM  COMMENT='Historical scheduled host and service downtime';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_eventhandlers`
--

CREATE TABLE IF NOT EXISTS `icinga_eventhandlers` (
  `eventhandler_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `eventhandler_type` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `state` smallint(6) NOT NULL default '0',
  `state_type` smallint(6) NOT NULL default '0',
  `start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `start_time_usec` int(11) NOT NULL default '0',
  `end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_time_usec` int(11) NOT NULL default '0',
  `command_object_id` int(11) NOT NULL default '0',
  `command_args` varchar(255) character set latin1 NOT NULL default '',
  `command_line` varchar(1024) character set latin1 NOT NULL default '',
  `timeout` smallint(6) NOT NULL default '0',
  `early_timeout` smallint(6) NOT NULL default '0',
  `execution_time` double NOT NULL default '0',
  `return_code` smallint(6) NOT NULL default '0',
  `output` varchar(255) character set latin1 NOT NULL default '',
  `long_output` TEXT NOT NULL default '',
  PRIMARY KEY  (`eventhandler_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`object_id`,`start_time`,`start_time_usec`)
) ENGINE=MyISAM COMMENT='Historical host and service event handlers';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_externalcommands`
--

CREATE TABLE IF NOT EXISTS `icinga_externalcommands` (
  `externalcommand_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `entry_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `command_type` smallint(6) NOT NULL default '0',
  `command_name` varchar(128) character set latin1 NOT NULL default '',
  `command_args` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`externalcommand_id`)
) ENGINE=MyISAM  COMMENT='Historical record of processed external commands';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_flappinghistory`
--

CREATE TABLE IF NOT EXISTS `icinga_flappinghistory` (
  `flappinghistory_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `event_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `event_time_usec` int(11) NOT NULL default '0',
  `event_type` smallint(6) NOT NULL default '0',
  `reason_type` smallint(6) NOT NULL default '0',
  `flapping_type` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `percent_state_change` double NOT NULL default '0',
  `low_threshold` double NOT NULL default '0',
  `high_threshold` double NOT NULL default '0',
  `comment_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `internal_comment_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`flappinghistory_id`)
) ENGINE=MyISAM  COMMENT='Current and historical record of host and service flapping';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_hostchecks`
--

CREATE TABLE IF NOT EXISTS `icinga_hostchecks` (
  `hostcheck_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `host_object_id` int(11) NOT NULL default '0',
  `check_type` smallint(6) NOT NULL default '0',
  `is_raw_check` smallint(6) NOT NULL default '0',
  `current_check_attempt` smallint(6) NOT NULL default '0',
  `max_check_attempts` smallint(6) NOT NULL default '0',
  `state` smallint(6) NOT NULL default '0',
  `state_type` smallint(6) NOT NULL default '0',
  `start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `start_time_usec` int(11) NOT NULL default '0',
  `end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_time_usec` int(11) NOT NULL default '0',
  `command_object_id` int(11) NOT NULL default '0',
  `command_args` varchar(255) character set latin1 NOT NULL default '',
  `command_line` varchar(1024) character set latin1 NOT NULL default '',
  `timeout` smallint(6) NOT NULL default '0',
  `early_timeout` smallint(6) NOT NULL default '0',
  `execution_time` double NOT NULL default '0',
  `latency` double NOT NULL default '0',
  `return_code` smallint(6) NOT NULL default '0',
  `output` varchar(255) character set latin1 NOT NULL default '',
  `long_output` TEXT NOT NULL default '',
  `perfdata` TEXT character set latin1 NOT NULL default '',
  PRIMARY KEY  (`hostcheck_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`host_object_id`,`start_time`,`start_time_usec`)
) ENGINE=MyISAM  COMMENT='Historical host checks';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_hostdependencies`
--

CREATE TABLE IF NOT EXISTS `icinga_hostdependencies` (
  `hostdependency_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `host_object_id` int(11) NOT NULL default '0',
  `dependent_host_object_id` int(11) NOT NULL default '0',
  `dependency_type` smallint(6) NOT NULL default '0',
  `inherits_parent` smallint(6) NOT NULL default '0',
  `timeperiod_object_id` int(11) NOT NULL default '0',
  `fail_on_up` smallint(6) NOT NULL default '0',
  `fail_on_down` smallint(6) NOT NULL default '0',
  `fail_on_unreachable` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`hostdependency_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`config_type`,`host_object_id`,`dependent_host_object_id`,`dependency_type`,`inherits_parent`,`fail_on_up`,`fail_on_down`,`fail_on_unreachable`)
) ENGINE=MyISAM COMMENT='Host dependency definitions';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_hostescalations`
--

CREATE TABLE IF NOT EXISTS `icinga_hostescalations` (
  `hostescalation_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `host_object_id` int(11) NOT NULL default '0',
  `timeperiod_object_id` int(11) NOT NULL default '0',
  `first_notification` smallint(6) NOT NULL default '0',
  `last_notification` smallint(6) NOT NULL default '0',
  `notification_interval` double NOT NULL default '0',
  `escalate_on_recovery` smallint(6) NOT NULL default '0',
  `escalate_on_down` smallint(6) NOT NULL default '0',
  `escalate_on_unreachable` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`hostescalation_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`config_type`,`host_object_id`,`timeperiod_object_id`,`first_notification`,`last_notification`)
) ENGINE=MyISAM  COMMENT='Host escalation definitions';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_hostescalation_contactgroups`
--

CREATE TABLE IF NOT EXISTS `icinga_hostescalation_contactgroups` (
  `hostescalation_contactgroup_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `hostescalation_id` int(11) NOT NULL default '0',
  `contactgroup_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`hostescalation_contactgroup_id`),
  UNIQUE KEY `instance_id` (`hostescalation_id`,`contactgroup_object_id`)
) ENGINE=MyISAM  COMMENT='Host escalation contact groups';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_hostescalation_contacts`
--

CREATE TABLE IF NOT EXISTS `icinga_hostescalation_contacts` (
  `hostescalation_contact_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `hostescalation_id` int(11) NOT NULL default '0',
  `contact_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`hostescalation_contact_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`hostescalation_id`,`contact_object_id`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

--
-- Table structure for table `icinga_hostgroups`
--

CREATE TABLE IF NOT EXISTS `icinga_hostgroups` (
  `hostgroup_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `hostgroup_object_id` int(11) NOT NULL default '0',
  `alias` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`hostgroup_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`hostgroup_object_id`)
) ENGINE=MyISAM  COMMENT='Hostgroup definitions';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_hostgroup_members`
--

CREATE TABLE IF NOT EXISTS `icinga_hostgroup_members` (
  `hostgroup_member_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `hostgroup_id` int(11) NOT NULL default '0',
  `host_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`hostgroup_member_id`),
  UNIQUE KEY `instance_id` (`hostgroup_id`,`host_object_id`)
) ENGINE=MyISAM  COMMENT='Hostgroup members';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_hosts`
--

CREATE TABLE IF NOT EXISTS `icinga_hosts` (
  `host_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `host_object_id` int(11) NOT NULL default '0',
  `alias` varchar(64) character set latin1 NOT NULL default '',
  `display_name` varchar(64) character set latin1 NOT NULL default '',
  `address` varchar(128) character set latin1 NOT NULL default '',
  `check_command_object_id` int(11) NOT NULL default '0',
  `check_command_args` varchar(255) character set latin1 NOT NULL default '',
  `eventhandler_command_object_id` int(11) NOT NULL default '0',
  `eventhandler_command_args` varchar(255) character set latin1 NOT NULL default '',
  `notification_timeperiod_object_id` int(11) NOT NULL default '0',
  `check_timeperiod_object_id` int(11) NOT NULL default '0',
  `failure_prediction_options` varchar(64) character set latin1 NOT NULL default '',
  `check_interval` double NOT NULL default '0',
  `retry_interval` double NOT NULL default '0',
  `max_check_attempts` smallint(6) NOT NULL default '0',
  `first_notification_delay` double NOT NULL default '0',
  `notification_interval` double NOT NULL default '0',
  `notify_on_down` smallint(6) NOT NULL default '0',
  `notify_on_unreachable` smallint(6) NOT NULL default '0',
  `notify_on_recovery` smallint(6) NOT NULL default '0',
  `notify_on_flapping` smallint(6) NOT NULL default '0',
  `notify_on_downtime` smallint(6) NOT NULL default '0',
  `stalk_on_up` smallint(6) NOT NULL default '0',
  `stalk_on_down` smallint(6) NOT NULL default '0',
  `stalk_on_unreachable` smallint(6) NOT NULL default '0',
  `flap_detection_enabled` smallint(6) NOT NULL default '0',
  `flap_detection_on_up` smallint(6) NOT NULL default '0',
  `flap_detection_on_down` smallint(6) NOT NULL default '0',
  `flap_detection_on_unreachable` smallint(6) NOT NULL default '0',
  `low_flap_threshold` double NOT NULL default '0',
  `high_flap_threshold` double NOT NULL default '0',
  `process_performance_data` smallint(6) NOT NULL default '0',
  `freshness_checks_enabled` smallint(6) NOT NULL default '0',
  `freshness_threshold` smallint(6) NOT NULL default '0',
  `passive_checks_enabled` smallint(6) NOT NULL default '0',
  `event_handler_enabled` smallint(6) NOT NULL default '0',
  `active_checks_enabled` smallint(6) NOT NULL default '0',
  `retain_status_information` smallint(6) NOT NULL default '0',
  `retain_nonstatus_information` smallint(6) NOT NULL default '0',
  `notifications_enabled` smallint(6) NOT NULL default '0',
  `obsess_over_host` smallint(6) NOT NULL default '0',
  `failure_prediction_enabled` smallint(6) NOT NULL default '0',
  `notes` varchar(255) character set latin1 NOT NULL default '',
  `notes_url` varchar(255) character set latin1 NOT NULL default '',
  `action_url` varchar(255) character set latin1 NOT NULL default '',
  `icon_image` varchar(255) character set latin1 NOT NULL default '',
  `icon_image_alt` varchar(255) character set latin1 NOT NULL default '',
  `vrml_image` varchar(255) character set latin1 NOT NULL default '',
  `statusmap_image` varchar(255) character set latin1 NOT NULL default '',
  `have_2d_coords` smallint(6) NOT NULL default '0',
  `x_2d` smallint(6) NOT NULL default '0',
  `y_2d` smallint(6) NOT NULL default '0',
  `have_3d_coords` smallint(6) NOT NULL default '0',
  `x_3d` double NOT NULL default '0',
  `y_3d` double NOT NULL default '0',
  `z_3d` double NOT NULL default '0',
  PRIMARY KEY  (`host_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`config_type`,`host_object_id`),
  KEY `host_object_id` (`host_object_id`)
) ENGINE=MyISAM  COMMENT='Host definitions';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_hoststatus`
--

CREATE TABLE IF NOT EXISTS `icinga_hoststatus` (
  `hoststatus_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `host_object_id` int(11) NOT NULL default '0',
  `status_update_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `output` varchar(255) character set latin1 NOT NULL default '',
  `long_output` TEXT NOT NULL default '',
  `perfdata` TEXT character set latin1 NOT NULL default '',
  `current_state` smallint(6) NOT NULL default '0',
  `has_been_checked` smallint(6) NOT NULL default '0',
  `should_be_scheduled` smallint(6) NOT NULL default '0',
  `current_check_attempt` smallint(6) NOT NULL default '0',
  `max_check_attempts` smallint(6) NOT NULL default '0',
  `last_check` datetime NOT NULL default '0000-00-00 00:00:00',
  `next_check` datetime NOT NULL default '0000-00-00 00:00:00',
  `check_type` smallint(6) NOT NULL default '0',
  `last_state_change` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_hard_state_change` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_hard_state` smallint(6) NOT NULL default '0',
  `last_time_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_time_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_time_unreachable` datetime NOT NULL default '0000-00-00 00:00:00',
  `state_type` smallint(6) NOT NULL default '0',
  `last_notification` datetime NOT NULL default '0000-00-00 00:00:00',
  `next_notification` datetime NOT NULL default '0000-00-00 00:00:00',
  `no_more_notifications` smallint(6) NOT NULL default '0',
  `notifications_enabled` smallint(6) NOT NULL default '0',
  `problem_has_been_acknowledged` smallint(6) NOT NULL default '0',
  `acknowledgement_type` smallint(6) NOT NULL default '0',
  `current_notification_number` smallint(6) NOT NULL default '0',
  `passive_checks_enabled` smallint(6) NOT NULL default '0',
  `active_checks_enabled` smallint(6) NOT NULL default '0',
  `event_handler_enabled` smallint(6) NOT NULL default '0',
  `flap_detection_enabled` smallint(6) NOT NULL default '0',
  `is_flapping` smallint(6) NOT NULL default '0',
  `percent_state_change` double NOT NULL default '0',
  `latency` double NOT NULL default '0',
  `execution_time` double NOT NULL default '0',
  `scheduled_downtime_depth` smallint(6) NOT NULL default '0',
  `failure_prediction_enabled` smallint(6) NOT NULL default '0',
  `process_performance_data` smallint(6) NOT NULL default '0',
  `obsess_over_host` smallint(6) NOT NULL default '0',
  `modified_host_attributes` int(11) NOT NULL default '0',
  `event_handler` varchar(255) character set latin1 NOT NULL default '',
  `check_command` varchar(255) character set latin1 NOT NULL default '',
  `normal_check_interval` double NOT NULL default '0',
  `retry_check_interval` double NOT NULL default '0',
  `check_timeperiod_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`hoststatus_id`),
  UNIQUE KEY `object_id` (`host_object_id`)
) ENGINE=MyISAM  COMMENT='Current host status information';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_host_contactgroups`
--

CREATE TABLE IF NOT EXISTS `icinga_host_contactgroups` (
  `host_contactgroup_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `host_id` int(11) NOT NULL default '0',
  `contactgroup_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`host_contactgroup_id`),
  UNIQUE KEY `instance_id` (`host_id`,`contactgroup_object_id`)
) ENGINE=MyISAM  COMMENT='Host contact groups';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_host_contacts`
--

CREATE TABLE IF NOT EXISTS `icinga_host_contacts` (
  `host_contact_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `host_id` int(11) NOT NULL default '0',
  `contact_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`host_contact_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`host_id`,`contact_object_id`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

--
-- Table structure for table `icinga_host_parenthosts`
--

CREATE TABLE IF NOT EXISTS `icinga_host_parenthosts` (
  `host_parenthost_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `host_id` int(11) NOT NULL default '0',
  `parent_host_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`host_parenthost_id`),
  UNIQUE KEY `instance_id` (`host_id`,`parent_host_object_id`)
) ENGINE=MyISAM  COMMENT='Parent hosts';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_instances`
--

CREATE TABLE IF NOT EXISTS `icinga_instances` (
  `instance_id` smallint(6) NOT NULL auto_increment,
  `instance_name` varchar(64) character set latin1 NOT NULL default '',
  `instance_description` varchar(128) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`instance_id`)
) ENGINE=MyISAM  COMMENT='Location names of various Icinga installations';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_logentries`
--

CREATE TABLE IF NOT EXISTS `icinga_logentries` (
  `logentry_id` int(11) NOT NULL auto_increment,
  `instance_id` int(11) NOT NULL default '0',
  `logentry_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `entry_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `entry_time_usec` int(11) NOT NULL default '0',
  `logentry_type` int(11) NOT NULL default '0',
  `logentry_data` varchar(255) character set latin1 NOT NULL default '',
  `realtime_data` smallint(6) NOT NULL default '0',
  `inferred_data_extracted` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`logentry_id`)
) ENGINE=MyISAM COMMENT='Historical record of log entries';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_notifications`
--

CREATE TABLE IF NOT EXISTS `icinga_notifications` (
  `notification_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `notification_type` smallint(6) NOT NULL default '0',
  `notification_reason` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `start_time_usec` int(11) NOT NULL default '0',
  `end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_time_usec` int(11) NOT NULL default '0',
  `state` smallint(6) NOT NULL default '0',
  `output` varchar(255) character set latin1 NOT NULL default '',
  `long_output` TEXT NOT NULL default '',
  `escalated` smallint(6) NOT NULL default '0',
  `contacts_notified` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`notification_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`object_id`,`start_time`,`start_time_usec`)
) ENGINE=MyISAM  COMMENT='Historical record of host and service notifications';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_objects`
--

CREATE TABLE IF NOT EXISTS `icinga_objects` (
  `object_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `objecttype_id` smallint(6) NOT NULL default '0',
  `name1` varchar(128) character set latin1 NOT NULL default '',
  `name2` varchar(128) character set latin1 default NULL,
  `is_active` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`object_id`),
  KEY `objecttype_id` (`objecttype_id`,`name1`,`name2`)
) ENGINE=MyISAM  COMMENT='Current and historical objects of all kinds';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_processevents`
--

CREATE TABLE IF NOT EXISTS `icinga_processevents` (
  `processevent_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `event_type` smallint(6) NOT NULL default '0',
  `event_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `event_time_usec` int(11) NOT NULL default '0',
  `process_id` int(11) NOT NULL default '0',
  `program_name` varchar(16) character set latin1 NOT NULL default '',
  `program_version` varchar(20) character set latin1 NOT NULL default '',
  `program_date` varchar(10) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`processevent_id`)
) ENGINE=MyISAM  COMMENT='Historical Icinga process events';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_programstatus`
--

CREATE TABLE IF NOT EXISTS `icinga_programstatus` (
  `programstatus_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `status_update_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `program_start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `program_end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_currently_running` smallint(6) NOT NULL default '0',
  `process_id` int(11) NOT NULL default '0',
  `daemon_mode` smallint(6) NOT NULL default '0',
  `last_command_check` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_log_rotation` datetime NOT NULL default '0000-00-00 00:00:00',
  `notifications_enabled` smallint(6) NOT NULL default '0',
  `active_service_checks_enabled` smallint(6) NOT NULL default '0',
  `passive_service_checks_enabled` smallint(6) NOT NULL default '0',
  `active_host_checks_enabled` smallint(6) NOT NULL default '0',
  `passive_host_checks_enabled` smallint(6) NOT NULL default '0',
  `event_handlers_enabled` smallint(6) NOT NULL default '0',
  `flap_detection_enabled` smallint(6) NOT NULL default '0',
  `failure_prediction_enabled` smallint(6) NOT NULL default '0',
  `process_performance_data` smallint(6) NOT NULL default '0',
  `obsess_over_hosts` smallint(6) NOT NULL default '0',
  `obsess_over_services` smallint(6) NOT NULL default '0',
  `modified_host_attributes` int(11) NOT NULL default '0',
  `modified_service_attributes` int(11) NOT NULL default '0',
  `global_host_event_handler` varchar(255) character set latin1 NOT NULL default '',
  `global_service_event_handler` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`programstatus_id`),
  UNIQUE KEY `instance_id` (`instance_id`)
) ENGINE=MyISAM  COMMENT='Current program status information';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_runtimevariables`
--

CREATE TABLE IF NOT EXISTS `icinga_runtimevariables` (
  `runtimevariable_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `varname` varchar(64) character set latin1 NOT NULL default '',
  `varvalue` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`runtimevariable_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`varname`)
) ENGINE=MyISAM  COMMENT='Runtime variables from the Icinga daemon';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_scheduleddowntime`
--

CREATE TABLE IF NOT EXISTS `icinga_scheduleddowntime` (
  `scheduleddowntime_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `downtime_type` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `entry_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `author_name` varchar(64) character set latin1 NOT NULL default '',
  `comment_data` varchar(255) character set latin1 NOT NULL default '',
  `internal_downtime_id` int(11) NOT NULL default '0',
  `triggered_by_id` int(11) NOT NULL default '0',
  `is_fixed` smallint(6) NOT NULL default '0',
  `duration` smallint(6) NOT NULL default '0',
  `scheduled_start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `scheduled_end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `was_started` smallint(6) NOT NULL default '0',
  `actual_start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `actual_start_time_usec` int(11) NOT NULL default '0',
  PRIMARY KEY  (`scheduleddowntime_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`object_id`,`entry_time`,`internal_downtime_id`)
) ENGINE=MyISAM COMMENT='Current scheduled host and service downtime';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_servicechecks`
--

CREATE TABLE IF NOT EXISTS `icinga_servicechecks` (
  `servicecheck_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `service_object_id` int(11) NOT NULL default '0',
  `check_type` smallint(6) NOT NULL default '0',
  `current_check_attempt` smallint(6) NOT NULL default '0',
  `max_check_attempts` smallint(6) NOT NULL default '0',
  `state` smallint(6) NOT NULL default '0',
  `state_type` smallint(6) NOT NULL default '0',
  `start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `start_time_usec` int(11) NOT NULL default '0',
  `end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_time_usec` int(11) NOT NULL default '0',
  `command_object_id` int(11) NOT NULL default '0',
  `command_args` varchar(255) character set latin1 NOT NULL default '',
  `command_line` varchar(1024) character set latin1 NOT NULL default '',
  `timeout` smallint(6) NOT NULL default '0',
  `early_timeout` smallint(6) NOT NULL default '0',
  `execution_time` double NOT NULL default '0',
  `latency` double NOT NULL default '0',
  `return_code` smallint(6) NOT NULL default '0',
  `output` varchar(255) character set latin1 NOT NULL default '',
  `long_output` TEXT NOT NULL default '',
  `perfdata` TEXT character set latin1 NOT NULL default '',
  PRIMARY KEY  (`servicecheck_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`service_object_id`,`start_time`,`start_time_usec`)
) ENGINE=MyISAM  COMMENT='Historical service checks';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_servicedependencies`
--

CREATE TABLE IF NOT EXISTS `icinga_servicedependencies` (
  `servicedependency_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `service_object_id` int(11) NOT NULL default '0',
  `dependent_service_object_id` int(11) NOT NULL default '0',
  `dependency_type` smallint(6) NOT NULL default '0',
  `inherits_parent` smallint(6) NOT NULL default '0',
  `timeperiod_object_id` int(11) NOT NULL default '0',
  `fail_on_ok` smallint(6) NOT NULL default '0',
  `fail_on_warning` smallint(6) NOT NULL default '0',
  `fail_on_unknown` smallint(6) NOT NULL default '0',
  `fail_on_critical` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`servicedependency_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`config_type`,`service_object_id`,`dependent_service_object_id`,`dependency_type`,`inherits_parent`,`fail_on_ok`,`fail_on_warning`,`fail_on_unknown`,`fail_on_critical`)
) ENGINE=MyISAM COMMENT='Service dependency definitions';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_serviceescalations`
--

CREATE TABLE IF NOT EXISTS `icinga_serviceescalations` (
  `serviceescalation_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `service_object_id` int(11) NOT NULL default '0',
  `timeperiod_object_id` int(11) NOT NULL default '0',
  `first_notification` smallint(6) NOT NULL default '0',
  `last_notification` smallint(6) NOT NULL default '0',
  `notification_interval` double NOT NULL default '0',
  `escalate_on_recovery` smallint(6) NOT NULL default '0',
  `escalate_on_warning` smallint(6) NOT NULL default '0',
  `escalate_on_unknown` smallint(6) NOT NULL default '0',
  `escalate_on_critical` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`serviceescalation_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`config_type`,`service_object_id`,`timeperiod_object_id`,`first_notification`,`last_notification`)
) ENGINE=MyISAM  COMMENT='Service escalation definitions';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_serviceescalation_contactgroups`
--

CREATE TABLE IF NOT EXISTS `icinga_serviceescalation_contactgroups` (
  `serviceescalation_contactgroup_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `serviceescalation_id` int(11) NOT NULL default '0',
  `contactgroup_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`serviceescalation_contactgroup_id`),
  UNIQUE KEY `instance_id` (`serviceescalation_id`,`contactgroup_object_id`)
) ENGINE=MyISAM  COMMENT='Service escalation contact groups';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_serviceescalation_contacts`
--

CREATE TABLE IF NOT EXISTS `icinga_serviceescalation_contacts` (
  `serviceescalation_contact_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `serviceescalation_id` int(11) NOT NULL default '0',
  `contact_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`serviceescalation_contact_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`serviceescalation_id`,`contact_object_id`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

--
-- Table structure for table `icinga_servicegroups`
--

CREATE TABLE IF NOT EXISTS `icinga_servicegroups` (
  `servicegroup_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `servicegroup_object_id` int(11) NOT NULL default '0',
  `alias` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`servicegroup_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`config_type`,`servicegroup_object_id`)
) ENGINE=MyISAM  COMMENT='Servicegroup definitions';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_servicegroup_members`
--

CREATE TABLE IF NOT EXISTS `icinga_servicegroup_members` (
  `servicegroup_member_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `servicegroup_id` int(11) NOT NULL default '0',
  `service_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`servicegroup_member_id`),
  UNIQUE KEY `instance_id` (`servicegroup_id`,`service_object_id`)
) ENGINE=MyISAM  COMMENT='Servicegroup members';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_services`
--

CREATE TABLE IF NOT EXISTS `icinga_services` (
  `service_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `host_object_id` int(11) NOT NULL default '0',
  `service_object_id` int(11) NOT NULL default '0',
  `display_name` varchar(64) character set latin1 NOT NULL default '',
  `check_command_object_id` int(11) NOT NULL default '0',
  `check_command_args` varchar(255) character set latin1 NOT NULL default '',
  `eventhandler_command_object_id` int(11) NOT NULL default '0',
  `eventhandler_command_args` varchar(255) character set latin1 NOT NULL default '',
  `notification_timeperiod_object_id` int(11) NOT NULL default '0',
  `check_timeperiod_object_id` int(11) NOT NULL default '0',
  `failure_prediction_options` varchar(64) character set latin1 NOT NULL default '',
  `check_interval` double NOT NULL default '0',
  `retry_interval` double NOT NULL default '0',
  `max_check_attempts` smallint(6) NOT NULL default '0',
  `first_notification_delay` double NOT NULL default '0',
  `notification_interval` double NOT NULL default '0',
  `notify_on_warning` smallint(6) NOT NULL default '0',
  `notify_on_unknown` smallint(6) NOT NULL default '0',
  `notify_on_critical` smallint(6) NOT NULL default '0',
  `notify_on_recovery` smallint(6) NOT NULL default '0',
  `notify_on_flapping` smallint(6) NOT NULL default '0',
  `notify_on_downtime` smallint(6) NOT NULL default '0',
  `stalk_on_ok` smallint(6) NOT NULL default '0',
  `stalk_on_warning` smallint(6) NOT NULL default '0',
  `stalk_on_unknown` smallint(6) NOT NULL default '0',
  `stalk_on_critical` smallint(6) NOT NULL default '0',
  `is_volatile` smallint(6) NOT NULL default '0',
  `flap_detection_enabled` smallint(6) NOT NULL default '0',
  `flap_detection_on_ok` smallint(6) NOT NULL default '0',
  `flap_detection_on_warning` smallint(6) NOT NULL default '0',
  `flap_detection_on_unknown` smallint(6) NOT NULL default '0',
  `flap_detection_on_critical` smallint(6) NOT NULL default '0',
  `low_flap_threshold` double NOT NULL default '0',
  `high_flap_threshold` double NOT NULL default '0',
  `process_performance_data` smallint(6) NOT NULL default '0',
  `freshness_checks_enabled` smallint(6) NOT NULL default '0',
  `freshness_threshold` smallint(6) NOT NULL default '0',
  `passive_checks_enabled` smallint(6) NOT NULL default '0',
  `event_handler_enabled` smallint(6) NOT NULL default '0',
  `active_checks_enabled` smallint(6) NOT NULL default '0',
  `retain_status_information` smallint(6) NOT NULL default '0',
  `retain_nonstatus_information` smallint(6) NOT NULL default '0',
  `notifications_enabled` smallint(6) NOT NULL default '0',
  `obsess_over_service` smallint(6) NOT NULL default '0',
  `failure_prediction_enabled` smallint(6) NOT NULL default '0',
  `notes` varchar(255) character set latin1 NOT NULL default '',
  `notes_url` varchar(255) character set latin1 NOT NULL default '',
  `action_url` varchar(255) character set latin1 NOT NULL default '',
  `icon_image` varchar(255) character set latin1 NOT NULL default '',
  `icon_image_alt` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`service_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`config_type`,`service_object_id`),
  KEY `service_object_id` (`service_object_id`)
) ENGINE=MyISAM  COMMENT='Service definitions';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_servicestatus`
--

CREATE TABLE IF NOT EXISTS `icinga_servicestatus` (
  `servicestatus_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `service_object_id` int(11) NOT NULL default '0',
  `status_update_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `output` varchar(255) character set latin1 NOT NULL default '',
  `long_output` TEXT NOT NULL default '',
  `perfdata` TEXT character set latin1 NOT NULL default '',
  `current_state` smallint(6) NOT NULL default '0',
  `has_been_checked` smallint(6) NOT NULL default '0',
  `should_be_scheduled` smallint(6) NOT NULL default '0',
  `current_check_attempt` smallint(6) NOT NULL default '0',
  `max_check_attempts` smallint(6) NOT NULL default '0',
  `last_check` datetime NOT NULL default '0000-00-00 00:00:00',
  `next_check` datetime NOT NULL default '0000-00-00 00:00:00',
  `check_type` smallint(6) NOT NULL default '0',
  `last_state_change` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_hard_state_change` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_hard_state` smallint(6) NOT NULL default '0',
  `last_time_ok` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_time_warning` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_time_unknown` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_time_critical` datetime NOT NULL default '0000-00-00 00:00:00',
  `state_type` smallint(6) NOT NULL default '0',
  `last_notification` datetime NOT NULL default '0000-00-00 00:00:00',
  `next_notification` datetime NOT NULL default '0000-00-00 00:00:00',
  `no_more_notifications` smallint(6) NOT NULL default '0',
  `notifications_enabled` smallint(6) NOT NULL default '0',
  `problem_has_been_acknowledged` smallint(6) NOT NULL default '0',
  `acknowledgement_type` smallint(6) NOT NULL default '0',
  `current_notification_number` smallint(6) NOT NULL default '0',
  `passive_checks_enabled` smallint(6) NOT NULL default '0',
  `active_checks_enabled` smallint(6) NOT NULL default '0',
  `event_handler_enabled` smallint(6) NOT NULL default '0',
  `flap_detection_enabled` smallint(6) NOT NULL default '0',
  `is_flapping` smallint(6) NOT NULL default '0',
  `percent_state_change` double NOT NULL default '0',
  `latency` double NOT NULL default '0',
  `execution_time` double NOT NULL default '0',
  `scheduled_downtime_depth` smallint(6) NOT NULL default '0',
  `failure_prediction_enabled` smallint(6) NOT NULL default '0',
  `process_performance_data` smallint(6) NOT NULL default '0',
  `obsess_over_service` smallint(6) NOT NULL default '0',
  `modified_service_attributes` int(11) NOT NULL default '0',
  `event_handler` varchar(255) character set latin1 NOT NULL default '',
  `check_command` varchar(255) character set latin1 NOT NULL default '',
  `normal_check_interval` double NOT NULL default '0',
  `retry_check_interval` double NOT NULL default '0',
  `check_timeperiod_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`servicestatus_id`),
  UNIQUE KEY `object_id` (`service_object_id`)
) ENGINE=MyISAM  COMMENT='Current service status information';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_service_contactgroups`
--

CREATE TABLE IF NOT EXISTS `icinga_service_contactgroups` (
  `service_contactgroup_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `service_id` int(11) NOT NULL default '0',
  `contactgroup_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`service_contactgroup_id`),
  UNIQUE KEY `instance_id` (`service_id`,`contactgroup_object_id`)
) ENGINE=MyISAM  COMMENT='Service contact groups';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_service_contacts`
--

CREATE TABLE IF NOT EXISTS `icinga_service_contacts` (
  `service_contact_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `service_id` int(11) NOT NULL default '0',
  `contact_object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`service_contact_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`service_id`,`contact_object_id`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

--
-- Table structure for table `icinga_statehistory`
--

CREATE TABLE IF NOT EXISTS `icinga_statehistory` (
  `statehistory_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `state_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state_time_usec` int(11) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `state_change` smallint(6) NOT NULL default '0',
  `state` smallint(6) NOT NULL default '0',
  `state_type` smallint(6) NOT NULL default '0',
  `current_check_attempt` smallint(6) NOT NULL default '0',
  `max_check_attempts` smallint(6) NOT NULL default '0',
  `last_state` smallint(6) NOT NULL default '-1',
  `last_hard_state` smallint(6) NOT NULL default '-1',
  `output` varchar(255) character set latin1 NOT NULL default '',
  `long_output` TEXT NOT NULL default '',
  PRIMARY KEY  (`statehistory_id`)
) ENGINE=MyISAM COMMENT='Historical host and service state changes';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_systemcommands`
--

CREATE TABLE IF NOT EXISTS `icinga_systemcommands` (
  `systemcommand_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `start_time_usec` int(11) NOT NULL default '0',
  `end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_time_usec` int(11) NOT NULL default '0',
  `command_line` varchar(1024) character set latin1 NOT NULL default '',
  `timeout` smallint(6) NOT NULL default '0',
  `early_timeout` smallint(6) NOT NULL default '0',
  `execution_time` double NOT NULL default '0',
  `return_code` smallint(6) NOT NULL default '0',
  `output` varchar(255) character set latin1 NOT NULL default '',
  `long_output` TEXT NOT NULL default '',
  PRIMARY KEY  (`systemcommand_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`start_time`,`start_time_usec`)
) ENGINE=MyISAM  COMMENT='Historical system commands that are executed';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_timedeventqueue`
--

CREATE TABLE IF NOT EXISTS `icinga_timedeventqueue` (
  `timedeventqueue_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `event_type` smallint(6) NOT NULL default '0',
  `queued_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `queued_time_usec` int(11) NOT NULL default '0',
  `scheduled_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `recurring_event` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`timedeventqueue_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`event_type`,`scheduled_time`,`object_id`)
) ENGINE=MyISAM  COMMENT='Current Icinga event queue';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_timedevents`
--

CREATE TABLE IF NOT EXISTS `icinga_timedevents` (
  `timedevent_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `event_type` smallint(6) NOT NULL default '0',
  `queued_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `queued_time_usec` int(11) NOT NULL default '0',
  `event_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `event_time_usec` int(11) NOT NULL default '0',
  `scheduled_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `recurring_event` smallint(6) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `deletion_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `deletion_time_usec` int(11) NOT NULL default '0',
  PRIMARY KEY  (`timedevent_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`event_type`,`scheduled_time`,`object_id`)
) ENGINE=MyISAM  COMMENT='Historical events from the Icinga event queue';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_timeperiods`
--

CREATE TABLE IF NOT EXISTS `icinga_timeperiods` (
  `timeperiod_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `config_type` smallint(6) NOT NULL default '0',
  `timeperiod_object_id` int(11) NOT NULL default '0',
  `alias` varchar(255) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`timeperiod_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`config_type`,`timeperiod_object_id`)
) ENGINE=MyISAM  COMMENT='Timeperiod definitions';

-- --------------------------------------------------------

--
-- Table structure for table `icinga_timeperiod_timeranges`
--

CREATE TABLE IF NOT EXISTS `icinga_timeperiod_timeranges` (
  `timeperiod_timerange_id` int(11) NOT NULL auto_increment,
  `instance_id` smallint(6) NOT NULL default '0',
  `timeperiod_id` int(11) NOT NULL default '0',
  `day` smallint(6) NOT NULL default '0',
  `start_sec` int(11) NOT NULL default '0',
  `end_sec` int(11) NOT NULL default '0',
  PRIMARY KEY  (`timeperiod_timerange_id`),
  UNIQUE KEY `instance_id` (`timeperiod_id`,`day`,`start_sec`,`end_sec`)
) ENGINE=MyISAM  COMMENT='Timeperiod definitions';


-- -----------------------------------------
-- add index (delete)
-- -----------------------------------------

-- for periodic delete 
-- instance_id and
-- TIMEDEVENTS => scheduled_time
-- SYSTEMCOMMANDS, SERVICECHECKS, HOSTCHECKS, EVENTHANDLERS  => start_time
-- EXTERNALCOMMANDS => entry_time

-- instance_id
CREATE INDEX timedevents_i_id_idx on icinga_timedevents(instance_id);
CREATE INDEX timedeventq_i_id_idx on icinga_timedeventqueue(instance_id);
CREATE INDEX systemcommands_i_id_idx on icinga_systemcommands(instance_id);
CREATE INDEX servicechecks_i_id_idx on icinga_servicechecks(instance_id);
CREATE INDEX hostchecks_i_id_idx on icinga_hostchecks(instance_id);
CREATE INDEX eventhandlers_i_id_idx on icinga_eventhandlers(instance_id);
CREATE INDEX externalcommands_i_id_idx on icinga_externalcommands(instance_id);

-- time
CREATE INDEX timedevents_time_id_idx on icinga_timedevents(scheduled_time);
CREATE INDEX timedeventq_time_id_idx on icinga_timedeventqueue(scheduled_time);
CREATE INDEX systemcommands_time_id_idx on icinga_systemcommands(start_time);
CREATE INDEX servicechecks_time_id_idx on icinga_servicechecks(start_time);
CREATE INDEX hostchecks_time_id_idx on icinga_hostchecks(start_time);
CREATE INDEX eventhandlers_time_id_idx on icinga_eventhandlers(start_time);
CREATE INDEX externalcommands_time_id_idx on icinga_externalcommands(entry_time);


-- for starting cleanup - referenced in dbhandler.c:882
-- instance_id only

-- realtime data
CREATE INDEX programstatus_i_id_idx on icinga_programstatus(instance_id);
CREATE INDEX hoststatus_i_id_idx on icinga_hoststatus(instance_id);
CREATE INDEX servicestatus_i_id_idx on icinga_servicestatus(instance_id);
CREATE INDEX contactstatus_i_id_idx on icinga_contactstatus(instance_id);
CREATE INDEX timedeventqueue_i_id_idx on icinga_timedeventqueue(instance_id);
CREATE INDEX comments_i_id_idx on icinga_comments(instance_id);
CREATE INDEX scheduleddowntime_i_id_idx on icinga_scheduleddowntime(instance_id);
CREATE INDEX runtimevariables_i_id_idx on icinga_runtimevariables(instance_id);
CREATE INDEX customvariablestatus_i_id_idx on icinga_customvariablestatus(instance_id);

-- config data
CREATE INDEX configfiles_i_id_idx on icinga_configfiles(instance_id);
CREATE INDEX configfilevariables_i_id_idx on icinga_configfilevariables(instance_id);
CREATE INDEX customvariables_i_id_idx on icinga_customvariables(instance_id);
CREATE INDEX commands_i_id_idx on icinga_commands(instance_id);
CREATE INDEX timeperiods_i_id_idx on icinga_timeperiods(instance_id);
CREATE INDEX timeperiod_timeranges_i_id_idx on icinga_timeperiod_timeranges(instance_id);
CREATE INDEX contactgroups_i_id_idx on icinga_contactgroups(instance_id);
CREATE INDEX contactgroup_members_i_id_idx on icinga_contactgroup_members(instance_id);
CREATE INDEX hostgroups_i_id_idx on icinga_hostgroups(instance_id);
CREATE INDEX hostgroup_members_i_id_idx on icinga_hostgroup_members(instance_id);
CREATE INDEX servicegroups_i_id_idx on icinga_servicegroups(instance_id);
CREATE INDEX servicegroup_members_i_id_idx on icinga_servicegroup_members(instance_id);
CREATE INDEX hostesc_i_id_idx on icinga_hostescalations(instance_id);
CREATE INDEX hostesc_contacts_i_id_idx on icinga_hostescalation_contacts(instance_id);
CREATE INDEX serviceesc_i_id_idx on icinga_serviceescalations(instance_id);
CREATE INDEX serviceesc_contacts_i_id_idx on icinga_serviceescalation_contacts(instance_id);
CREATE INDEX hostdependencies_i_id_idx on icinga_hostdependencies(instance_id);
CREATE INDEX contacts_i_id_idx on icinga_contacts(instance_id);
CREATE INDEX contact_addresses_i_id_idx on icinga_contact_addresses(instance_id);
CREATE INDEX contact_notifcommands_i_id_idx on icinga_contact_notificationcommands(instance_id);
CREATE INDEX hosts_i_id_idx on icinga_hosts(instance_id);
CREATE INDEX host_parenthosts_i_id_idx on icinga_host_parenthosts(instance_id);
CREATE INDEX host_contacts_i_id_idx on icinga_host_contacts(instance_id);
CREATE INDEX services_i_id_idx on icinga_services(instance_id);
CREATE INDEX service_contacts_i_id_idx on icinga_service_contacts(instance_id);
CREATE INDEX service_contactgroups_i_id_idx on icinga_service_contactgroups(instance_id);
CREATE INDEX host_contactgroups_i_id_idx on icinga_host_contactgroups(instance_id);
CREATE INDEX hostesc_cgroups_i_id_idx on icinga_hostescalation_contactgroups(instance_id);
CREATE INDEX serviceesc_cgroups_i_id_idx on icinga_serviceescalation_contactgroups(instance_id);

-- -----------------------------------------
-- more index stuff (WHERE clauses)
-- -----------------------------------------

-- hosts
CREATE INDEX hosts_host_object_id_idx on icinga_hosts(host_object_id);

-- hoststatus
CREATE INDEX hoststatus_stat_upd_time_idx on icinga_hoststatus(status_update_time);
CREATE INDEX hoststatus_current_state_idx on icinga_hoststatus(current_state);
CREATE INDEX hoststatus_check_type_idx on icinga_hoststatus(check_type);
CREATE INDEX hoststatus_state_type_idx on icinga_hoststatus(state_type);
CREATE INDEX hoststatus_last_state_chg_idx on icinga_hoststatus(last_state_change);
CREATE INDEX hoststatus_notif_enabled_idx on icinga_hoststatus(notifications_enabled);
CREATE INDEX hoststatus_problem_ack_idx on icinga_hoststatus(problem_has_been_acknowledged);
CREATE INDEX hoststatus_act_chks_en_idx on icinga_hoststatus(active_checks_enabled);
CREATE INDEX hoststatus_pas_chks_en_idx on icinga_hoststatus(passive_checks_enabled);
CREATE INDEX hoststatus_event_hdl_en_idx on icinga_hoststatus(event_handler_enabled);
CREATE INDEX hoststatus_flap_det_en_idx on icinga_hoststatus(flap_detection_enabled);
CREATE INDEX hoststatus_is_flapping_idx on icinga_hoststatus(is_flapping);
CREATE INDEX hoststatus_p_state_chg_idx on icinga_hoststatus(percent_state_change);
CREATE INDEX hoststatus_latency_idx on icinga_hoststatus(latency);
CREATE INDEX hoststatus_ex_time_idx on icinga_hoststatus(execution_time);
CREATE INDEX hoststatus_sch_downt_d_idx on icinga_hoststatus(scheduled_downtime_depth);

-- services
CREATE INDEX services_host_object_id_idx on icinga_services(host_object_id);

-- servicestatus
CREATE INDEX srvcstatus_stat_upd_time_idx on icinga_servicestatus(status_update_time);
CREATE INDEX srvcstatus_current_state_idx on icinga_servicestatus(current_state);
CREATE INDEX srvcstatus_check_type_idx on icinga_servicestatus(check_type);
CREATE INDEX srvcstatus_state_type_idx on icinga_servicestatus(state_type);
CREATE INDEX srvcstatus_last_state_chg_idx on icinga_servicestatus(last_state_change);
CREATE INDEX srvcstatus_notif_enabled_idx on icinga_servicestatus(notifications_enabled);
CREATE INDEX srvcstatus_problem_ack_idx on icinga_servicestatus(problem_has_been_acknowledged);
CREATE INDEX srvcstatus_act_chks_en_idx on icinga_servicestatus(active_checks_enabled);
CREATE INDEX srvcstatus_pas_chks_en_idx on icinga_servicestatus(passive_checks_enabled);
CREATE INDEX srvcstatus_event_hdl_en_idx on icinga_servicestatus(event_handler_enabled);
CREATE INDEX srvcstatus_flap_det_en_idx on icinga_servicestatus(flap_detection_enabled);
CREATE INDEX srvcstatus_is_flapping_idx on icinga_servicestatus(is_flapping);
CREATE INDEX srvcstatus_p_state_chg_idx on icinga_servicestatus(percent_state_change);
CREATE INDEX srvcstatus_latency_idx on icinga_servicestatus(latency);
CREATE INDEX srvcstatus_ex_time_idx on icinga_servicestatus(execution_time);
CREATE INDEX srvcstatus_sch_downt_d_idx on icinga_servicestatus(scheduled_downtime_depth);

-- timedeventqueue
CREATE INDEX timed_e_q_event_type_idx on icinga_timedeventqueue(event_type);
CREATE INDEX timed_e_q_sched_time_idx on icinga_timedeventqueue(scheduled_time);
CREATE INDEX timed_e_q_object_id_idx on icinga_timedeventqueue(object_id);
CREATE INDEX timed_e_q_rec_ev_id_idx on icinga_timedeventqueue(recurring_event);

-- timedevents
CREATE INDEX timed_e_event_type_idx on icinga_timedevents(event_type);
-- CREATE INDEX timed_e_sched_time_idx on icinga_timedevents(scheduled_time); --already set for delete
CREATE INDEX timed_e_object_id_idx on icinga_timedevents(object_id);
CREATE INDEX timed_e_rec_ev_idx on icinga_timedevents(recurring_event);

-- hostchecks
CREATE INDEX hostchks_h_obj_id_idx on icinga_hostchecks(host_object_id);

-- servicechecks
CREATE INDEX servicechks_s_obj_id_idx on icinga_servicechecks(service_object_id);

-- objects
CREATE INDEX objects_objtype_id_idx ON icinga_objects(objecttype_id);
CREATE INDEX objects_name1_idx ON icinga_objects(name1);
CREATE INDEX objects_name2_idx ON icinga_objects(name2);
CREATE INDEX objects_inst_id_idx ON icinga_objects(instance_id);


-- hostchecks
-- CREATE INDEX hostchks_h_obj_id_idx on icinga_hostchecks(host_object_id);

-- servicechecks
-- CREATE INDEX servicechks_s_obj_id_idx on icinga_servicechecks(service_object_id);


-- instances
-- CREATE INDEX instances_name_idx on icinga_instances(instance_name);

-- logentries
-- CREATE INDEX loge_instance_id_idx on icinga_logentries(instance_id);
-- #236
CREATE INDEX loge_time_idx on icinga_logentries(logentry_time);
-- CREATE INDEX loge_data_idx on icinga_logentries(logentry_data);

-- commenthistory
-- CREATE INDEX c_hist_instance_id_idx on icinga_logentries(instance_id);
-- CREATE INDEX c_hist_c_time_idx on icinga_logentries(comment_time);
-- CREATE INDEX c_hist_i_c_id_idx on icinga_logentries(internal_comment_id);

-- downtimehistory
-- CREATE INDEX d_t_hist_nstance_id_idx on icinga_downtimehistory(instance_id);
-- CREATE INDEX d_t_hist_type_idx on icinga_downtimehistory(downtime_type);
-- CREATE INDEX d_t_hist_object_id_idx on icinga_downtimehistory(object_id);
-- CREATE INDEX d_t_hist_entry_time_idx on icinga_downtimehistory(entry_time);
-- CREATE INDEX d_t_hist_sched_start_idx on icinga_downtimehistory(scheduled_start_time);
-- CREATE INDEX d_t_hist_sched_end_idx on icinga_downtimehistory(scheduled_end_time);

-- scheduleddowntime
-- CREATE INDEX sched_d_t_downtime_type_idx on icinga_scheduleddowntime(downtime_type);
-- CREATE INDEX sched_d_t_object_id_idx on icinga_scheduleddowntime(object_id);
-- CREATE INDEX sched_d_t_entry_time_idx on icinga_scheduleddowntime(entry_time);
-- CREATE INDEX sched_d_t_start_time_idx on icinga_scheduleddowntime(scheduled_start_time);
-- CREATE INDEX sched_d_t_end_time_idx on icinga_scheduleddowntime(scheduled_end_time);
