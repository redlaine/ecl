UPDATE `creature` SET `modelid` = '21379' WHERE `id` IN (3296);
UPDATE `creature` SET `modelid` = '29516' WHERE `id` IN (68);

REPLACE INTO `creature_template` VALUES ('3296', '0', '0', '0', '0', '0', '21379', '21379', '21379', '21379', 'Orgrimmar Grunt', null, 'Directions', '1951', '75', '75', '2', '85', '85', '1', '1', '1.14286', '1', '0', '1300', '3000', '0', '127', '1', '2000', '2000', '1', '36864', '2048', '8', '0', '0', '0', '0', '0', '272', '408', '102', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '93822', '52262', '23170', '23169', '23155', '23153', '23154', '0', '0', '0', '0', '0', '', '0', '3', '1', '1.5', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '32768', 'guard_generic', '12340');
REPLACE INTO `creature_template` VALUES ('68', '0', '0', '0', '0', '0', '29516', '29516', '29516', '29516', 'Stormwind City Guard', null, 'Directions', '435', '75', '75', '2', '11', '11', '1', '1.2', '1.14286', '1', '0', '1300', '3000', '0', '96', '1', '1500', '1500', '1', '32768', '2048', '8', '0', '0', '0', '0', '0', '204', '306', '77', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '93822', '52262', '23170', '23169', '23155', '23153', '23154', '0', '0', '0', '0', '0', '', '0', '3', '1', '1.5', '1', '1', '0', '0', '0', '0', '0', '0', '0', '144', '1', '0', '32768', 'guard_generic', '12340');