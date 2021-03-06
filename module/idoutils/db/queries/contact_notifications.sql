SELECT 
icinga_instances.instance_id
,icinga_instances.instance_name
,icinga_notifications.object_id
,obj1.objecttype_id
,obj1.name1 AS host_name
,obj1.name2 AS service_description
,obj2.name1 AS contact_name
,icinga_contactnotifications.*
FROM `icinga_contactnotifications`
JOIN icinga_notifications ON icinga_contactnotifications.notification_id=icinga_notifications.notification_id
LEFT JOIN icinga_objects as obj1 ON icinga_notifications.object_id=obj1.object_id
LEFT JOIN icinga_objects as obj2 ON icinga_contactnotifications.contact_object_id=obj2.object_id
LEFT JOIN icinga_instances ON icinga_notifications.instance_id=icinga_instances.instance_id
ORDER BY start_time DESC, start_time_usec DESC

