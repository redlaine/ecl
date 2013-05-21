DELETE FROM `account_achievement`;

INSERT INTO `account_achievement`
SELECT      `c`.`account`,
            `a`.`achievement`,
            `a`.`date`
FROM        `character_achievement` `a`,
            `characters` `c`
GROUP BY    `c`.`account`,
            `a`.`achievement`;

DELETE FROM `account_achievement_progress`;

INSERT INTO `account_achievement_progress`
SELECT      `c`.`account`,
            `a`.`criteria`,
            MAX(`a`.`counter`), /* can SUM() */
            `a`.`date`
FROM        `character_achievement_progress` `a`,
            `characters` `c`
GROUP BY    `c`.`account`,
            `a`.`criteria`;SET @NPC = 50000;

DELETE FROM `creature_template` WHERE `entry` = @NPC;
INSERT INTO `creature_template` (`entry`, `modelid1`, `name`, `subname`, `faction_A`, `faction_H`, `npcflag`, `unit_class`, `type`, `ScriptName`) VALUES
(@NPC, '10913', 'Eye', 'Arena watcher', '35', '35', '1', '1', '7', 'npc_arena_watcher');

DELETE FROM `creature_text` WHERE `entry` = @NPC;
INSERT INTO `creature_text` (`entry`, `groupid`, `text`, `type`, `comment`) VALUES
(@NPC, '0', 'Sorry matches at the moment there is no', '15', 'ArenaWatcher'),
(@NPC, '1', 'The match has been completed', '15', 'ArenaWatcher'),
(@NPC, '2', 'Target is offline', '15', 'ArenaWatcher'),
(@NPC, '3', 'Target not in arena', '15', 'ArenaWatcher'),
(@NPC, '4', 'Target is GameMaster', '15', 'ArenaWatcher');

DELETE FROM `locales_creature_text` WHERE `entry` = @NPC;
INSERT INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc8`) VALUES
(@NPC, '0', '0', 'В данный момент матчей нет'),
(@NPC, '1', '0', 'Матч уже завершен'),
(@NPC, '2', '0', 'Игрок не в сети'),
(@NPC, '3', '0', 'Игрок не на арене'),
(@NPC, '4', '0', 'Нельзя следить за игровым мастером');

DELETE FROM `trinity_string` WHERE `entry` BETWEEN 11200 AND 11203;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc8`) VALUES
('11200', 'Watch the match 2x2 (now games: %u)', 'Смотреть матч 2х2 (сейчас игр: %u)'),
('11201', 'Watch the match 3x3 (now games: %u)', 'Смотреть матч 3х3 (сейчас игр: %u)'),
('11202', 'Watch the match 5x5 (now games: %u)', 'Смотреть матч 5х5 (сейчас игр: %u)'),
('11203', 'Follow player', 'Следить за игроком');SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `world_auction`
-- ----------------------------
DROP TABLE IF EXISTS `world_auction`;
CREATE TABLE `world_auction` (
  `ItemId` int(10) unsigned NOT NULL,
  `ItemCount` int(10) unsigned NOT NULL,
  `ItemStack` int(10) unsigned NOT NULL,
  `StartBind` int(10) unsigned NOT NULL,
  `BuyOut` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ItemId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `world_autolearn`
-- ----------------------------
DROP TABLE IF EXISTS `world_autolearn`;
CREATE TABLE `world_autolearn` (
  `SpellId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SpellMask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredClassMask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredRaceMask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredSpellId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillValue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Comment` varchar(255) NOT NULL,
  PRIMARY KEY (`SpellId`,`RequiredLevel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of world_autolearn
-- ----------------------------
INSERT INTO `world_autolearn` VALUES ('33388', '2', '0', '0', '20', '0', '0', '0', 'Верховая езда (ученик)');
INSERT INTO `world_autolearn` VALUES ('33391', '2', '0', '0', '40', '0', '0', '0', 'Верховая езда (подмастерье)');
INSERT INTO `world_autolearn` VALUES ('34090', '2', '0', '0', '60', '0', '0', '0', 'Верховая езда (умелец)');
INSERT INTO `world_autolearn` VALUES ('34091', '2', '0', '0', '70', '0', '0', '0', 'Верховая езда (искусник)');
INSERT INTO `world_autolearn` VALUES ('54197', '2', '0', '0', '77', '0', '0', '0', 'Полеты в непогоду');
INSERT INTO `world_autolearn` VALUES ('5011', '8', '13', '0', '0', '0', '0', '0', 'Арбалеты');
INSERT INTO `world_autolearn` VALUES ('264', '8', '13', '0', '0', '0', '0', '0', 'Луки');
INSERT INTO `world_autolearn` VALUES ('266', '8', '13', '0', '0', '0', '0', '0', 'Ружья');
INSERT INTO `world_autolearn` VALUES ('2567', '8', '9', '0', '0', '0', '0', '0', 'Метательное оружие');
INSERT INTO `world_autolearn` VALUES ('1180', '8', '1501', '0', '0', '0', '0', '0', 'Кинжалы');
INSERT INTO `world_autolearn` VALUES ('15590', '8', '1101', '0', '0', '0', '0', '0', 'Кулачное оружие');
INSERT INTO `world_autolearn` VALUES ('198', '8', '1147', '0', '0', '0', '0', '0', 'Одноручное дробящее оружие');
INSERT INTO `world_autolearn` VALUES ('201', '8', '431', '0', '0', '0', '0', '0', 'Одноручные мечи');
INSERT INTO `world_autolearn` VALUES ('196', '8', '111', '0', '0', '0', '0', '0', 'Одноручные топоры');
INSERT INTO `world_autolearn` VALUES ('202', '8', '39', '0', '0', '0', '0', '0', 'Двуручные мечи');
INSERT INTO `world_autolearn` VALUES ('197', '8', '103', '0', '0', '0', '0', '0', 'Двуручные топоры');
INSERT INTO `world_autolearn` VALUES ('200', '8', '1063', '0', '20', '0', '0', '0', 'Древковое оружие');
INSERT INTO `world_autolearn` VALUES ('227', '8', '1493', '0', '0', '0', '0', '0', 'Посохи');
INSERT INTO `world_autolearn` VALUES ('199', '8', '1123', '0', '0', '0', '0', '0', 'Двуручное дробящее оружие');
INSERT INTO `world_autolearn` VALUES ('458', '4', '0', '1', '20', '0', '0', '0', 'Гнедой конь');
INSERT INTO `world_autolearn` VALUES ('23228', '4', '0', '1', '40', '0', '0', '0', 'Стремительный белый рысак');
INSERT INTO `world_autolearn` VALUES ('64658', '4', '0', '2', '20', '0', '0', '0', 'Черный волк');
INSERT INTO `world_autolearn` VALUES ('23251', '4', '0', '2', '40', '0', '0', '0', 'Стремительный лесной волк');
INSERT INTO `world_autolearn` VALUES ('6898', '4', '0', '4', '20', '0', '0', '0', 'Белый баран');
INSERT INTO `world_autolearn` VALUES ('23240', '4', '0', '4', '40', '0', '0', '0', 'Стремительный белый баран');
INSERT INTO `world_autolearn` VALUES ('8394', '4', '0', '8', '20', '0', '0', '0', 'Полосатый ледопард');
INSERT INTO `world_autolearn` VALUES ('23221', '4', '0', '8', '40', '0', '0', '0', 'Стремительный ледопард');
INSERT INTO `world_autolearn` VALUES ('64977', '4', '0', '16', '20', '0', '0', '0', 'Черный конь-скелет');
INSERT INTO `world_autolearn` VALUES ('23246', '4', '0', '16', '40', '0', '0', '0', 'Лиловый боевой конь-скелет');
INSERT INTO `world_autolearn` VALUES ('64657', '4', '0', '32', '20', '0', '0', '0', 'Белый кодо');
INSERT INTO `world_autolearn` VALUES ('23248', '4', '0', '32', '40', '0', '0', '0', 'Огромный серый кодо');
INSERT INTO `world_autolearn` VALUES ('10873', '4', '0', '64', '20', '0', '0', '0', 'Красный механодолгоног');
INSERT INTO `world_autolearn` VALUES ('23225', '4', '0', '64', '40', '0', '0', '0', 'Стремительный зеленый механодолгоног');
INSERT INTO `world_autolearn` VALUES ('8395', '4', '0', '128', '20', '0', '0', '0', 'Изумрудный ящер');
INSERT INTO `world_autolearn` VALUES ('23241', '4', '0', '128', '40', '0', '0', '0', 'Стремительный синий ящер');
INSERT INTO `world_autolearn` VALUES ('35022', '4', '0', '512', '20', '0', '0', '0', 'Черный крылобег');
INSERT INTO `world_autolearn` VALUES ('33660', '4', '0', '512', '40', '0', '0', '0', 'Стремительный розовый крылобег');
INSERT INTO `world_autolearn` VALUES ('35710', '4', '0', '1024', '20', '0', '0', '0', 'Серый элекк');
INSERT INTO `world_autolearn` VALUES ('35713', '4', '0', '1024', '40', '0', '0', '0', 'Большой синий элекк');
INSERT INTO `world_autolearn` VALUES ('32240', '4', '0', '1101', '60', '0', '0', '0', 'Белоснежный грифон');
INSERT INTO `world_autolearn` VALUES ('32243', '4', '0', '690', '60', '0', '0', '0', 'Рыжий ветрокрыл');
INSERT INTO `world_autolearn` VALUES ('32289', '4', '0', '1101', '70', '0', '0', '0', 'Стремительный красный грифон');
INSERT INTO `world_autolearn` VALUES ('32246', '4', '0', '690', '70', '0', '0', '0', 'Стремительный красный ветрокрыл');
INSERT INTO `world_autolearn` VALUES ('1784', '1', '8', '0', '0', '0', '0', '0', 'Незаметность');
INSERT INTO `world_autolearn` VALUES ('53', '1', '8', '0', '4', '0', '0', '0', 'УдарвспинуУровень1');
INSERT INTO `world_autolearn` VALUES ('921', '1', '8', '0', '4', '0', '0', '0', 'Обшариваниекарманов');
INSERT INTO `world_autolearn` VALUES ('1757', '1', '8', '0', '6', '1752', '0', '0', 'КоварныйударУровень2');
INSERT INTO `world_autolearn` VALUES ('1776', '1', '8', '0', '6', '0', '0', '0', 'Парализующийудар');
INSERT INTO `world_autolearn` VALUES ('6760', '1', '8', '0', '8', '2098', '0', '0', 'ПотрошениеУровень2');
INSERT INTO `world_autolearn` VALUES ('5277', '1', '8', '0', '8', '0', '0', '0', 'УскользаниеУровень1');
INSERT INTO `world_autolearn` VALUES ('2983', '1', '8', '0', '10', '0', '0', '0', 'СпринтУровень1');
INSERT INTO `world_autolearn` VALUES ('6770', '1', '8', '0', '10', '0', '0', '0', 'ОшеломлениеУровень1');
INSERT INTO `world_autolearn` VALUES ('5171', '1', '8', '0', '10', '0', '0', '0', 'МясорубкаУровень1');
INSERT INTO `world_autolearn` VALUES ('674', '1', '5', '0', '20', '0', '0', '0', 'БойдвумяоружиямиПассивная');
INSERT INTO `world_autolearn` VALUES ('2589', '1', '8', '0', '12', '53', '0', '0', 'УдарвспинуУровень2');
INSERT INTO `world_autolearn` VALUES ('1766', '1', '8', '0', '12', '0', '0', '0', 'Пинок');
INSERT INTO `world_autolearn` VALUES ('3127', '1', '6', '0', '8', '0', '0', '0', 'ПарированиеПассивная');
INSERT INTO `world_autolearn` VALUES ('1758', '1', '8', '0', '14', '1752', '0', '0', 'КоварныйударУровень3');
INSERT INTO `world_autolearn` VALUES ('703', '1', '8', '0', '14', '0', '0', '0', 'ГарротаУровень1');
INSERT INTO `world_autolearn` VALUES ('8647', '1', '8', '0', '14', '0', '0', '0', 'Ослаблениедоспеха');
INSERT INTO `world_autolearn` VALUES ('1804', '1', '8', '0', '16', '0', '0', '0', 'Взломзамка');
INSERT INTO `world_autolearn` VALUES ('6761', '1', '8', '0', '16', '2098', '0', '0', 'ПотрошениеУровень3');
INSERT INTO `world_autolearn` VALUES ('1966', '1', '8', '0', '16', '0', '0', '0', 'ЛожныйвыпадУровень1');
INSERT INTO `world_autolearn` VALUES ('8676', '1', '8', '0', '18', '0', '0', '0', 'ВнезапныйударУровень1');
INSERT INTO `world_autolearn` VALUES ('2590', '1', '8', '0', '20', '53', '0', '0', 'УдарвспинуУровень3');
INSERT INTO `world_autolearn` VALUES ('1943', '1', '8', '0', '20', '0', '0', '0', 'РванаяранаУровень1');
INSERT INTO `world_autolearn` VALUES ('51722', '1', '8', '0', '20', '0', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('1759', '1', '8', '0', '22', '1752', '0', '0', 'КоварныйударУровень4');
INSERT INTO `world_autolearn` VALUES ('8631', '1', '8', '0', '22', '703', '0', '0', 'ГарротаУровень2');
INSERT INTO `world_autolearn` VALUES ('1856', '1', '8', '0', '22', '0', '0', '0', 'ИсчезновениеУровень1');
INSERT INTO `world_autolearn` VALUES ('1725', '1', '8', '0', '22', '0', '0', '0', 'Отвлечение');
INSERT INTO `world_autolearn` VALUES ('6762', '1', '8', '0', '24', '2098', '0', '0', 'ПотрошениеУровень4');
INSERT INTO `world_autolearn` VALUES ('2836', '1', '8', '0', '24', '0', '0', '0', 'ОбнаружениеловушекПассивная');
INSERT INTO `world_autolearn` VALUES ('1833', '1', '8', '0', '26', '0', '0', '0', 'Подлыйтрюк');
INSERT INTO `world_autolearn` VALUES ('8724', '1', '8', '0', '26', '8676', '0', '0', 'ВнезапныйударУровень2');
INSERT INTO `world_autolearn` VALUES ('6768', '1', '8', '0', '28', '1966', '0', '0', 'ЛожныйвыпадУровень2');
INSERT INTO `world_autolearn` VALUES ('2070', '1', '8', '0', '28', '6770', '0', '0', 'ОшеломлениеУровень2');
INSERT INTO `world_autolearn` VALUES ('8639', '1', '8', '0', '28', '1943', '0', '0', 'РванаяранаУровень2');
INSERT INTO `world_autolearn` VALUES ('2591', '1', '8', '0', '28', '53', '0', '0', 'УдарвспинуУровень4');
INSERT INTO `world_autolearn` VALUES ('8632', '1', '8', '0', '30', '703', '0', '0', 'ГарротаУровень3');
INSERT INTO `world_autolearn` VALUES ('408', '1', '8', '0', '30', '0', '0', '0', 'УдарпопочкамУровень1');
INSERT INTO `world_autolearn` VALUES ('1842', '1', '8', '0', '30', '0', '0', '0', 'Обезвреживаниеловушки');
INSERT INTO `world_autolearn` VALUES ('1760', '1', '8', '0', '30', '1752', '0', '0', 'КоварныйударУровень5');
INSERT INTO `world_autolearn` VALUES ('8623', '1', '8', '0', '32', '2098', '0', '0', 'ПотрошениеУровень5');
INSERT INTO `world_autolearn` VALUES ('8696', '1', '8', '0', '34', '2983', '0', '0', 'СпринтУровень2');
INSERT INTO `world_autolearn` VALUES ('2094', '1', '8', '0', '34', '0', '0', '0', 'Ослепление');
INSERT INTO `world_autolearn` VALUES ('8725', '1', '8', '0', '34', '8676', '0', '0', 'ВнезапныйударУровень3');
INSERT INTO `world_autolearn` VALUES ('8640', '1', '8', '0', '36', '1943', '0', '0', 'РванаяранаУровень3');
INSERT INTO `world_autolearn` VALUES ('8721', '1', '8', '0', '36', '53', '0', '0', 'УдарвспинуУровень5');
INSERT INTO `world_autolearn` VALUES ('8621', '1', '8', '0', '38', '1752', '0', '0', 'КоварныйударУровень6');
INSERT INTO `world_autolearn` VALUES ('8633', '1', '8', '0', '38', '703', '0', '0', 'ГарротаУровень4');
INSERT INTO `world_autolearn` VALUES ('8637', '1', '8', '0', '40', '1966', '0', '0', 'ЛожныйвыпадУровень3');
INSERT INTO `world_autolearn` VALUES ('1860', '1', '8', '0', '40', '0', '0', '0', 'БезопасноепадениеПассивная');
INSERT INTO `world_autolearn` VALUES ('8624', '1', '8', '0', '40', '2098', '0', '0', 'ПотрошениеУровень6');
INSERT INTO `world_autolearn` VALUES ('11267', '1', '8', '0', '42', '8676', '0', '0', 'ВнезапныйударУровень4');
INSERT INTO `world_autolearn` VALUES ('6774', '1', '8', '0', '42', '5171', '0', '0', 'МясорубкаУровень2');
INSERT INTO `world_autolearn` VALUES ('1857', '1', '8', '0', '42', '1856', '0', '0', 'ИсчезновениеУровень2');
INSERT INTO `world_autolearn` VALUES ('11273', '1', '8', '0', '44', '1943', '0', '0', 'РванаяранаУровень4');
INSERT INTO `world_autolearn` VALUES ('11279', '1', '8', '0', '44', '53', '0', '0', 'УдарвспинуУровень6');
INSERT INTO `world_autolearn` VALUES ('17347', '1', '8', '0', '46', '16511', '0', '0', 'КровоизлияниеУровень2');
INSERT INTO `world_autolearn` VALUES ('11289', '1', '8', '0', '46', '703', '0', '0', 'ГарротаУровень5');
INSERT INTO `world_autolearn` VALUES ('11293', '1', '8', '0', '46', '1752', '0', '0', 'КоварныйударУровень7');
INSERT INTO `world_autolearn` VALUES ('11297', '1', '8', '0', '48', '6770', '0', '0', 'ОшеломлениеУровень3');
INSERT INTO `world_autolearn` VALUES ('11299', '1', '8', '0', '48', '2098', '0', '0', 'ПотрошениеУровень7');
INSERT INTO `world_autolearn` VALUES ('8643', '1', '8', '0', '50', '408', '0', '0', 'УдарпопочкамУровень2');
INSERT INTO `world_autolearn` VALUES ('26669', '1', '8', '0', '50', '5277', '0', '0', 'УскользаниеУровень2');
INSERT INTO `world_autolearn` VALUES ('34411', '1', '8', '0', '50', '1329', '0', '0', 'РасправаУровень2');
INSERT INTO `world_autolearn` VALUES ('11268', '1', '8', '0', '50', '8676', '0', '0', 'ВнезапныйударУровень5');
INSERT INTO `world_autolearn` VALUES ('11303', '1', '8', '0', '52', '1966', '0', '0', 'ЛожныйвыпадУровень4');
INSERT INTO `world_autolearn` VALUES ('11274', '1', '8', '0', '52', '1943', '0', '0', 'РванаяранаУровень5');
INSERT INTO `world_autolearn` VALUES ('11280', '1', '8', '0', '52', '53', '0', '0', 'УдарвспинуУровень7');
INSERT INTO `world_autolearn` VALUES ('11290', '1', '8', '0', '54', '703', '0', '0', 'ГарротаУровень6');
INSERT INTO `world_autolearn` VALUES ('11294', '1', '8', '0', '54', '1752', '0', '0', 'КоварныйударУровень8');
INSERT INTO `world_autolearn` VALUES ('11300', '1', '8', '0', '56', '2098', '0', '0', 'ПотрошениеУровень8');
INSERT INTO `world_autolearn` VALUES ('11305', '1', '8', '0', '58', '2983', '0', '0', 'СпринтУровень3');
INSERT INTO `world_autolearn` VALUES ('11269', '1', '8', '0', '58', '8676', '0', '0', 'ВнезапныйударУровень6');
INSERT INTO `world_autolearn` VALUES ('17348', '1', '8', '0', '58', '16511', '0', '0', 'КровоизлияниеУровень3');
INSERT INTO `world_autolearn` VALUES ('31016', '1', '8', '0', '60', '2098', '0', '0', 'ПотрошениеУровень9');
INSERT INTO `world_autolearn` VALUES ('25302', '1', '8', '0', '60', '1966', '0', '0', 'ЛожныйвыпадУровень5');
INSERT INTO `world_autolearn` VALUES ('11281', '1', '8', '0', '60', '53', '0', '0', 'УдарвспинуУровень8');
INSERT INTO `world_autolearn` VALUES ('25300', '1', '8', '0', '60', '53', '0', '0', 'УдарвспинуУровень9');
INSERT INTO `world_autolearn` VALUES ('34412', '1', '8', '0', '60', '1329', '0', '0', 'РасправаУровень3');
INSERT INTO `world_autolearn` VALUES ('11275', '1', '8', '0', '60', '1943', '0', '0', 'РванаяранаУровень6');
INSERT INTO `world_autolearn` VALUES ('26839', '1', '8', '0', '61', '703', '0', '0', 'ГарротаУровень7');
INSERT INTO `world_autolearn` VALUES ('26861', '1', '8', '0', '62', '1752', '0', '0', 'КоварныйударУровень9');
INSERT INTO `world_autolearn` VALUES ('32645', '1', '8', '0', '62', '0', '0', '0', 'ОтравлениеУровень1');
INSERT INTO `world_autolearn` VALUES ('26889', '1', '8', '0', '62', '1856', '0', '0', 'ИсчезновениеУровень3');
INSERT INTO `world_autolearn` VALUES ('26865', '1', '8', '0', '64', '2098', '0', '0', 'ПотрошениеУровень10');
INSERT INTO `world_autolearn` VALUES ('26679', '1', '8', '0', '64', '0', '0', '0', 'СмертельныйбросокУровень1');
INSERT INTO `world_autolearn` VALUES ('27448', '1', '8', '0', '64', '1966', '0', '0', 'ЛожныйвыпадУровень6');
INSERT INTO `world_autolearn` VALUES ('31224', '1', '8', '0', '66', '0', '0', '0', 'ПлащТеней');
INSERT INTO `world_autolearn` VALUES ('27441', '1', '8', '0', '66', '8676', '0', '0', 'ВнезапныйударУровень7');
INSERT INTO `world_autolearn` VALUES ('26867', '1', '8', '0', '68', '1943', '0', '0', 'РванаяранаУровень7');
INSERT INTO `world_autolearn` VALUES ('26863', '1', '8', '0', '68', '53', '0', '0', 'УдарвспинуУровень10');
INSERT INTO `world_autolearn` VALUES ('32684', '1', '8', '0', '69', '32645', '0', '0', 'ОтравлениеУровень2');
INSERT INTO `world_autolearn` VALUES ('48689', '1', '8', '0', '70', '8676', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('34413', '1', '8', '0', '70', '1329', '0', '0', 'РасправаУровень4');
INSERT INTO `world_autolearn` VALUES ('48673', '1', '8', '0', '70', '26679', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('5938', '1', '8', '0', '70', '0', '0', '0', 'Отравляющийукол');
INSERT INTO `world_autolearn` VALUES ('26884', '1', '8', '0', '70', '703', '0', '0', 'ГарротаУровень8');
INSERT INTO `world_autolearn` VALUES ('26864', '1', '8', '0', '70', '16511', '0', '0', 'КровоизлияниеУровень4');
INSERT INTO `world_autolearn` VALUES ('26862', '1', '8', '0', '70', '1752', '0', '0', 'КоварныйударУровень10');
INSERT INTO `world_autolearn` VALUES ('51724', '1', '8', '0', '71', '6770', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48658', '1', '8', '0', '72', '1966', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48667', '1', '8', '0', '73', '2098', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('57992', '1', '8', '0', '74', '32645', '0', '0', 'ОтравлениеУровень3');
INSERT INTO `world_autolearn` VALUES ('48671', '1', '8', '0', '74', '1943', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48656', '1', '8', '0', '74', '53', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('57934', '1', '8', '0', '75', '0', '0', '0', 'Маленькиехитрости');
INSERT INTO `world_autolearn` VALUES ('48690', '1', '8', '0', '75', '8676', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48663', '1', '8', '0', '75', '1329', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48675', '1', '8', '0', '75', '703', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48637', '1', '8', '0', '76', '1752', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48674', '1', '8', '0', '76', '26679', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48659', '1', '8', '0', '78', '1966', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48672', '1', '8', '0', '79', '1943', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48668', '1', '8', '0', '79', '2098', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48676', '1', '8', '0', '80', '703', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48638', '1', '8', '0', '80', '1752', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48657', '1', '8', '0', '80', '53', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48660', '1', '8', '0', '80', '16511', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('51723', '1', '8', '0', '80', '0', '0', '0', 'Веерклинков');
INSERT INTO `world_autolearn` VALUES ('48666', '1', '8', '0', '80', '1329', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('48691', '1', '8', '0', '80', '8676', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('57993', '1', '8', '0', '80', '32645', '0', '0', 'ОтравлениеУровень4');
INSERT INTO `world_autolearn` VALUES ('1494', '1', '4', '0', '0', '0', '0', '0', 'Выслеживаниеживотных');
INSERT INTO `world_autolearn` VALUES ('1978', '1', '4', '0', '4', '0', '0', '0', 'УкусзмеиУровень1');
INSERT INTO `world_autolearn` VALUES ('13163', '1', '4', '0', '4', '0', '0', '0', 'Духобезьяны');
INSERT INTO `world_autolearn` VALUES ('1130', '1', '4', '0', '6', '0', '0', '0', 'МеткаохотникаУровень1');
INSERT INTO `world_autolearn` VALUES ('3044', '1', '4', '0', '6', '0', '0', '0', 'ЧародейскийвыстрелУровень1');
INSERT INTO `world_autolearn` VALUES ('5116', '1', '4', '0', '8', '0', '0', '0', 'Контузящийвыстрел');
INSERT INTO `world_autolearn` VALUES ('14260', '1', '4', '0', '8', '2973', '0', '0', 'УдарящераУровень2');
INSERT INTO `world_autolearn` VALUES ('1462', '1', '4', '0', '24', '0', '0', '0', 'Знаниезверя');
INSERT INTO `world_autolearn` VALUES ('34026', '1', '4', '0', '66', '0', '0', '0', 'Команда\"Взять!\"');
INSERT INTO `world_autolearn` VALUES ('6991', '1', '4', '0', '10', '0', '0', '0', 'Кормлениепитомца');
INSERT INTO `world_autolearn` VALUES ('1515', '1', '4', '0', '10', '0', '0', '0', 'Приручениезверя');
INSERT INTO `world_autolearn` VALUES ('2641', '1', '4', '0', '10', '0', '0', '0', 'Прогнатьпитомца');
INSERT INTO `world_autolearn` VALUES ('19883', '1', '4', '0', '10', '0', '0', '0', 'Выслеживаниегуманоидов');
INSERT INTO `world_autolearn` VALUES ('13165', '1', '4', '0', '10', '0', '0', '0', 'ДухястребаУровень1');
INSERT INTO `world_autolearn` VALUES ('13549', '1', '4', '0', '10', '1978', '0', '0', 'УкусзмеиУровень2');
INSERT INTO `world_autolearn` VALUES ('14281', '1', '4', '0', '12', '3044', '0', '0', 'ЧародейскийвыстрелУровень2');
INSERT INTO `world_autolearn` VALUES ('20736', '1', '4', '0', '12', '0', '0', '0', 'ОтвлекающийвыстрелУровень1');
INSERT INTO `world_autolearn` VALUES ('136', '1', '4', '0', '12', '0', '0', '0', 'ЛечениепитомцаУровень1');
INSERT INTO `world_autolearn` VALUES ('2974', '1', '4', '0', '12', '0', '0', '0', 'Подрезатькрылья');
INSERT INTO `world_autolearn` VALUES ('6197', '1', '4', '0', '14', '0', '0', '0', 'Орлиныйглаз');
INSERT INTO `world_autolearn` VALUES ('1002', '1', '4', '0', '14', '0', '0', '0', 'Звериныйглаз');
INSERT INTO `world_autolearn` VALUES ('1513', '1', '4', '0', '14', '0', '0', '0', 'ОтпугиваниезверяУровень1');
INSERT INTO `world_autolearn` VALUES ('1495', '1', '4', '0', '16', '0', '0', '0', 'УкусмангустаУровень1');
INSERT INTO `world_autolearn` VALUES ('13795', '1', '4', '0', '16', '0', '0', '0', 'ОбжигающаяловушкаУровень1');
INSERT INTO `world_autolearn` VALUES ('14261', '1', '4', '0', '16', '2973', '0', '0', 'УдарящераУровень3');
INSERT INTO `world_autolearn` VALUES ('5118', '1', '4', '0', '16', '0', '0', '0', 'Духгепарда');
INSERT INTO `world_autolearn` VALUES ('14318', '1', '4', '0', '18', '13165', '0', '0', 'ДухястребаУровень2');
INSERT INTO `world_autolearn` VALUES ('13550', '1', '4', '0', '18', '1978', '0', '0', 'УкусзмеиУровень3');
INSERT INTO `world_autolearn` VALUES ('19884', '1', '4', '0', '18', '0', '0', '0', 'Выслеживаниенежити');
INSERT INTO `world_autolearn` VALUES ('2643', '1', '4', '0', '18', '0', '0', '0', 'ЗалпУровень1');
INSERT INTO `world_autolearn` VALUES ('781', '1', '4', '0', '20', '0', '0', '0', 'Отрыв');
INSERT INTO `world_autolearn` VALUES ('1499', '1', '4', '0', '20', '0', '0', '0', 'ЗамораживающаяловушкаУровень1');
INSERT INTO `world_autolearn` VALUES ('14282', '1', '4', '0', '20', '3044', '0', '0', 'ЧародейскийвыстрелУровень3');
INSERT INTO `world_autolearn` VALUES ('3111', '1', '4', '0', '20', '136', '0', '0', 'ЛечениепитомцаУровень2');
INSERT INTO `world_autolearn` VALUES ('34074', '1', '4', '0', '20', '0', '0', '0', 'Духгадюки');
INSERT INTO `world_autolearn` VALUES ('3043', '1', '4', '0', '22', '0', '0', '0', 'Укусскорпида');
INSERT INTO `world_autolearn` VALUES ('14323', '1', '4', '0', '22', '1130', '0', '0', 'МеткаохотникаУровень2');
INSERT INTO `world_autolearn` VALUES ('19885', '1', '4', '0', '24', '0', '0', '0', 'Выслеживаниескрытных');
INSERT INTO `world_autolearn` VALUES ('14262', '1', '4', '0', '24', '2973', '0', '0', 'УдарящераУровень4');
INSERT INTO `world_autolearn` VALUES ('13551', '1', '4', '0', '26', '1978', '0', '0', 'УкусзмеиУровень4');
INSERT INTO `world_autolearn` VALUES ('19880', '1', '4', '0', '26', '0', '0', '0', 'Выслеживаниеэлементалей');
INSERT INTO `world_autolearn` VALUES ('14302', '1', '4', '0', '26', '13795', '0', '0', 'ОбжигающаяловушкаУровень2');
INSERT INTO `world_autolearn` VALUES ('3045', '1', '4', '0', '26', '0', '0', '0', 'Быстраястрельба');
INSERT INTO `world_autolearn` VALUES ('13809', '1', '4', '0', '28', '0', '0', '0', 'Ледянаяловушка');
INSERT INTO `world_autolearn` VALUES ('14283', '1', '4', '0', '28', '3044', '0', '0', 'ЧародейскийвыстрелУровень4');
INSERT INTO `world_autolearn` VALUES ('14319', '1', '4', '0', '28', '13165', '0', '0', 'ДухястребаУровень3');
INSERT INTO `world_autolearn` VALUES ('20900', '1', '4', '0', '28', '19434', '0', '0', 'ПрицельныйвыстрелУровень2');
INSERT INTO `world_autolearn` VALUES ('3661', '1', '4', '0', '28', '136', '0', '0', 'ЛечениепитомцаУровень3');
INSERT INTO `world_autolearn` VALUES ('14288', '1', '4', '0', '30', '2643', '0', '0', 'ЗалпУровень2');
INSERT INTO `world_autolearn` VALUES ('13161', '1', '4', '0', '30', '0', '0', '0', 'Духзверя');
INSERT INTO `world_autolearn` VALUES ('14326', '1', '4', '0', '30', '1513', '0', '0', 'ОтпугиваниезверяУровень2');
INSERT INTO `world_autolearn` VALUES ('14269', '1', '4', '0', '30', '1495', '0', '0', 'УкусмангустаУровень2');
INSERT INTO `world_autolearn` VALUES ('5384', '1', '4', '0', '30', '0', '0', '0', 'Притворитьсямертвым');
INSERT INTO `world_autolearn` VALUES ('1543', '1', '4', '0', '32', '0', '0', '0', 'Осветительнаяракета');
INSERT INTO `world_autolearn` VALUES ('14263', '1', '4', '0', '32', '2973', '0', '0', 'УдарящераУровень5');
INSERT INTO `world_autolearn` VALUES ('19878', '1', '4', '0', '32', '0', '0', '0', 'Выслеживаниедемонов');
INSERT INTO `world_autolearn` VALUES ('13813', '1', '4', '0', '34', '0', '0', '0', 'ВзрывнаяловушкаУровень1');
INSERT INTO `world_autolearn` VALUES ('13552', '1', '4', '0', '34', '1978', '0', '0', 'УкусзмеиУровень5');
INSERT INTO `world_autolearn` VALUES ('14284', '1', '4', '0', '36', '3044', '0', '0', 'ЧародейскийвыстрелУровень5');
INSERT INTO `world_autolearn` VALUES ('14303', '1', '4', '0', '36', '13795', '0', '0', 'ОбжигающаяловушкаУровень3');
INSERT INTO `world_autolearn` VALUES ('3034', '1', '4', '0', '36', '0', '0', '0', 'Укусгадюки');
INSERT INTO `world_autolearn` VALUES ('3662', '1', '4', '0', '36', '136', '0', '0', 'ЛечениепитомцаУровень4');
INSERT INTO `world_autolearn` VALUES ('20901', '1', '4', '0', '36', '19434', '0', '0', 'ПрицельныйвыстрелУровень3');
INSERT INTO `world_autolearn` VALUES ('14320', '1', '4', '0', '38', '13165', '0', '0', 'ДухястребаУровень4');
INSERT INTO `world_autolearn` VALUES ('19882', '1', '4', '0', '40', '0', '0', '0', 'Выслеживаниевеликанов');
INSERT INTO `world_autolearn` VALUES ('13159', '1', '4', '0', '40', '0', '0', '0', 'Духстаи');
INSERT INTO `world_autolearn` VALUES ('1510', '1', '4', '0', '40', '0', '0', '0', 'ГрадстрелУровень1');
INSERT INTO `world_autolearn` VALUES ('14310', '1', '4', '0', '40', '1499', '0', '0', 'ЗамораживающаяловушкаУровень2');
INSERT INTO `world_autolearn` VALUES ('14264', '1', '4', '0', '40', '2973', '0', '0', 'УдарящераУровень6');
INSERT INTO `world_autolearn` VALUES ('14324', '1', '4', '0', '40', '1130', '0', '0', 'МеткаохотникаУровень3');
INSERT INTO `world_autolearn` VALUES ('20909', '1', '4', '0', '42', '19306', '0', '0', 'КонтратакаУровень2');
INSERT INTO `world_autolearn` VALUES ('14289', '1', '4', '0', '42', '2643', '0', '0', 'ЗалпУровень3');
INSERT INTO `world_autolearn` VALUES ('13553', '1', '4', '0', '42', '1978', '0', '0', 'УкусзмеиУровень6');
INSERT INTO `world_autolearn` VALUES ('14285', '1', '4', '0', '44', '3044', '0', '0', 'ЧародейскийвыстрелУровень6');
INSERT INTO `world_autolearn` VALUES ('14270', '1', '4', '0', '44', '1495', '0', '0', 'УкусмангустаУровень3');
INSERT INTO `world_autolearn` VALUES ('20902', '1', '4', '0', '44', '19434', '0', '0', 'ПрицельныйвыстрелУровень4');
INSERT INTO `world_autolearn` VALUES ('13542', '1', '4', '0', '44', '136', '0', '0', 'ЛечениепитомцаУровень5');
INSERT INTO `world_autolearn` VALUES ('14316', '1', '4', '0', '44', '13813', '0', '0', 'ВзрывнаяловушкаУровень2');
INSERT INTO `world_autolearn` VALUES ('14304', '1', '4', '0', '46', '13795', '0', '0', 'ОбжигающаяловушкаУровень4');
INSERT INTO `world_autolearn` VALUES ('14327', '1', '4', '0', '46', '1513', '0', '0', 'ОтпугиваниезверяУровень3');
INSERT INTO `world_autolearn` VALUES ('20043', '1', '4', '0', '46', '0', '0', '0', 'ДухдикойприродыУровень1');
INSERT INTO `world_autolearn` VALUES ('14321', '1', '4', '0', '48', '13165', '0', '0', 'ДухястребаУровень5');
INSERT INTO `world_autolearn` VALUES ('14265', '1', '4', '0', '48', '2973', '0', '0', 'УдарящераУровень7');
INSERT INTO `world_autolearn` VALUES ('19879', '1', '4', '0', '50', '0', '0', '0', 'Выслеживаниедраконов');
INSERT INTO `world_autolearn` VALUES ('24132', '1', '4', '0', '50', '19386', '0', '0', 'УкусвиверныУровень2');
INSERT INTO `world_autolearn` VALUES ('13554', '1', '4', '0', '50', '1978', '0', '0', 'УкусзмеиУровень7');
INSERT INTO `world_autolearn` VALUES ('56641', '1', '4', '0', '50', '0', '0', '0', 'ВерныйвыстрелУровень1');
INSERT INTO `world_autolearn` VALUES ('14294', '1', '4', '0', '50', '1510', '0', '0', 'ГрадстрелУровень2');
INSERT INTO `world_autolearn` VALUES ('13543', '1', '4', '0', '52', '136', '0', '0', 'ЛечениепитомцаУровень6');
INSERT INTO `world_autolearn` VALUES ('20903', '1', '4', '0', '52', '19434', '0', '0', 'ПрицельныйвыстрелУровень5');
INSERT INTO `world_autolearn` VALUES ('14286', '1', '4', '0', '52', '3044', '0', '0', 'ЧародейскийвыстрелУровень7');
INSERT INTO `world_autolearn` VALUES ('14290', '1', '4', '0', '54', '2643', '0', '0', 'ЗалпУровень4');
INSERT INTO `world_autolearn` VALUES ('14317', '1', '4', '0', '54', '13813', '0', '0', 'ВзрывнаяловушкаУровень3');
INSERT INTO `world_autolearn` VALUES ('20910', '1', '4', '0', '54', '19306', '0', '0', 'КонтратакаУровень3');
INSERT INTO `world_autolearn` VALUES ('20190', '1', '4', '0', '56', '20043', '0', '0', 'ДухдикойприродыУровень2');
INSERT INTO `world_autolearn` VALUES ('14305', '1', '4', '0', '56', '13795', '0', '0', 'ОбжигающаяловушкаУровень5');
INSERT INTO `world_autolearn` VALUES ('14266', '1', '4', '0', '56', '2973', '0', '0', 'УдарящераУровень8');
INSERT INTO `world_autolearn` VALUES ('63668', '1', '4', '0', '57', '3674', '0', '0', 'ЧернаястрелаУровень2');
INSERT INTO `world_autolearn` VALUES ('13555', '1', '4', '0', '58', '1978', '0', '0', 'УкусзмеиУровень8');
INSERT INTO `world_autolearn` VALUES ('14295', '1', '4', '0', '58', '1510', '0', '0', 'ГрадстрелУровень3');
INSERT INTO `world_autolearn` VALUES ('14271', '1', '4', '0', '58', '1495', '0', '0', 'УкусмангустаУровень4');
INSERT INTO `world_autolearn` VALUES ('14325', '1', '4', '0', '58', '1130', '0', '0', 'МеткаохотникаУровень4');
INSERT INTO `world_autolearn` VALUES ('14322', '1', '4', '0', '58', '13165', '0', '0', 'ДухястребаУровень6');
INSERT INTO `world_autolearn` VALUES ('25294', '1', '4', '0', '60', '2643', '0', '0', 'ЗалпУровень5');
INSERT INTO `world_autolearn` VALUES ('25295', '1', '4', '0', '60', '1978', '0', '0', 'УкусзмеиУровень9');
INSERT INTO `world_autolearn` VALUES ('25296', '1', '4', '0', '60', '13165', '0', '0', 'ДухястребаУровень7');
INSERT INTO `world_autolearn` VALUES ('24133', '1', '4', '0', '60', '19386', '0', '0', 'УкусвиверныУровень3');
INSERT INTO `world_autolearn` VALUES ('20904', '1', '4', '0', '60', '19434', '0', '0', 'ПрицельныйвыстрелУровень6');
INSERT INTO `world_autolearn` VALUES ('14311', '1', '4', '0', '60', '1499', '0', '0', 'ЗамораживающаяловушкаУровень3');
INSERT INTO `world_autolearn` VALUES ('13544', '1', '4', '0', '60', '136', '0', '0', 'ЛечениепитомцаУровень7');
INSERT INTO `world_autolearn` VALUES ('14287', '1', '4', '0', '60', '3044', '0', '0', 'ЧародейскийвыстрелУровень8');
INSERT INTO `world_autolearn` VALUES ('19263', '1', '4', '0', '60', '0', '0', '0', 'Сдерживание');
INSERT INTO `world_autolearn` VALUES ('19801', '1', '4', '0', '60', '0', '0', '0', 'Усмиряющийвыстрел');
INSERT INTO `world_autolearn` VALUES ('27025', '1', '4', '0', '61', '13813', '0', '0', 'ВзрывнаяловушкаУровень4');
INSERT INTO `world_autolearn` VALUES ('34120', '1', '4', '0', '62', '56641', '0', '0', 'ВерныйвыстрелУровень2');
INSERT INTO `world_autolearn` VALUES ('27014', '1', '4', '0', '63', '2973', '0', '0', 'УдарящераУровень9');
INSERT INTO `world_autolearn` VALUES ('63669', '1', '4', '0', '63', '3674', '0', '0', 'ЧернаястрелаУровень3');
INSERT INTO `world_autolearn` VALUES ('27023', '1', '4', '0', '65', '13795', '0', '0', 'ОбжигающаяловушкаУровень6');
INSERT INTO `world_autolearn` VALUES ('27067', '1', '4', '0', '66', '19306', '0', '0', 'КонтратакаУровень4');
INSERT INTO `world_autolearn` VALUES ('27022', '1', '4', '0', '67', '1510', '0', '0', 'ГрадстрелУровень4');
INSERT INTO `world_autolearn` VALUES ('27021', '1', '4', '0', '67', '2643', '0', '0', 'ЗалпУровень6');
INSERT INTO `world_autolearn` VALUES ('27016', '1', '4', '0', '67', '1978', '0', '0', 'УкусзмеиУровень10');
INSERT INTO `world_autolearn` VALUES ('34600', '1', '4', '0', '68', '0', '0', '0', 'Змеинаяловушка');
INSERT INTO `world_autolearn` VALUES ('27046', '1', '4', '0', '68', '136', '0', '0', 'ЛечениепитомцаУровень8');
INSERT INTO `world_autolearn` VALUES ('27045', '1', '4', '0', '68', '20043', '0', '0', 'ДухдикойприродыУровень3');
INSERT INTO `world_autolearn` VALUES ('27044', '1', '4', '0', '68', '13165', '0', '0', 'ДухястребаУровень8');
INSERT INTO `world_autolearn` VALUES ('27019', '1', '4', '0', '69', '3044', '0', '0', 'ЧародейскийвыстрелУровень9');
INSERT INTO `world_autolearn` VALUES ('63670', '1', '4', '0', '69', '3674', '0', '0', 'ЧернаястрелаУровень4');
INSERT INTO `world_autolearn` VALUES ('60051', '1', '4', '0', '70', '53301', '0', '0', 'РазрывнойвыстрелУровень2');
INSERT INTO `world_autolearn` VALUES ('34477', '1', '4', '0', '70', '0', '0', '0', 'Перенаправление');
INSERT INTO `world_autolearn` VALUES ('27068', '1', '4', '0', '70', '19386', '0', '0', 'УкусвиверныУровень4');
INSERT INTO `world_autolearn` VALUES ('27065', '1', '4', '0', '70', '19434', '0', '0', 'ПрицельныйвыстрелУровень7');
INSERT INTO `world_autolearn` VALUES ('36916', '1', '4', '0', '70', '1495', '0', '0', 'УкусмангустаУровень5');
INSERT INTO `world_autolearn` VALUES ('53351', '1', '4', '0', '71', '0', '0', '0', 'УбийственныйвыстрелУровень1');
INSERT INTO `world_autolearn` VALUES ('49066', '1', '4', '0', '71', '13813', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49051', '1', '4', '0', '71', '56641', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48995', '1', '4', '0', '71', '2973', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49055', '1', '4', '0', '72', '13795', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48998', '1', '4', '0', '72', '19306', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49000', '1', '4', '0', '73', '1978', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49044', '1', '4', '0', '73', '3044', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49047', '1', '4', '0', '74', '2643', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('61846', '1', '4', '0', '74', '0', '0', '0', 'ДухдракондораУровень1');
INSERT INTO `world_autolearn` VALUES ('48989', '1', '4', '0', '74', '136', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('58431', '1', '4', '0', '74', '1510', '0', '0', 'ГрадстрелУровень5');
INSERT INTO `world_autolearn` VALUES ('61005', '1', '4', '0', '75', '53351', '0', '0', 'УбийственныйвыстрелУровень2');
INSERT INTO `world_autolearn` VALUES ('63671', '1', '4', '0', '75', '3674', '0', '0', 'ЧернаястрелаУровень5');
INSERT INTO `world_autolearn` VALUES ('60052', '1', '4', '0', '75', '53301', '0', '0', 'РазрывнойвыстрелУровень3');
INSERT INTO `world_autolearn` VALUES ('53271', '1', '4', '0', '75', '0', '0', '0', 'Приказхозяина');
INSERT INTO `world_autolearn` VALUES ('49049', '1', '4', '0', '75', '19434', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49011', '1', '4', '0', '75', '19386', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49071', '1', '4', '0', '76', '20043', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('53338', '1', '4', '0', '76', '1130', '0', '0', 'МеткаохотникаУровень5');
INSERT INTO `world_autolearn` VALUES ('48996', '1', '4', '0', '77', '2973', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49052', '1', '4', '0', '77', '56641', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49067', '1', '4', '0', '77', '13813', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48999', '1', '4', '0', '78', '19306', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49056', '1', '4', '0', '78', '13795', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49001', '1', '4', '0', '79', '1978', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49045', '1', '4', '0', '79', '3044', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('53339', '1', '4', '0', '80', '1495', '0', '0', 'УкусмангустаУровень6');
INSERT INTO `world_autolearn` VALUES ('49012', '1', '4', '0', '80', '19386', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('62757', '1', '4', '0', '80', '0', '0', '0', 'Призывпитомцаизстойл');
INSERT INTO `world_autolearn` VALUES ('61847', '1', '4', '0', '80', '61846', '0', '0', 'ДухдракондораУровень2');
INSERT INTO `world_autolearn` VALUES ('49048', '1', '4', '0', '80', '2643', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('61006', '1', '4', '0', '80', '53351', '0', '0', 'УбийственныйвыстрелУровень3');
INSERT INTO `world_autolearn` VALUES ('49050', '1', '4', '0', '80', '19434', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('60192', '1', '4', '0', '80', '0', '0', '0', 'ЗамораживающаястрелаУровень1');
INSERT INTO `world_autolearn` VALUES ('60053', '1', '4', '0', '80', '53301', '0', '0', 'РазрывнойвыстрелУровень4');
INSERT INTO `world_autolearn` VALUES ('48990', '1', '4', '0', '80', '136', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('58434', '1', '4', '0', '80', '1510', '0', '0', 'ГрадстрелУровень6');
INSERT INTO `world_autolearn` VALUES ('63672', '1', '4', '0', '80', '3674', '0', '0', 'ЧернаястрелаУровень6');
INSERT INTO `world_autolearn` VALUES ('8017', '1', '64', '0', '1', '0', '0', '0', 'ОружиекамнедробителяУровень1');
INSERT INTO `world_autolearn` VALUES ('8071', '1', '64', '0', '4', '0', '0', '0', 'ТотемкаменнойкожиУровень1');
INSERT INTO `world_autolearn` VALUES ('8042', '1', '64', '0', '4', '0', '0', '0', 'ЗемнойшокУровень1');
INSERT INTO `world_autolearn` VALUES ('332', '1', '64', '0', '6', '331', '0', '0', 'ВолнаисцеленияУровень2');
INSERT INTO `world_autolearn` VALUES ('2484', '1', '64', '0', '6', '0', '0', '0', 'Тотемоковземли');
INSERT INTO `world_autolearn` VALUES ('5730', '1', '64', '0', '8', '0', '0', '0', 'ТотемкаменногокогтяУровень1');
INSERT INTO `world_autolearn` VALUES ('8044', '1', '64', '0', '8', '8042', '0', '0', 'ЗемнойшокУровень2');
INSERT INTO `world_autolearn` VALUES ('529', '1', '64', '0', '8', '403', '0', '0', 'МолнияУровень2');
INSERT INTO `world_autolearn` VALUES ('8018', '1', '64', '0', '8', '8017', '0', '0', 'ОружиекамнедробителяУровень2');
INSERT INTO `world_autolearn` VALUES ('324', '1', '64', '0', '8', '0', '0', '0', 'ЩитмолнийУровень1');
INSERT INTO `world_autolearn` VALUES ('3599', '1', '64', '0', '10', '0', '0', '0', 'ОпаляющийтотемУровень1');
INSERT INTO `world_autolearn` VALUES ('8050', '1', '64', '0', '10', '0', '0', '0', 'ОгненныйшокУровень1');
INSERT INTO `world_autolearn` VALUES ('8024', '1', '64', '0', '10', '0', '0', '0', 'ОружиеязыкапламениУровень1');
INSERT INTO `world_autolearn` VALUES ('8075', '1', '64', '0', '10', '0', '0', '0', 'ТотемсилыземлиУровень1');
INSERT INTO `world_autolearn` VALUES ('1535', '1', '64', '0', '12', '0', '0', '0', 'КольцоогняУровень1');
INSERT INTO `world_autolearn` VALUES ('370', '1', '64', '0', '12', '0', '0', '0', 'РазвеиваниемагииУровень1');
INSERT INTO `world_autolearn` VALUES ('547', '1', '64', '0', '12', '331', '0', '0', 'ВолнаисцеленияУровень3');
INSERT INTO `world_autolearn` VALUES ('2008', '1', '64', '0', '12', '0', '0', '0', 'ДухпредковУровень1');
INSERT INTO `world_autolearn` VALUES ('8045', '1', '64', '0', '14', '8042', '0', '0', 'ЗемнойшокУровень3');
INSERT INTO `world_autolearn` VALUES ('8154', '1', '64', '0', '14', '8071', '0', '0', 'ТотемкаменнойкожиУровень2');
INSERT INTO `world_autolearn` VALUES ('548', '1', '64', '0', '14', '403', '0', '0', 'МолнияУровень3');
INSERT INTO `world_autolearn` VALUES ('2645', '1', '64', '0', '16', '0', '0', '0', 'Призрачныйволк');
INSERT INTO `world_autolearn` VALUES ('8019', '1', '64', '0', '16', '8017', '0', '0', 'ОружиекамнедробителяУровень3');
INSERT INTO `world_autolearn` VALUES ('57994', '1', '64', '0', '16', '0', '0', '0', 'Пронизывающийветер');
INSERT INTO `world_autolearn` VALUES ('526', '1', '64', '0', '16', '0', '0', '0', 'Оздоровление');
INSERT INTO `world_autolearn` VALUES ('325', '1', '64', '0', '16', '324', '0', '0', 'ЩитмолнийУровень2');
INSERT INTO `world_autolearn` VALUES ('6390', '1', '64', '0', '18', '5730', '0', '0', 'ТотемкаменногокогтяУровень2');
INSERT INTO `world_autolearn` VALUES ('913', '1', '64', '0', '18', '331', '0', '0', 'ВолнаисцеленияУровень4');
INSERT INTO `world_autolearn` VALUES ('8027', '1', '64', '0', '18', '8024', '0', '0', 'ОружиеязыкапламениУровень2');
INSERT INTO `world_autolearn` VALUES ('8143', '1', '64', '0', '18', '0', '0', '0', 'Тотемтрепета');
INSERT INTO `world_autolearn` VALUES ('8052', '1', '64', '0', '18', '8050', '0', '0', 'ОгненныйшокУровень2');
INSERT INTO `world_autolearn` VALUES ('5394', '1', '64', '0', '20', '0', '0', '0', 'ТотемисцеляющегопотокаУровень1');
INSERT INTO `world_autolearn` VALUES ('8004', '1', '64', '0', '20', '0', '0', '0', 'МалаяволнаисцеленияУровень1');
INSERT INTO `world_autolearn` VALUES ('915', '1', '64', '0', '20', '403', '0', '0', 'МолнияУровень4');
INSERT INTO `world_autolearn` VALUES ('8033', '1', '64', '0', '20', '0', '0', '0', 'ОружиеледяногоклеймаУровень1');
INSERT INTO `world_autolearn` VALUES ('6363', '1', '64', '0', '20', '3599', '0', '0', 'ОпаляющийтотемУровень2');
INSERT INTO `world_autolearn` VALUES ('52127', '1', '64', '0', '20', '0', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('8056', '1', '64', '0', '20', '0', '0', '0', 'ЛедянойшокУровень1');
INSERT INTO `world_autolearn` VALUES ('131', '1', '64', '0', '22', '0', '0', '0', 'Подводноедыхание');
INSERT INTO `world_autolearn` VALUES ('8498', '1', '64', '0', '22', '1535', '0', '0', 'КольцоогняУровень2');
INSERT INTO `world_autolearn` VALUES ('8046', '1', '64', '0', '24', '8042', '0', '0', 'ЗемнойшокУровень4');
INSERT INTO `world_autolearn` VALUES ('905', '1', '64', '0', '24', '324', '0', '0', 'ЩитмолнийУровень3');
INSERT INTO `world_autolearn` VALUES ('8160', '1', '64', '0', '24', '8075', '0', '0', 'ТотемсилыземлиУровень2');
INSERT INTO `world_autolearn` VALUES ('939', '1', '64', '0', '24', '331', '0', '0', 'ВолнаисцеленияУровень5');
INSERT INTO `world_autolearn` VALUES ('8181', '1', '64', '0', '24', '0', '0', '0', 'ТотемзащитыотмагиильдаУровень1');
INSERT INTO `world_autolearn` VALUES ('8155', '1', '64', '0', '24', '8071', '0', '0', 'ТотемкаменнойкожиУровень3');
INSERT INTO `world_autolearn` VALUES ('10399', '1', '64', '0', '24', '8017', '0', '0', 'ОружиекамнедробителяУровень4');
INSERT INTO `world_autolearn` VALUES ('20609', '1', '64', '0', '24', '2008', '0', '0', 'ДухпредковУровень2');
INSERT INTO `world_autolearn` VALUES ('8030', '1', '64', '0', '26', '8024', '0', '0', 'ОружиеязыкапламениУровень3');
INSERT INTO `world_autolearn` VALUES ('8190', '1', '64', '0', '26', '0', '0', '0', 'ТотеммагмыУровень1');
INSERT INTO `world_autolearn` VALUES ('5675', '1', '64', '0', '26', '0', '0', '0', 'ТотемисточникаманыУровень1');
INSERT INTO `world_autolearn` VALUES ('6196', '1', '64', '0', '26', '0', '0', '0', 'Дальнеезрение');
INSERT INTO `world_autolearn` VALUES ('943', '1', '64', '0', '26', '403', '0', '0', 'МолнияУровень5');
INSERT INTO `world_autolearn` VALUES ('8038', '1', '64', '0', '28', '8033', '0', '0', 'ОружиеледяногоклеймаУровень2');
INSERT INTO `world_autolearn` VALUES ('8053', '1', '64', '0', '28', '8050', '0', '0', 'ОгненныйшокУровень3');
INSERT INTO `world_autolearn` VALUES ('546', '1', '64', '0', '28', '0', '0', '0', 'Хождениеповоде');
INSERT INTO `world_autolearn` VALUES ('52129', '1', '64', '0', '28', '52127', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('8227', '1', '64', '0', '28', '0', '0', '0', 'ТотемязыкапламениУровень1');
INSERT INTO `world_autolearn` VALUES ('6391', '1', '64', '0', '28', '5730', '0', '0', 'ТотемкаменногокогтяУровень3');
INSERT INTO `world_autolearn` VALUES ('8008', '1', '64', '0', '28', '8004', '0', '0', 'МалаяволнаисцеленияУровень2');
INSERT INTO `world_autolearn` VALUES ('8184', '1', '64', '0', '28', '0', '0', '0', 'ТотемзащитыотогняУровень1');
INSERT INTO `world_autolearn` VALUES ('8232', '1', '64', '0', '30', '0', '0', '0', 'ОружиенеистовстваветраУровень1');
INSERT INTO `world_autolearn` VALUES ('66842', '1', '64', '0', '30', '0', '0', '0', 'ЗовСтихий');
INSERT INTO `world_autolearn` VALUES ('8177', '1', '64', '0', '30', '0', '0', '0', 'Тотемзаземления');
INSERT INTO `world_autolearn` VALUES ('556', '1', '64', '0', '30', '0', '0', '0', 'Астральноевозвращение');
INSERT INTO `world_autolearn` VALUES ('51730', '1', '64', '0', '30', '0', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('36936', '1', '64', '0', '30', '0', '0', '0', 'Возвращениетотемов');
INSERT INTO `world_autolearn` VALUES ('6375', '1', '64', '0', '30', '5394', '0', '0', 'ТотемисцеляющегопотокаУровень2');
INSERT INTO `world_autolearn` VALUES ('10595', '1', '64', '0', '30', '0', '0', '0', 'ТотемзащитыотсилприродыУровень1');
INSERT INTO `world_autolearn` VALUES ('20608', '1', '64', '0', '30', '0', '0', '0', 'ПерерождениеПассивная');
INSERT INTO `world_autolearn` VALUES ('6364', '1', '64', '0', '30', '3599', '0', '0', 'ОпаляющийтотемУровень3');
INSERT INTO `world_autolearn` VALUES ('8512', '1', '64', '0', '32', '0', '0', '0', 'Тотемнеистовстваветра');
INSERT INTO `world_autolearn` VALUES ('6041', '1', '64', '0', '32', '403', '0', '0', 'МолнияУровень6');
INSERT INTO `world_autolearn` VALUES ('421', '1', '64', '0', '32', '0', '0', '0', 'ЦепнаямолнияУровень1');
INSERT INTO `world_autolearn` VALUES ('8012', '1', '64', '0', '32', '370', '0', '0', 'РазвеиваниемагииУровень2');
INSERT INTO `world_autolearn` VALUES ('959', '1', '64', '0', '32', '331', '0', '0', 'ВолнаисцеленияУровень6');
INSERT INTO `world_autolearn` VALUES ('945', '1', '64', '0', '32', '324', '0', '0', 'ЩитмолнийУровень4');
INSERT INTO `world_autolearn` VALUES ('8499', '1', '64', '0', '32', '1535', '0', '0', 'КольцоогняУровень3');
INSERT INTO `world_autolearn` VALUES ('8058', '1', '64', '0', '34', '8056', '0', '0', 'ЛедянойшокУровень2');
INSERT INTO `world_autolearn` VALUES ('10406', '1', '64', '0', '34', '8071', '0', '0', 'ТотемкаменнойкожиУровень4');
INSERT INTO `world_autolearn` VALUES ('6495', '1', '64', '0', '34', '0', '0', '0', 'Сторожевойтотем');
INSERT INTO `world_autolearn` VALUES ('52131', '1', '64', '0', '34', '52127', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('10495', '1', '64', '0', '36', '5675', '0', '0', 'ТотемисточникаманыУровень2');
INSERT INTO `world_autolearn` VALUES ('10412', '1', '64', '0', '36', '8042', '0', '0', 'ЗемнойшокУровень5');
INSERT INTO `world_autolearn` VALUES ('10585', '1', '64', '0', '36', '8190', '0', '0', 'ТотеммагмыУровень2');
INSERT INTO `world_autolearn` VALUES ('20610', '1', '64', '0', '36', '2008', '0', '0', 'ДухпредковУровень3');
INSERT INTO `world_autolearn` VALUES ('16339', '1', '64', '0', '36', '8024', '0', '0', 'ОружиеязыкапламениУровень4');
INSERT INTO `world_autolearn` VALUES ('8010', '1', '64', '0', '36', '8004', '0', '0', 'МалаяволнаисцеленияУровень3');
INSERT INTO `world_autolearn` VALUES ('8249', '1', '64', '0', '38', '8227', '0', '0', 'ТотемязыкапламениУровень2');
INSERT INTO `world_autolearn` VALUES ('6392', '1', '64', '0', '38', '5730', '0', '0', 'ТотемкаменногокогтяУровень4');
INSERT INTO `world_autolearn` VALUES ('10456', '1', '64', '0', '38', '8033', '0', '0', 'ОружиеледяногоклеймаУровень3');
INSERT INTO `world_autolearn` VALUES ('8170', '1', '64', '0', '38', '0', '0', '0', 'Тотемочищения');
INSERT INTO `world_autolearn` VALUES ('8161', '1', '64', '0', '38', '8075', '0', '0', 'ТотемсилыземлиУровень3');
INSERT INTO `world_autolearn` VALUES ('10478', '1', '64', '0', '38', '8181', '0', '0', 'ТотемзащитыотмагиильдаУровень2');
INSERT INTO `world_autolearn` VALUES ('10391', '1', '64', '0', '38', '403', '0', '0', 'МолнияУровень7');
INSERT INTO `world_autolearn` VALUES ('51988', '1', '64', '0', '40', '51730', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('10447', '1', '64', '0', '40', '8050', '0', '0', 'ОгненныйшокУровень4');
INSERT INTO `world_autolearn` VALUES ('930', '1', '64', '0', '40', '421', '0', '0', 'ЦепнаямолнияУровень2');
INSERT INTO `world_autolearn` VALUES ('8005', '1', '64', '0', '40', '331', '0', '0', 'ВолнаисцеленияУровень7');
INSERT INTO `world_autolearn` VALUES ('66843', '1', '64', '0', '40', '0', '0', '0', 'ЗовПредков');
INSERT INTO `world_autolearn` VALUES ('1064', '1', '64', '0', '40', '0', '0', '0', 'ЦепноеисцелениеУровень1');
INSERT INTO `world_autolearn` VALUES ('6365', '1', '64', '0', '40', '3599', '0', '0', 'ОпаляющийтотемУровень4');
INSERT INTO `world_autolearn` VALUES ('8134', '1', '64', '0', '40', '324', '0', '0', 'ЩитмолнийУровень5');
INSERT INTO `world_autolearn` VALUES ('6377', '1', '64', '0', '40', '5394', '0', '0', 'ТотемисцеляющегопотокаУровень3');
INSERT INTO `world_autolearn` VALUES ('8235', '1', '64', '0', '40', '8232', '0', '0', 'ОружиенеистовстваветраУровень2');
INSERT INTO `world_autolearn` VALUES ('52134', '1', '64', '0', '41', '52127', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('10537', '1', '64', '0', '42', '8184', '0', '0', 'ТотемзащитыотогняУровень2');
INSERT INTO `world_autolearn` VALUES ('11314', '1', '64', '0', '42', '1535', '0', '0', 'КольцоогняУровень4');
INSERT INTO `world_autolearn` VALUES ('10600', '1', '64', '0', '44', '10595', '0', '0', 'ТотемзащитыотсилприродыУровень2');
INSERT INTO `world_autolearn` VALUES ('10392', '1', '64', '0', '44', '403', '0', '0', 'МолнияУровень8');
INSERT INTO `world_autolearn` VALUES ('10466', '1', '64', '0', '44', '8004', '0', '0', 'МалаяволнаисцеленияУровень4');
INSERT INTO `world_autolearn` VALUES ('10407', '1', '64', '0', '44', '8071', '0', '0', 'ТотемкаменнойкожиУровень5');
INSERT INTO `world_autolearn` VALUES ('10622', '1', '64', '0', '46', '1064', '0', '0', 'ЦепноеисцелениеУровень2');
INSERT INTO `world_autolearn` VALUES ('10496', '1', '64', '0', '46', '5675', '0', '0', 'ТотемисточникаманыУровень3');
INSERT INTO `world_autolearn` VALUES ('10586', '1', '64', '0', '46', '8190', '0', '0', 'ТотеммагмыУровень3');
INSERT INTO `world_autolearn` VALUES ('10472', '1', '64', '0', '46', '8056', '0', '0', 'ЛедянойшокУровень3');
INSERT INTO `world_autolearn` VALUES ('16341', '1', '64', '0', '46', '8024', '0', '0', 'ОружиеязыкапламениУровень5');
INSERT INTO `world_autolearn` VALUES ('10395', '1', '64', '0', '48', '331', '0', '0', 'ВолнаисцеленияУровень8');
INSERT INTO `world_autolearn` VALUES ('52136', '1', '64', '0', '48', '52127', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('10413', '1', '64', '0', '48', '8042', '0', '0', 'ЗемнойшокУровень6');
INSERT INTO `world_autolearn` VALUES ('2860', '1', '64', '0', '48', '421', '0', '0', 'ЦепнаямолнияУровень3');
INSERT INTO `world_autolearn` VALUES ('10427', '1', '64', '0', '48', '5730', '0', '0', 'ТотемкаменногокогтяУровень5');
INSERT INTO `world_autolearn` VALUES ('10431', '1', '64', '0', '48', '324', '0', '0', 'ЩитмолнийУровень6');
INSERT INTO `world_autolearn` VALUES ('10526', '1', '64', '0', '48', '8227', '0', '0', 'ТотемязыкапламениУровень3');
INSERT INTO `world_autolearn` VALUES ('16355', '1', '64', '0', '48', '8033', '0', '0', 'ОружиеледяногоклеймаУровень4');
INSERT INTO `world_autolearn` VALUES ('20776', '1', '64', '0', '48', '2008', '0', '0', 'ДухпредковУровень4');
INSERT INTO `world_autolearn` VALUES ('51991', '1', '64', '0', '50', '51730', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('15207', '1', '64', '0', '50', '403', '0', '0', 'МолнияУровень9');
INSERT INTO `world_autolearn` VALUES ('10486', '1', '64', '0', '50', '8232', '0', '0', 'ОружиенеистовстваветраУровень3');
INSERT INTO `world_autolearn` VALUES ('66844', '1', '64', '0', '50', '0', '0', '0', 'ЗовДухов');
INSERT INTO `world_autolearn` VALUES ('10462', '1', '64', '0', '50', '5394', '0', '0', 'ТотемисцеляющегопотокаУровень4');
INSERT INTO `world_autolearn` VALUES ('10437', '1', '64', '0', '50', '3599', '0', '0', 'ОпаляющийтотемУровень5');
INSERT INTO `world_autolearn` VALUES ('11315', '1', '64', '0', '52', '1535', '0', '0', 'КольцоогняУровень5');
INSERT INTO `world_autolearn` VALUES ('10448', '1', '64', '0', '52', '8050', '0', '0', 'ОгненныйшокУровень5');
INSERT INTO `world_autolearn` VALUES ('10467', '1', '64', '0', '52', '8004', '0', '0', 'МалаяволнаисцеленияУровень5');
INSERT INTO `world_autolearn` VALUES ('10442', '1', '64', '0', '52', '8075', '0', '0', 'ТотемсилыземлиУровень4');
INSERT INTO `world_autolearn` VALUES ('10623', '1', '64', '0', '54', '1064', '0', '0', 'ЦепноеисцелениеУровень3');
INSERT INTO `world_autolearn` VALUES ('10408', '1', '64', '0', '54', '8071', '0', '0', 'ТотемкаменнойкожиУровень6');
INSERT INTO `world_autolearn` VALUES ('10479', '1', '64', '0', '54', '8181', '0', '0', 'ТотемзащитыотмагиильдаУровень3');
INSERT INTO `world_autolearn` VALUES ('52138', '1', '64', '0', '55', '52127', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('10605', '1', '64', '0', '56', '421', '0', '0', 'ЦепнаямолнияУровень4');
INSERT INTO `world_autolearn` VALUES ('10396', '1', '64', '0', '56', '331', '0', '0', 'ВолнаисцеленияУровень9');
INSERT INTO `world_autolearn` VALUES ('10497', '1', '64', '0', '56', '5675', '0', '0', 'ТотемисточникаманыУровень4');
INSERT INTO `world_autolearn` VALUES ('16342', '1', '64', '0', '56', '8024', '0', '0', 'ОружиеязыкапламениУровень6');
INSERT INTO `world_autolearn` VALUES ('10587', '1', '64', '0', '56', '8190', '0', '0', 'ТотеммагмыУровень4');
INSERT INTO `world_autolearn` VALUES ('15208', '1', '64', '0', '56', '403', '0', '0', 'МолнияУровень10');
INSERT INTO `world_autolearn` VALUES ('10432', '1', '64', '0', '56', '324', '0', '0', 'ЩитмолнийУровень7');
INSERT INTO `world_autolearn` VALUES ('10538', '1', '64', '0', '58', '8184', '0', '0', 'ТотемзащитыотогняУровень3');
INSERT INTO `world_autolearn` VALUES ('10428', '1', '64', '0', '58', '5730', '0', '0', 'ТотемкаменногокогтяУровень6');
INSERT INTO `world_autolearn` VALUES ('10473', '1', '64', '0', '58', '8056', '0', '0', 'ЛедянойшокУровень4');
INSERT INTO `world_autolearn` VALUES ('16387', '1', '64', '0', '58', '8227', '0', '0', 'ТотемязыкапламениУровень4');
INSERT INTO `world_autolearn` VALUES ('16356', '1', '64', '0', '58', '8033', '0', '0', 'ОружиеледяногоклеймаУровень5');
INSERT INTO `world_autolearn` VALUES ('51992', '1', '64', '0', '60', '51730', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('10463', '1', '64', '0', '60', '5394', '0', '0', 'ТотемисцеляющегопотокаУровень5');
INSERT INTO `world_autolearn` VALUES ('32593', '1', '64', '0', '60', '974', '0', '0', 'ЩитземлиУровень2');
INSERT INTO `world_autolearn` VALUES ('10414', '1', '64', '0', '60', '8042', '0', '0', 'ЗемнойшокУровень7');
INSERT INTO `world_autolearn` VALUES ('10438', '1', '64', '0', '60', '3599', '0', '0', 'ОпаляющийтотемУровень6');
INSERT INTO `world_autolearn` VALUES ('29228', '1', '64', '0', '60', '8050', '0', '0', 'ОгненныйшокУровень6');
INSERT INTO `world_autolearn` VALUES ('57720', '1', '64', '0', '60', '30706', '0', '0', 'ТотемгневаУровень2');
INSERT INTO `world_autolearn` VALUES ('10601', '1', '64', '0', '60', '10595', '0', '0', 'ТотемзащитыотсилприродыУровень3');
INSERT INTO `world_autolearn` VALUES ('16362', '1', '64', '0', '60', '8232', '0', '0', 'ОружиенеистовстваветраУровень4');
INSERT INTO `world_autolearn` VALUES ('10468', '1', '64', '0', '60', '8004', '0', '0', 'МалаяволнаисцеленияУровень6');
INSERT INTO `world_autolearn` VALUES ('20777', '1', '64', '0', '60', '2008', '0', '0', 'ДухпредковУровень5');
INSERT INTO `world_autolearn` VALUES ('25357', '1', '64', '0', '60', '331', '0', '0', 'ВолнаисцеленияУровень10');
INSERT INTO `world_autolearn` VALUES ('25361', '1', '64', '0', '60', '8075', '0', '0', 'ТотемсилыземлиУровень5');
INSERT INTO `world_autolearn` VALUES ('25546', '1', '64', '0', '61', '1535', '0', '0', 'КольцоогняУровень6');
INSERT INTO `world_autolearn` VALUES ('25422', '1', '64', '0', '61', '1064', '0', '0', 'ЦепноеисцелениеУровень4');
INSERT INTO `world_autolearn` VALUES ('25448', '1', '64', '0', '62', '403', '0', '0', 'МолнияУровень11');
INSERT INTO `world_autolearn` VALUES ('24398', '1', '64', '0', '62', '52127', '0', '0', 'ВодныйщитУровень7');
INSERT INTO `world_autolearn` VALUES ('25439', '1', '64', '0', '63', '421', '0', '0', 'ЦепнаямолнияУровень5');
INSERT INTO `world_autolearn` VALUES ('25508', '1', '64', '0', '63', '8071', '0', '0', 'ТотемкаменнойкожиУровень7');
INSERT INTO `world_autolearn` VALUES ('25469', '1', '64', '0', '63', '324', '0', '0', 'ЩитмолнийУровень8');
INSERT INTO `world_autolearn` VALUES ('25391', '1', '64', '0', '63', '331', '0', '0', 'ВолнаисцеленияУровень11');
INSERT INTO `world_autolearn` VALUES ('25489', '1', '64', '0', '64', '8024', '0', '0', 'ОружиеязыкапламениУровень7');
INSERT INTO `world_autolearn` VALUES ('3738', '1', '64', '0', '64', '0', '0', '0', 'Тотемгневавоздуха');
INSERT INTO `world_autolearn` VALUES ('25528', '1', '64', '0', '65', '8075', '0', '0', 'ТотемсилыземлиУровень6');
INSERT INTO `world_autolearn` VALUES ('25552', '1', '64', '0', '65', '8190', '0', '0', 'ТотеммагмыУровень5');
INSERT INTO `world_autolearn` VALUES ('25570', '1', '64', '0', '65', '5675', '0', '0', 'ТотемисточникаманыУровень5');
INSERT INTO `world_autolearn` VALUES ('2062', '1', '64', '0', '66', '0', '0', '0', 'Тотемэлементаляземли');
INSERT INTO `world_autolearn` VALUES ('25500', '1', '64', '0', '66', '8033', '0', '0', 'ОружиеледяногоклеймаУровень6');
INSERT INTO `world_autolearn` VALUES ('25420', '1', '64', '0', '66', '8004', '0', '0', 'МалаяволнаисцеленияУровень7');
INSERT INTO `world_autolearn` VALUES ('25449', '1', '64', '0', '67', '403', '0', '0', 'МолнияУровень12');
INSERT INTO `world_autolearn` VALUES ('25560', '1', '64', '0', '67', '8181', '0', '0', 'ТотемзащитыотмагиильдаУровень4');
INSERT INTO `world_autolearn` VALUES ('25525', '1', '64', '0', '67', '5730', '0', '0', 'ТотемкаменногокогтяУровень7');
INSERT INTO `world_autolearn` VALUES ('25557', '1', '64', '0', '67', '8227', '0', '0', 'ТотемязыкапламениУровень5');
INSERT INTO `world_autolearn` VALUES ('25464', '1', '64', '0', '68', '8056', '0', '0', 'ЛедянойшокУровень5');
INSERT INTO `world_autolearn` VALUES ('25505', '1', '64', '0', '68', '8232', '0', '0', 'ОружиенеистовстваветраУровень5');
INSERT INTO `world_autolearn` VALUES ('25423', '1', '64', '0', '68', '1064', '0', '0', 'ЦепноеисцелениеУровень5');
INSERT INTO `world_autolearn` VALUES ('25563', '1', '64', '0', '68', '8184', '0', '0', 'ТотемзащитыотогняУровень4');
INSERT INTO `world_autolearn` VALUES ('2894', '1', '64', '0', '68', '0', '0', '0', 'Тотемэлементаляогня');
INSERT INTO `world_autolearn` VALUES ('25574', '1', '64', '0', '69', '10595', '0', '0', 'ТотемзащитыотсилприродыУровень4');
INSERT INTO `world_autolearn` VALUES ('25454', '1', '64', '0', '69', '8042', '0', '0', 'ЗемнойшокУровень8');
INSERT INTO `world_autolearn` VALUES ('25533', '1', '64', '0', '69', '3599', '0', '0', 'ОпаляющийтотемУровень7');
INSERT INTO `world_autolearn` VALUES ('25590', '1', '64', '0', '69', '2008', '0', '0', 'ДухпредковУровень6');
INSERT INTO `world_autolearn` VALUES ('25567', '1', '64', '0', '69', '5394', '0', '0', 'ТотемисцеляющегопотокаУровень6');
INSERT INTO `world_autolearn` VALUES ('33736', '1', '64', '0', '69', '52127', '0', '0', 'ВодныйщитУровень8');
INSERT INTO `world_autolearn` VALUES ('32594', '1', '64', '0', '70', '974', '0', '0', 'ЩитземлиУровень3');
INSERT INTO `world_autolearn` VALUES ('25547', '1', '64', '0', '70', '1535', '0', '0', 'КольцоогняУровень7');
INSERT INTO `world_autolearn` VALUES ('32182', '1', '64', '1101', '70', '0', '0', '0', 'Героизм');
INSERT INTO `world_autolearn` VALUES ('51993', '1', '64', '0', '70', '51730', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('25509', '1', '64', '0', '70', '8071', '0', '0', 'ТотемкаменнойкожиУровень8');
INSERT INTO `world_autolearn` VALUES ('25472', '1', '64', '0', '70', '324', '0', '0', 'ЩитмолнийУровень9');
INSERT INTO `world_autolearn` VALUES ('59156', '1', '64', '0', '70', '51490', '0', '0', 'ГромимолнияУровень2');
INSERT INTO `world_autolearn` VALUES ('2825', '1', '64', '690', '70', '0', '0', '0', 'Жаждакрови');
INSERT INTO `world_autolearn` VALUES ('25396', '1', '64', '0', '70', '331', '0', '0', 'ВолнаисцеленияУровень12');
INSERT INTO `world_autolearn` VALUES ('57721', '1', '64', '0', '70', '30706', '0', '0', 'ТотемгневаУровень3');
INSERT INTO `world_autolearn` VALUES ('61299', '1', '64', '0', '70', '61295', '0', '0', 'БыстринаУровень2');
INSERT INTO `world_autolearn` VALUES ('25442', '1', '64', '0', '70', '421', '0', '0', 'ЦепнаямолнияУровень6');
INSERT INTO `world_autolearn` VALUES ('25457', '1', '64', '0', '70', '8050', '0', '0', 'ОгненныйшокУровень7');
INSERT INTO `world_autolearn` VALUES ('58699', '1', '64', '0', '71', '3599', '0', '0', 'ОпаляющийтотемУровень8');
INSERT INTO `world_autolearn` VALUES ('58580', '1', '64', '0', '71', '5730', '0', '0', 'ТотемкаменногокогтяУровень8');
INSERT INTO `world_autolearn` VALUES ('58649', '1', '64', '0', '71', '8227', '0', '0', 'ТотемязыкапламениУровень6');
INSERT INTO `world_autolearn` VALUES ('58755', '1', '64', '0', '71', '5394', '0', '0', 'ТотемисцеляющегопотокаУровень7');
INSERT INTO `world_autolearn` VALUES ('58801', '1', '64', '0', '71', '8232', '0', '0', 'ОружиенеистовстваветраУровень6');
INSERT INTO `world_autolearn` VALUES ('58771', '1', '64', '0', '71', '5675', '0', '0', 'ТотемисточникаманыУровень6');
INSERT INTO `world_autolearn` VALUES ('58794', '1', '64', '0', '71', '8033', '0', '0', 'ОружиеледяногоклеймаУровень7');
INSERT INTO `world_autolearn` VALUES ('58785', '1', '64', '0', '71', '8024', '0', '0', 'ОружиеязыкапламениУровень8');
INSERT INTO `world_autolearn` VALUES ('49275', '1', '64', '0', '72', '8004', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49235', '1', '64', '0', '73', '8056', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('58751', '1', '64', '0', '73', '8071', '0', '0', 'ТотемкаменнойкожиУровень9');
INSERT INTO `world_autolearn` VALUES ('49237', '1', '64', '0', '73', '403', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('58731', '1', '64', '0', '73', '8190', '0', '0', 'ТотеммагмыУровень6');
INSERT INTO `world_autolearn` VALUES ('55458', '1', '64', '0', '74', '1064', '0', '0', 'ЦепноеисцелениеУровень6');
INSERT INTO `world_autolearn` VALUES ('49230', '1', '64', '0', '74', '8042', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49270', '1', '64', '0', '74', '421', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('61649', '1', '64', '0', '75', '1535', '0', '0', 'КольцоогняУровень8');
INSERT INTO `world_autolearn` VALUES ('58652', '1', '64', '0', '75', '8227', '0', '0', 'ТотемязыкапламениУровень7');
INSERT INTO `world_autolearn` VALUES ('58703', '1', '64', '0', '75', '3599', '0', '0', 'ОпаляющийтотемУровень9');
INSERT INTO `world_autolearn` VALUES ('59158', '1', '64', '0', '75', '51490', '0', '0', 'ГромимолнияУровень3');
INSERT INTO `world_autolearn` VALUES ('61300', '1', '64', '0', '75', '61295', '0', '0', 'БыстринаУровень3');
INSERT INTO `world_autolearn` VALUES ('58737', '1', '64', '0', '75', '8184', '0', '0', 'ТотемзащитыотогняУровень5');
INSERT INTO `world_autolearn` VALUES ('58741', '1', '64', '0', '75', '8181', '0', '0', 'ТотемзащитыотмагиильдаУровень5');
INSERT INTO `world_autolearn` VALUES ('58746', '1', '64', '0', '75', '10595', '0', '0', 'ТотемзащитыотсилприродыУровень5');
INSERT INTO `world_autolearn` VALUES ('49283', '1', '64', '0', '75', '974', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('51505', '1', '64', '0', '75', '0', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49280', '1', '64', '0', '75', '324', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49272', '1', '64', '0', '75', '331', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49232', '1', '64', '0', '75', '8050', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('57622', '1', '64', '0', '75', '8075', '0', '0', 'ТотемсилыземлиУровень7');
INSERT INTO `world_autolearn` VALUES ('58581', '1', '64', '0', '75', '5730', '0', '0', 'ТотемкаменногокогтяУровень9');
INSERT INTO `world_autolearn` VALUES ('58789', '1', '64', '0', '76', '8024', '0', '0', 'ОружиеязыкапламениУровень9');
INSERT INTO `world_autolearn` VALUES ('58803', '1', '64', '0', '76', '8232', '0', '0', 'ОружиенеистовстваветраУровень7');
INSERT INTO `world_autolearn` VALUES ('57960', '1', '64', '0', '76', '52127', '0', '0', 'ВодныйщитУровень9');
INSERT INTO `world_autolearn` VALUES ('58756', '1', '64', '0', '76', '5394', '0', '0', 'ТотемисцеляющегопотокаУровень8');
INSERT INTO `world_autolearn` VALUES ('58773', '1', '64', '0', '76', '5675', '0', '0', 'ТотемисточникаманыУровень7');
INSERT INTO `world_autolearn` VALUES ('58795', '1', '64', '0', '76', '8033', '0', '0', 'ОружиеледяногоклеймаУровень8');
INSERT INTO `world_autolearn` VALUES ('49276', '1', '64', '0', '77', '8004', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('58753', '1', '64', '0', '78', '8071', '0', '0', 'ТотемкаменнойкожиУровень10');
INSERT INTO `world_autolearn` VALUES ('58734', '1', '64', '0', '78', '8190', '0', '0', 'ТотеммагмыУровень7');
INSERT INTO `world_autolearn` VALUES ('58582', '1', '64', '0', '78', '5730', '0', '0', 'ТотемкаменногокогтяУровень10');
INSERT INTO `world_autolearn` VALUES ('49236', '1', '64', '0', '78', '8056', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49238', '1', '64', '0', '79', '403', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49231', '1', '64', '0', '79', '8042', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('58790', '1', '64', '0', '80', '8024', '0', '0', 'ОружиеязыкапламениУровень10');
INSERT INTO `world_autolearn` VALUES ('49273', '1', '64', '0', '80', '331', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('61657', '1', '64', '0', '80', '1535', '0', '0', 'КольцоогняУровень9');
INSERT INTO `world_autolearn` VALUES ('58804', '1', '64', '0', '80', '8232', '0', '0', 'ОружиенеистовстваветраУровень8');
INSERT INTO `world_autolearn` VALUES ('59159', '1', '64', '0', '80', '51490', '0', '0', 'ГромимолнияУровень4');
INSERT INTO `world_autolearn` VALUES ('49233', '1', '64', '0', '80', '8050', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49271', '1', '64', '0', '80', '421', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('61301', '1', '64', '0', '80', '61295', '0', '0', 'БыстринаУровень4');
INSERT INTO `world_autolearn` VALUES ('60043', '1', '64', '0', '80', '51505', '0', '0', 'ВыброславыУровень2');
INSERT INTO `world_autolearn` VALUES ('58796', '1', '64', '0', '80', '8033', '0', '0', 'ОружиеледяногоклеймаУровень9');
INSERT INTO `world_autolearn` VALUES ('49281', '1', '64', '0', '80', '324', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('58656', '1', '64', '0', '80', '8227', '0', '0', 'ТотемязыкапламениУровень8');
INSERT INTO `world_autolearn` VALUES ('58704', '1', '64', '0', '80', '3599', '0', '0', 'ОпаляющийтотемУровень10');
INSERT INTO `world_autolearn` VALUES ('55459', '1', '64', '0', '80', '1064', '0', '0', 'ЦепноеисцелениеУровень7');
INSERT INTO `world_autolearn` VALUES ('51994', '1', '64', '0', '80', '51730', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('58739', '1', '64', '0', '80', '8184', '0', '0', 'ТотемзащитыотогняУровень6');
INSERT INTO `world_autolearn` VALUES ('51514', '1', '64', '0', '80', '0', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('58745', '1', '64', '0', '80', '8181', '0', '0', 'ТотемзащитыотмагиильдаУровень6');
INSERT INTO `world_autolearn` VALUES ('49284', '1', '64', '0', '80', '974', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('58749', '1', '64', '0', '80', '10595', '0', '0', 'ТотемзащитыотсилприродыУровень6');
INSERT INTO `world_autolearn` VALUES ('58757', '1', '64', '0', '80', '5394', '0', '0', 'ТотемисцеляющегопотокаУровень9');
INSERT INTO `world_autolearn` VALUES ('57722', '1', '64', '0', '80', '30706', '0', '0', 'ТотемгневаУровень4');
INSERT INTO `world_autolearn` VALUES ('58774', '1', '64', '0', '80', '5675', '0', '0', 'ТотемисточникаманыУровень8');
INSERT INTO `world_autolearn` VALUES ('49277', '1', '64', '0', '80', '2008', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('58643', '1', '64', '0', '80', '8075', '0', '0', 'ТотемсилыземлиУровень8');
INSERT INTO `world_autolearn` VALUES ('6673', '1', '1', '0', '1', '0', '0', '0', 'БоевойкрикУровень1');
INSERT INTO `world_autolearn` VALUES ('100', '1', '1', '0', '4', '0', '0', '0', 'РывокУровень1');
INSERT INTO `world_autolearn` VALUES ('772', '1', '1', '0', '4', '0', '0', '0', 'КровопусканиеУровень1');
INSERT INTO `world_autolearn` VALUES ('6343', '1', '1', '0', '6', '0', '0', '0', 'УдаргромаУровень1');
INSERT INTO `world_autolearn` VALUES ('34428', '1', '1', '0', '6', '0', '0', '0', 'Победныйраж');
INSERT INTO `world_autolearn` VALUES ('1715', '1', '1', '0', '8', '0', '0', '0', 'Подрезатьсухожилия');
INSERT INTO `world_autolearn` VALUES ('284', '1', '1', '0', '8', '78', '0', '0', 'УдаргерояУровень2');
INSERT INTO `world_autolearn` VALUES ('71', '1', '1', '0', '10', '0', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('7386', '1', '1', '0', '10', '0', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('355', '1', '1', '0', '10', '0', '0', '0', '');
INSERT INTO `world_autolearn` VALUES ('6546', '1', '1', '0', '10', '772', '0', '0', 'КровопусканиеУровень2');
INSERT INTO `world_autolearn` VALUES ('2687', '1', '1', '0', '10', '0', '0', '0', 'Кроваваяярость');
INSERT INTO `world_autolearn` VALUES ('5242', '1', '1', '0', '12', '6673', '0', '0', 'БоевойкрикУровень2');
INSERT INTO `world_autolearn` VALUES ('7384', '1', '1', '0', '12', '0', '0', '0', 'Превосходство');
INSERT INTO `world_autolearn` VALUES ('72', '1', '1', '0', '12', '0', '0', '0', 'Ударщитом');
INSERT INTO `world_autolearn` VALUES ('6572', '1', '1', '0', '14', '0', '0', '0', 'РеваншУровень1');
INSERT INTO `world_autolearn` VALUES ('1160', '1', '1', '0', '14', '0', '0', '0', 'ДеморализующийкрикУровень1');
INSERT INTO `world_autolearn` VALUES ('2565', '1', '1', '0', '16', '0', '0', '0', 'Блокщитом');
INSERT INTO `world_autolearn` VALUES ('285', '1', '1', '0', '16', '78', '0', '0', 'УдаргерояУровень3');
INSERT INTO `world_autolearn` VALUES ('694', '1', '1', '0', '16', '0', '0', '0', 'Дразнящийудар');
INSERT INTO `world_autolearn` VALUES ('676', '1', '1', '0', '18', '0', '0', '0', 'Разоружение');
INSERT INTO `world_autolearn` VALUES ('8198', '1', '1', '0', '18', '6343', '0', '0', 'УдаргромаУровень2');
INSERT INTO `world_autolearn` VALUES ('12678', '1', '1', '0', '20', '0', '0', '0', 'ЗнаниебоевыхстоекПассивная');
INSERT INTO `world_autolearn` VALUES ('20230', '1', '1', '0', '20', '0', '0', '0', 'Возмездие');
INSERT INTO `world_autolearn` VALUES ('6547', '1', '1', '0', '20', '772', '0', '0', 'КровопусканиеУровень3');
INSERT INTO `world_autolearn` VALUES ('845', '1', '1', '0', '20', '0', '0', '0', 'РассекающийударУровень1');
INSERT INTO `world_autolearn` VALUES ('6192', '1', '1', '0', '22', '6673', '0', '0', 'БоевойкрикУровень3');
INSERT INTO `world_autolearn` VALUES ('5246', '1', '1', '0', '22', '0', '0', '0', 'Устрашающийкрик');
INSERT INTO `world_autolearn` VALUES ('1608', '1', '1', '0', '24', '78', '0', '0', 'УдаргерояУровень4');
INSERT INTO `world_autolearn` VALUES ('6190', '1', '1', '0', '24', '1160', '0', '0', 'ДеморализующийкрикУровень2');
INSERT INTO `world_autolearn` VALUES ('6574', '1', '1', '0', '24', '6572', '0', '0', 'РеваншУровень2');
INSERT INTO `world_autolearn` VALUES ('5308', '1', '1', '0', '24', '0', '0', '0', 'КазньУровень1');
INSERT INTO `world_autolearn` VALUES ('6178', '1', '1', '0', '26', '100', '0', '0', 'РывокУровень2');
INSERT INTO `world_autolearn` VALUES ('1161', '1', '1', '0', '26', '0', '0', '0', 'Вызывающийкрик');
INSERT INTO `world_autolearn` VALUES ('8204', '1', '1', '0', '28', '6343', '0', '0', 'УдаргромаУровень3');
INSERT INTO `world_autolearn` VALUES ('871', '1', '1', '0', '28', '0', '0', '0', 'Глухаяоборона');
INSERT INTO `world_autolearn` VALUES ('20252', '1', '1', '0', '30', '0', '0', '0', 'Перехват');
INSERT INTO `world_autolearn` VALUES ('2458', '1', '1', '0', '30', '0', '0', '0', 'Стойкаберсерка');
INSERT INTO `world_autolearn` VALUES ('7369', '1', '1', '0', '30', '845', '0', '0', 'РассекающийударУровень2');
INSERT INTO `world_autolearn` VALUES ('6548', '1', '1', '0', '30', '772', '0', '0', 'КровопусканиеУровень4');
INSERT INTO `world_autolearn` VALUES ('1464', '1', '1', '0', '30', '0', '0', '0', 'МощныйударУровень1');
INSERT INTO `world_autolearn` VALUES ('18499', '1', '1', '0', '32', '0', '0', '0', 'Яростьберсерка');
INSERT INTO `world_autolearn` VALUES ('20658', '1', '1', '0', '32', '5308', '0', '0', 'КазньУровень2');
INSERT INTO `world_autolearn` VALUES ('11549', '1', '1', '0', '32', '6673', '0', '0', 'БоевойкрикУровень4');
INSERT INTO `world_autolearn` VALUES ('11564', '1', '1', '0', '32', '78', '0', '0', 'УдаргерояУровень5');
INSERT INTO `world_autolearn` VALUES ('11554', '1', '1', '0', '34', '1160', '0', '0', 'ДеморализующийкрикУровень3');
INSERT INTO `world_autolearn` VALUES ('7379', '1', '1', '0', '34', '6572', '0', '0', 'РеваншУровень3');
INSERT INTO `world_autolearn` VALUES ('1680', '1', '1', '0', '36', '0', '0', '0', 'Вихрь');
INSERT INTO `world_autolearn` VALUES ('8820', '1', '1', '0', '38', '1464', '0', '0', 'МощныйударУровень2');
INSERT INTO `world_autolearn` VALUES ('8205', '1', '1', '0', '38', '6343', '0', '0', 'УдаргромаУровень4');
INSERT INTO `world_autolearn` VALUES ('6552', '1', '1', '0', '38', '0', '0', '0', 'Зуботычина');
INSERT INTO `world_autolearn` VALUES ('11572', '1', '1', '0', '40', '772', '0', '0', 'КровопусканиеУровень5');
INSERT INTO `world_autolearn` VALUES ('23922', '1', '1', '0', '40', '0', '0', '0', 'МощныйударщитомУровень1');
INSERT INTO `world_autolearn` VALUES ('11565', '1', '1', '0', '40', '78', '0', '0', 'УдаргерояУровень6');
INSERT INTO `world_autolearn` VALUES ('11608', '1', '1', '0', '40', '845', '0', '0', 'РассекающийударУровень3');
INSERT INTO `world_autolearn` VALUES ('20660', '1', '1', '0', '40', '5308', '0', '0', 'КазньУровень3');
INSERT INTO `world_autolearn` VALUES ('11550', '1', '1', '0', '42', '6673', '0', '0', 'БоевойкрикУровень5');
INSERT INTO `world_autolearn` VALUES ('11555', '1', '1', '0', '44', '1160', '0', '0', 'ДеморализующийкрикУровень4');
INSERT INTO `world_autolearn` VALUES ('11600', '1', '1', '0', '44', '6572', '0', '0', 'РеваншУровень4');
INSERT INTO `world_autolearn` VALUES ('11604', '1', '1', '0', '46', '1464', '0', '0', 'МощныйударУровень3');
INSERT INTO `world_autolearn` VALUES ('11578', '1', '1', '0', '46', '100', '0', '0', 'РывокУровень3');
INSERT INTO `world_autolearn` VALUES ('23923', '1', '1', '0', '48', '23922', '0', '0', 'МощныйударщитомУровень2');
INSERT INTO `world_autolearn` VALUES ('20661', '1', '1', '0', '48', '5308', '0', '0', 'КазньУровень4');
INSERT INTO `world_autolearn` VALUES ('21551', '1', '1', '0', '48', '12294', '0', '0', 'СмертельныйударУровень2');
INSERT INTO `world_autolearn` VALUES ('11566', '1', '1', '0', '48', '78', '0', '0', 'УдаргерояУровень7');
INSERT INTO `world_autolearn` VALUES ('11580', '1', '1', '0', '48', '6343', '0', '0', 'УдаргромаУровень5');
INSERT INTO `world_autolearn` VALUES ('11609', '1', '1', '0', '50', '845', '0', '0', 'РассекающийударУровень4');
INSERT INTO `world_autolearn` VALUES ('11573', '1', '1', '0', '50', '772', '0', '0', 'КровопусканиеУровень6');
INSERT INTO `world_autolearn` VALUES ('1719', '1', '1', '0', '50', '0', '0', '0', 'Безрассудство');
INSERT INTO `world_autolearn` VALUES ('11551', '1', '1', '0', '52', '6673', '0', '0', 'БоевойкрикУровень6');
INSERT INTO `world_autolearn` VALUES ('21552', '1', '1', '0', '54', '12294', '0', '0', 'СмертельныйударУровень3');
INSERT INTO `world_autolearn` VALUES ('23924', '1', '1', '0', '54', '23922', '0', '0', 'МощныйударщитомУровень3');
INSERT INTO `world_autolearn` VALUES ('11556', '1', '1', '0', '54', '1160', '0', '0', 'ДеморализующийкрикУровень5');
INSERT INTO `world_autolearn` VALUES ('11601', '1', '1', '0', '54', '6572', '0', '0', 'РеваншУровень5');
INSERT INTO `world_autolearn` VALUES ('11605', '1', '1', '0', '54', '1464', '0', '0', 'МощныйударУровень4');
INSERT INTO `world_autolearn` VALUES ('20662', '1', '1', '0', '56', '5308', '0', '0', 'КазньУровень5');
INSERT INTO `world_autolearn` VALUES ('11567', '1', '1', '0', '56', '78', '0', '0', 'УдаргерояУровень8');
INSERT INTO `world_autolearn` VALUES ('11581', '1', '1', '0', '58', '6343', '0', '0', 'УдаргромаУровень6');
INSERT INTO `world_autolearn` VALUES ('23925', '1', '1', '0', '60', '23922', '0', '0', 'МощныйударщитомУровень4');
INSERT INTO `world_autolearn` VALUES ('25286', '1', '1', '0', '60', '78', '0', '0', 'УдаргерояУровень9');
INSERT INTO `world_autolearn` VALUES ('25288', '1', '1', '0', '60', '6572', '0', '0', 'РеваншУровень6');
INSERT INTO `world_autolearn` VALUES ('21553', '1', '1', '0', '60', '12294', '0', '0', 'СмертельныйударУровень4');
INSERT INTO `world_autolearn` VALUES ('11574', '1', '1', '0', '60', '772', '0', '0', 'КровопусканиеУровень7');
INSERT INTO `world_autolearn` VALUES ('25289', '1', '1', '0', '60', '6673', '0', '0', 'БоевойкрикУровень7');
INSERT INTO `world_autolearn` VALUES ('20569', '1', '1', '0', '60', '845', '0', '0', 'РассекающийударУровень5');
INSERT INTO `world_autolearn` VALUES ('30016', '1', '1', '0', '60', '20243', '0', '0', 'СокрушениеУровень2');
INSERT INTO `world_autolearn` VALUES ('25241', '1', '1', '0', '61', '1464', '0', '0', 'МощныйударУровень5');
INSERT INTO `world_autolearn` VALUES ('25202', '1', '1', '0', '62', '1160', '0', '0', 'ДеморализующийкрикУровень6');
INSERT INTO `world_autolearn` VALUES ('25269', '1', '1', '0', '63', '6572', '0', '0', 'РеваншУровень7');
INSERT INTO `world_autolearn` VALUES ('23920', '1', '1', '0', '64', '0', '0', '0', 'Отражениезаклинания');
INSERT INTO `world_autolearn` VALUES ('25234', '1', '1', '0', '65', '5308', '0', '0', 'КазньУровень6');
INSERT INTO `world_autolearn` VALUES ('25258', '1', '1', '0', '66', '23922', '0', '0', 'МощныйударщитомУровень5');
INSERT INTO `world_autolearn` VALUES ('29707', '1', '1', '0', '66', '78', '0', '0', 'УдаргерояУровень10');
INSERT INTO `world_autolearn` VALUES ('25248', '1', '1', '0', '66', '12294', '0', '0', 'СмертельныйударУровень5');
INSERT INTO `world_autolearn` VALUES ('25264', '1', '1', '0', '67', '6343', '0', '0', 'УдаргромаУровень7');
INSERT INTO `world_autolearn` VALUES ('469', '1', '1', '0', '68', '0', '0', '0', 'КомандирскийкрикУровень1');
INSERT INTO `world_autolearn` VALUES ('25231', '1', '1', '0', '68', '845', '0', '0', 'РассекающийударУровень6');
INSERT INTO `world_autolearn` VALUES ('25208', '1', '1', '0', '68', '772', '0', '0', 'КровопусканиеУровень8');
INSERT INTO `world_autolearn` VALUES ('25242', '1', '1', '0', '69', '1464', '0', '0', 'МощныйударУровень6');
INSERT INTO `world_autolearn` VALUES ('2048', '1', '1', '0', '69', '6673', '0', '0', 'БоевойкрикУровень8');
INSERT INTO `world_autolearn` VALUES ('30330', '1', '1', '0', '70', '12294', '0', '0', 'СмертельныйударУровень6');
INSERT INTO `world_autolearn` VALUES ('30356', '1', '1', '0', '70', '23922', '0', '0', 'МощныйударщитомУровень6');
INSERT INTO `world_autolearn` VALUES ('30357', '1', '1', '0', '70', '6572', '0', '0', 'РеваншУровень8');
INSERT INTO `world_autolearn` VALUES ('30324', '1', '1', '0', '70', '78', '0', '0', 'УдаргерояУровень11');
INSERT INTO `world_autolearn` VALUES ('30022', '1', '1', '0', '70', '20243', '0', '0', 'СокрушениеУровень3');
INSERT INTO `world_autolearn` VALUES ('25203', '1', '1', '0', '70', '1160', '0', '0', 'ДеморализующийкрикУровень7');
INSERT INTO `world_autolearn` VALUES ('25236', '1', '1', '0', '70', '5308', '0', '0', 'КазньУровень7');
INSERT INTO `world_autolearn` VALUES ('3411', '1', '1', '0', '70', '0', '0', '0', 'Вмешательство');
INSERT INTO `world_autolearn` VALUES ('46845', '1', '1', '0', '71', '772', '0', '0', 'КровопусканиеУровень9');
INSERT INTO `world_autolearn` VALUES ('64382', '1', '1', '0', '71', '0', '0', '0', 'Сокрушительныйбросок');
INSERT INTO `world_autolearn` VALUES ('47449', '1', '1', '0', '72', '78', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47519', '1', '1', '0', '72', '845', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47470', '1', '1', '0', '73', '5308', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47501', '1', '1', '0', '73', '6343', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47439', '1', '1', '0', '74', '469', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47474', '1', '1', '0', '74', '1464', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('55694', '1', '1', '0', '75', '0', '0', '0', 'Безудержноевосстановление');
INSERT INTO `world_autolearn` VALUES ('47485', '1', '1', '0', '75', '12294', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47497', '1', '1', '0', '75', '20243', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47487', '1', '1', '0', '75', '23922', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47450', '1', '1', '0', '76', '78', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47465', '1', '1', '0', '76', '772', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47520', '1', '1', '0', '77', '845', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47502', '1', '1', '0', '78', '6343', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47436', '1', '1', '0', '78', '6673', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47475', '1', '1', '0', '79', '1464', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47437', '1', '1', '0', '79', '1160', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47498', '1', '1', '0', '80', '20243', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47488', '1', '1', '0', '80', '23922', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47486', '1', '1', '0', '80', '12294', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47440', '1', '1', '0', '80', '469', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('57755', '1', '1', '0', '80', '0', '0', '0', 'Героическийбросок');
INSERT INTO `world_autolearn` VALUES ('57823', '1', '1', '0', '80', '6572', '0', '0', 'РеваншУровень9');
INSERT INTO `world_autolearn` VALUES ('47471', '1', '1', '0', '80', '5308', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('465', '1', '2', '0', '1', '0', '0', '0', 'АураблагочестияУровень1');
INSERT INTO `world_autolearn` VALUES ('19740', '1', '2', '0', '4', '0', '0', '0', 'БлагословениемогуществаУровень1');
INSERT INTO `world_autolearn` VALUES ('20271', '1', '2', '0', '4', '0', '0', '0', 'Правосудиесвета');
INSERT INTO `world_autolearn` VALUES ('498', '1', '2', '0', '6', '0', '0', '0', 'Божественнаязащита');
INSERT INTO `world_autolearn` VALUES ('639', '1', '2', '0', '6', '635', '0', '0', 'СветнебесУровень2');
INSERT INTO `world_autolearn` VALUES ('853', '1', '2', '0', '8', '0', '0', '0', 'МолотправосудияУровень1');
INSERT INTO `world_autolearn` VALUES ('1152', '1', '2', '0', '8', '0', '0', '0', 'Омовение');
INSERT INTO `world_autolearn` VALUES ('633', '1', '2', '0', '10', '0', '0', '0', 'ВозложениерукУровень1');
INSERT INTO `world_autolearn` VALUES ('10290', '1', '2', '0', '10', '465', '0', '0', 'АураблагочестияУровень2');
INSERT INTO `world_autolearn` VALUES ('1022', '1', '2', '0', '10', '0', '0', '0', 'ДланьзащитыУровень1');
INSERT INTO `world_autolearn` VALUES ('53408', '1', '2', '0', '12', '0', '0', '0', 'Правосудиемудрости');
INSERT INTO `world_autolearn` VALUES ('19834', '1', '2', '0', '12', '19740', '0', '0', 'БлагословениемогуществаУровень2');
INSERT INTO `world_autolearn` VALUES ('7328', '1', '2', '0', '12', '0', '0', '0', 'ИскуплениеУровень1');
INSERT INTO `world_autolearn` VALUES ('19742', '1', '2', '0', '14', '0', '0', '0', 'БлагословениемудростиУровень1');
INSERT INTO `world_autolearn` VALUES ('31789', '1', '2', '0', '14', '0', '0', '0', 'Праведнаязащита');
INSERT INTO `world_autolearn` VALUES ('647', '1', '2', '0', '14', '635', '0', '0', 'СветнебесУровень3');
INSERT INTO `world_autolearn` VALUES ('25780', '1', '2', '0', '16', '0', '0', '0', 'Праведноенеистовство');
INSERT INTO `world_autolearn` VALUES ('7294', '1', '2', '0', '16', '0', '0', '0', 'АуравоздаянияУровень1');
INSERT INTO `world_autolearn` VALUES ('62124', '1', '2', '0', '16', '0', '0', '0', 'Дланьвозмездия');
INSERT INTO `world_autolearn` VALUES ('1044', '1', '2', '0', '18', '0', '0', '0', 'Дланьсвободы');
INSERT INTO `world_autolearn` VALUES ('34769', '1', '2', '690', '20', '0', '0', '0', 'Призывбоевогоконя');
INSERT INTO `world_autolearn` VALUES ('13819', '1', '2', '1101', '20', '0', '0', '0', 'Призывбоевогоконя');
INSERT INTO `world_autolearn` VALUES ('19750', '1', '2', '0', '20', '0', '0', '0', 'ВспышкаСветаУровень1');
INSERT INTO `world_autolearn` VALUES ('5502', '1', '2', '0', '20', '0', '0', '0', 'Чутьенанежить');
INSERT INTO `world_autolearn` VALUES ('20217', '1', '2', '0', '20', '0', '0', '0', 'Благословениекоролей');
INSERT INTO `world_autolearn` VALUES ('643', '1', '2', '0', '20', '465', '0', '0', 'АураблагочестияУровень3');
INSERT INTO `world_autolearn` VALUES ('26573', '1', '2', '0', '20', '0', '0', '0', 'ОсвящениеУровень1');
INSERT INTO `world_autolearn` VALUES ('879', '1', '2', '0', '20', '0', '0', '0', 'ЭкзорцизмУровень1');
INSERT INTO `world_autolearn` VALUES ('19835', '1', '2', '0', '22', '19740', '0', '0', 'БлагословениемогуществаУровень3');
INSERT INTO `world_autolearn` VALUES ('20164', '1', '2', '0', '22', '0', '0', '0', 'Печатьсправедливости');
INSERT INTO `world_autolearn` VALUES ('1026', '1', '2', '0', '22', '635', '0', '0', 'СветнебесУровень4');
INSERT INTO `world_autolearn` VALUES ('19746', '1', '2', '0', '22', '0', '0', '0', 'Аурасосредоточенности');
INSERT INTO `world_autolearn` VALUES ('10322', '1', '2', '0', '24', '7328', '0', '0', 'ИскуплениеУровень2');
INSERT INTO `world_autolearn` VALUES ('5599', '1', '2', '0', '24', '1022', '0', '0', 'ДланьзащитыУровень2');
INSERT INTO `world_autolearn` VALUES ('10326', '1', '2', '0', '24', '0', '0', '0', 'Изгнаниезла');
INSERT INTO `world_autolearn` VALUES ('5588', '1', '2', '0', '24', '853', '0', '0', 'МолотправосудияУровень2');
INSERT INTO `world_autolearn` VALUES ('19850', '1', '2', '0', '24', '19742', '0', '0', 'БлагословениемудростиУровень2');
INSERT INTO `world_autolearn` VALUES ('10298', '1', '2', '0', '26', '7294', '0', '0', 'АуравоздаянияУровень2');
INSERT INTO `world_autolearn` VALUES ('1038', '1', '2', '0', '26', '0', '0', '0', 'Дланьспасения');
INSERT INTO `world_autolearn` VALUES ('19939', '1', '2', '0', '26', '19750', '0', '0', 'ВспышкаСветаУровень2');
INSERT INTO `world_autolearn` VALUES ('53407', '1', '2', '0', '28', '0', '0', '0', 'Правосудиесправедливости');
INSERT INTO `world_autolearn` VALUES ('19876', '1', '2', '0', '28', '0', '0', '0', 'АуразащитыоттемноймагииУровень1');
INSERT INTO `world_autolearn` VALUES ('5614', '1', '2', '0', '28', '879', '0', '0', 'ЭкзорцизмУровень2');
INSERT INTO `world_autolearn` VALUES ('19752', '1', '2', '0', '30', '0', '0', '0', 'Божественноевмешательство');
INSERT INTO `world_autolearn` VALUES ('20165', '1', '2', '0', '30', '0', '0', '0', 'ПечатьСвета');
INSERT INTO `world_autolearn` VALUES ('2800', '1', '2', '0', '30', '633', '0', '0', 'ВозложениерукУровень2');
INSERT INTO `world_autolearn` VALUES ('10291', '1', '2', '0', '30', '465', '0', '0', 'АураблагочестияУровень4');
INSERT INTO `world_autolearn` VALUES ('1042', '1', '2', '0', '30', '635', '0', '0', 'СветнебесУровень5');
INSERT INTO `world_autolearn` VALUES ('20116', '1', '2', '0', '30', '26573', '0', '0', 'ОсвящениеУровень2');
INSERT INTO `world_autolearn` VALUES ('19836', '1', '2', '0', '32', '19740', '0', '0', 'БлагословениемогуществаУровень4');
INSERT INTO `world_autolearn` VALUES ('19888', '1', '2', '0', '32', '0', '0', '0', 'АуразащитыотмагиильдаУровень1');
INSERT INTO `world_autolearn` VALUES ('19852', '1', '2', '0', '34', '19742', '0', '0', 'БлагословениемудростиУровень3');
INSERT INTO `world_autolearn` VALUES ('19940', '1', '2', '0', '34', '19750', '0', '0', 'ВспышкаСветаУровень3');
INSERT INTO `world_autolearn` VALUES ('642', '1', '2', '0', '34', '0', '0', '0', 'Божественныйщит');
INSERT INTO `world_autolearn` VALUES ('19891', '1', '2', '0', '36', '0', '0', '0', 'АуразащитыотогняУровень1');
INSERT INTO `world_autolearn` VALUES ('5615', '1', '2', '0', '36', '879', '0', '0', 'ЭкзорцизмУровень3');
INSERT INTO `world_autolearn` VALUES ('10324', '1', '2', '0', '36', '7328', '0', '0', 'ИскуплениеУровень3');
INSERT INTO `world_autolearn` VALUES ('10299', '1', '2', '0', '36', '7294', '0', '0', 'АуравоздаянияУровень3');
INSERT INTO `world_autolearn` VALUES ('10278', '1', '2', '0', '38', '1022', '0', '0', 'ДланьзащитыУровень3');
INSERT INTO `world_autolearn` VALUES ('20166', '1', '2', '0', '38', '0', '0', '0', 'Печатьмудрости');
INSERT INTO `world_autolearn` VALUES ('3472', '1', '2', '0', '38', '635', '0', '0', 'СветнебесУровень6');
INSERT INTO `world_autolearn` VALUES ('23214', '1', '2', '1101', '40', '0', '0', '0', 'Призывскакуна');
INSERT INTO `world_autolearn` VALUES ('34767', '1', '2', '690', '40', '0', '0', '0', 'Призывскакуна');
INSERT INTO `world_autolearn` VALUES ('19895', '1', '2', '0', '40', '19876', '0', '0', 'АуразащитыоттемноймагииУровень2');
INSERT INTO `world_autolearn` VALUES ('1032', '1', '2', '0', '40', '465', '0', '0', 'АураблагочестияУровень5');
INSERT INTO `world_autolearn` VALUES ('20922', '1', '2', '0', '40', '26573', '0', '0', 'ОсвящениеУровень3');
INSERT INTO `world_autolearn` VALUES ('5589', '1', '2', '0', '40', '853', '0', '0', 'МолотправосудияУровень3');
INSERT INTO `world_autolearn` VALUES ('19941', '1', '2', '0', '42', '19750', '0', '0', 'ВспышкаСветаУровень4');
INSERT INTO `world_autolearn` VALUES ('19837', '1', '2', '0', '42', '19740', '0', '0', 'БлагословениемогуществаУровень5');
INSERT INTO `world_autolearn` VALUES ('4987', '1', '2', '0', '42', '0', '0', '0', 'Очищение');
INSERT INTO `world_autolearn` VALUES ('24275', '1', '2', '0', '44', '0', '0', '0', 'МолотгневаУровень1');
INSERT INTO `world_autolearn` VALUES ('19897', '1', '2', '0', '44', '19888', '0', '0', 'АуразащитыотмагиильдаУровень2');
INSERT INTO `world_autolearn` VALUES ('10312', '1', '2', '0', '44', '879', '0', '0', 'ЭкзорцизмУровень4');
INSERT INTO `world_autolearn` VALUES ('19853', '1', '2', '0', '44', '19742', '0', '0', 'БлагословениемудростиУровень4');
INSERT INTO `world_autolearn` VALUES ('10300', '1', '2', '0', '46', '7294', '0', '0', 'АуравоздаянияУровень4');
INSERT INTO `world_autolearn` VALUES ('6940', '1', '2', '0', '46', '0', '0', '0', 'Дланьжертвенности');
INSERT INTO `world_autolearn` VALUES ('10328', '1', '2', '0', '46', '635', '0', '0', 'СветнебесУровень7');
INSERT INTO `world_autolearn` VALUES ('19899', '1', '2', '0', '48', '19891', '0', '0', 'АуразащитыотогняУровень2');
INSERT INTO `world_autolearn` VALUES ('20929', '1', '2', '0', '48', '20473', '0', '0', 'ШокнебесУровень2');
INSERT INTO `world_autolearn` VALUES ('20772', '1', '2', '0', '48', '7328', '0', '0', 'ИскуплениеУровень4');
INSERT INTO `world_autolearn` VALUES ('20923', '1', '2', '0', '50', '26573', '0', '0', 'ОсвящениеУровень4');
INSERT INTO `world_autolearn` VALUES ('20927', '1', '2', '0', '50', '20925', '0', '0', 'ЩитнебесУровень2');
INSERT INTO `world_autolearn` VALUES ('2812', '1', '2', '0', '50', '0', '0', '0', 'ГневнебесУровень1');
INSERT INTO `world_autolearn` VALUES ('10292', '1', '2', '0', '50', '465', '0', '0', 'АураблагочестияУровень6');
INSERT INTO `world_autolearn` VALUES ('10310', '1', '2', '0', '50', '633', '0', '0', 'ВозложениерукУровень3');
INSERT INTO `world_autolearn` VALUES ('19942', '1', '2', '0', '50', '19750', '0', '0', 'ВспышкаСветаУровень5');
INSERT INTO `world_autolearn` VALUES ('25782', '1', '2', '0', '52', '0', '0', '0', 'ВеликоеблагословениемогуществаУр.1');
INSERT INTO `world_autolearn` VALUES ('19896', '1', '2', '0', '52', '19876', '0', '0', 'АуразащитыоттемноймагииУровень3');
INSERT INTO `world_autolearn` VALUES ('24274', '1', '2', '0', '52', '24275', '0', '0', 'МолотгневаУровень2');
INSERT INTO `world_autolearn` VALUES ('19838', '1', '2', '0', '52', '19740', '0', '0', 'БлагословениемогуществаУровень6');
INSERT INTO `world_autolearn` VALUES ('10313', '1', '2', '0', '52', '879', '0', '0', 'ЭкзорцизмУровень5');
INSERT INTO `world_autolearn` VALUES ('10308', '1', '2', '0', '54', '853', '0', '0', 'МолотправосудияУровень4');
INSERT INTO `world_autolearn` VALUES ('25894', '1', '2', '0', '54', '0', '0', '0', 'ВеликоеблагословениемудростиУр.1');
INSERT INTO `world_autolearn` VALUES ('10329', '1', '2', '0', '54', '635', '0', '0', 'СветнебесУровень8');
INSERT INTO `world_autolearn` VALUES ('19854', '1', '2', '0', '54', '19742', '0', '0', 'БлагословениемудростиУровень5');
INSERT INTO `world_autolearn` VALUES ('20930', '1', '2', '0', '56', '20473', '0', '0', 'ШокнебесУровень3');
INSERT INTO `world_autolearn` VALUES ('10301', '1', '2', '0', '56', '7294', '0', '0', 'АуравоздаянияУровень5');
INSERT INTO `world_autolearn` VALUES ('19898', '1', '2', '0', '56', '19888', '0', '0', 'АуразащитыотмагиильдаУровень3');
INSERT INTO `world_autolearn` VALUES ('19943', '1', '2', '0', '58', '19750', '0', '0', 'ВспышкаСветаУровень6');
INSERT INTO `world_autolearn` VALUES ('25898', '1', '2', '0', '60', '0', '0', '0', 'Великоеблагословениекоролей');
INSERT INTO `world_autolearn` VALUES ('25899', '1', '2', '0', '60', '0', '0', '0', 'Великоеблагословениенеприкосновенности');
INSERT INTO `world_autolearn` VALUES ('25916', '1', '2', '0', '60', '25782', '0', '0', 'ВеликоеблагословениемогуществаУр.2');
INSERT INTO `world_autolearn` VALUES ('32699', '1', '2', '0', '60', '31935', '0', '0', 'ЩитмстителяУровень2');
INSERT INTO `world_autolearn` VALUES ('25918', '1', '2', '0', '60', '25894', '0', '0', 'ВеликоеблагословениемудростиУр.2');
INSERT INTO `world_autolearn` VALUES ('10293', '1', '2', '0', '60', '465', '0', '0', 'АураблагочестияУровень7');
INSERT INTO `world_autolearn` VALUES ('25292', '1', '2', '0', '60', '635', '0', '0', 'СветнебесУровень9');
INSERT INTO `world_autolearn` VALUES ('10318', '1', '2', '0', '60', '2812', '0', '0', 'ГневнебесУровень2');
INSERT INTO `world_autolearn` VALUES ('20924', '1', '2', '0', '60', '26573', '0', '0', 'ОсвящениеУровень5');
INSERT INTO `world_autolearn` VALUES ('20773', '1', '2', '0', '60', '7328', '0', '0', 'ИскуплениеУровень5');
INSERT INTO `world_autolearn` VALUES ('19900', '1', '2', '0', '60', '19891', '0', '0', 'АуразащитыотогняУровень3');
INSERT INTO `world_autolearn` VALUES ('10314', '1', '2', '0', '60', '879', '0', '0', 'ЭкзорцизмУровень6');
INSERT INTO `world_autolearn` VALUES ('24239', '1', '2', '0', '60', '24275', '0', '0', 'МолотгневаУровень3');
INSERT INTO `world_autolearn` VALUES ('25290', '1', '2', '0', '60', '19742', '0', '0', 'БлагословениемудростиУровень6');
INSERT INTO `world_autolearn` VALUES ('25291', '1', '2', '0', '60', '19740', '0', '0', 'БлагословениемогуществаУровень7');
INSERT INTO `world_autolearn` VALUES ('20928', '1', '2', '0', '60', '20925', '0', '0', 'ЩитнебесУровень3');
INSERT INTO `world_autolearn` VALUES ('32223', '1', '2', '0', '62', '0', '0', '0', 'АуравоинаСвета');
INSERT INTO `world_autolearn` VALUES ('27135', '1', '2', '0', '62', '635', '0', '0', 'СветнебесУровень10');
INSERT INTO `world_autolearn` VALUES ('27151', '1', '2', '0', '63', '19876', '0', '0', 'АуразащитыоттемноймагииУровень4');
INSERT INTO `world_autolearn` VALUES ('31801', '1', '2', '1101', '64', '0', '0', '0', 'Печатьмщения');
INSERT INTO `world_autolearn` VALUES ('53736', '1', '2', '690', '66', '0', '0', '0', 'Печатьпорчи');
INSERT INTO `world_autolearn` VALUES ('27174', '1', '2', '0', '64', '20473', '0', '0', 'ШокнебесУровень4');
INSERT INTO `world_autolearn` VALUES ('27142', '1', '2', '0', '65', '19742', '0', '0', 'БлагословениемудростиУровень7');
INSERT INTO `world_autolearn` VALUES ('27143', '1', '2', '0', '65', '25894', '0', '0', 'ВеликоеблагословениемудростиУр.3');
INSERT INTO `world_autolearn` VALUES ('27137', '1', '2', '0', '66', '19750', '0', '0', 'ВспышкаСветаУровень7');
INSERT INTO `world_autolearn` VALUES ('27150', '1', '2', '0', '66', '7294', '0', '0', 'АуравоздаянияУровень6');
INSERT INTO `world_autolearn` VALUES ('27180', '1', '2', '0', '68', '24275', '0', '0', 'МолотгневаУровень4');
INSERT INTO `world_autolearn` VALUES ('27152', '1', '2', '0', '68', '19888', '0', '0', 'АуразащитыотмагиильдаУровень4');
INSERT INTO `world_autolearn` VALUES ('27138', '1', '2', '0', '68', '879', '0', '0', 'ЭкзорцизмУровень7');
INSERT INTO `world_autolearn` VALUES ('27139', '1', '2', '0', '69', '2812', '0', '0', 'ГневнебесУровень3');
INSERT INTO `world_autolearn` VALUES ('27154', '1', '2', '0', '69', '633', '0', '0', 'ВозложениерукУровень4');
INSERT INTO `world_autolearn` VALUES ('32700', '1', '2', '0', '70', '31935', '0', '0', 'ЩитмстителяУровень3');
INSERT INTO `world_autolearn` VALUES ('33072', '1', '2', '0', '70', '20473', '0', '0', 'ШокнебесУровень5');
INSERT INTO `world_autolearn` VALUES ('31884', '1', '2', '0', '70', '0', '0', '0', 'Гневкарателя');
INSERT INTO `world_autolearn` VALUES ('27136', '1', '2', '0', '70', '635', '0', '0', 'СветнебесУровень11');
INSERT INTO `world_autolearn` VALUES ('27141', '1', '2', '0', '70', '25782', '0', '0', 'ВеликоеблагословениемогуществаУр.3');
INSERT INTO `world_autolearn` VALUES ('27140', '1', '2', '0', '70', '19740', '0', '0', 'БлагословениемогуществаУровень8');
INSERT INTO `world_autolearn` VALUES ('27149', '1', '2', '0', '70', '465', '0', '0', 'АураблагочестияУровень8');
INSERT INTO `world_autolearn` VALUES ('27153', '1', '2', '0', '70', '19891', '0', '0', 'АуразащитыотогняУровень4');
INSERT INTO `world_autolearn` VALUES ('27173', '1', '2', '0', '70', '26573', '0', '0', 'ОсвящениеУровень6');
INSERT INTO `world_autolearn` VALUES ('27179', '1', '2', '0', '70', '20925', '0', '0', 'ЩитнебесУровень4');
INSERT INTO `world_autolearn` VALUES ('48935', '1', '2', '0', '71', '19742', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48937', '1', '2', '0', '71', '25894', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('54428', '1', '2', '0', '71', '0', '0', '0', 'Святаяклятва');
INSERT INTO `world_autolearn` VALUES ('48949', '1', '2', '0', '72', '7328', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48816', '1', '2', '0', '72', '2812', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48800', '1', '2', '0', '73', '879', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48933', '1', '2', '0', '73', '25782', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48931', '1', '2', '0', '73', '19740', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48941', '1', '2', '0', '74', '465', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48805', '1', '2', '0', '74', '24275', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48784', '1', '2', '0', '74', '19750', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48951', '1', '2', '0', '75', '20925', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('53600', '1', '2', '0', '75', '0', '0', '0', 'ЩитправедностиУровень1');
INSERT INTO `world_autolearn` VALUES ('48826', '1', '2', '0', '75', '31935', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48781', '1', '2', '0', '75', '635', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48818', '1', '2', '0', '75', '26573', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48824', '1', '2', '0', '75', '20473', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('54043', '1', '2', '0', '76', '7294', '0', '0', 'АуравоздаянияУровень7');
INSERT INTO `world_autolearn` VALUES ('48943', '1', '2', '0', '76', '19876', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48938', '1', '2', '0', '77', '25894', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48936', '1', '2', '0', '77', '19742', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48945', '1', '2', '0', '77', '19888', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48947', '1', '2', '0', '78', '19891', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48788', '1', '2', '0', '78', '633', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48817', '1', '2', '0', '78', '2812', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48950', '1', '2', '0', '79', '7328', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48932', '1', '2', '0', '79', '19740', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48942', '1', '2', '0', '79', '465', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48785', '1', '2', '0', '79', '19750', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48934', '1', '2', '0', '79', '25782', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48801', '1', '2', '0', '79', '879', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('61411', '1', '2', '0', '80', '53600', '0', '0', 'ЩитправедностиУровень2');
INSERT INTO `world_autolearn` VALUES ('48782', '1', '2', '0', '80', '635', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48806', '1', '2', '0', '80', '24275', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48819', '1', '2', '0', '80', '26573', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48827', '1', '2', '0', '80', '31935', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48952', '1', '2', '0', '80', '20925', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48825', '1', '2', '0', '80', '20473', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('53601', '1', '2', '0', '80', '0', '0', '0', 'СвященныйщитУровень1');
INSERT INTO `world_autolearn` VALUES ('1243', '1', '16', '0', '1', '0', '0', '0', 'Словосилы:СтойкостьУровень1');
INSERT INTO `world_autolearn` VALUES ('589', '1', '16', '0', '4', '0', '0', '0', 'СловоТьмы:БольУровень1');
INSERT INTO `world_autolearn` VALUES ('2052', '1', '16', '0', '4', '2050', '0', '0', 'МалоеисцелениеУровень2');
INSERT INTO `world_autolearn` VALUES ('17', '1', '16', '0', '6', '0', '0', '0', 'Словосилы:ЩитУровень1');
INSERT INTO `world_autolearn` VALUES ('591', '1', '16', '0', '6', '585', '0', '0', 'КараУровень2');
INSERT INTO `world_autolearn` VALUES ('139', '1', '16', '0', '8', '0', '0', '0', 'ОбновлениеУровень1');
INSERT INTO `world_autolearn` VALUES ('586', '1', '16', '0', '8', '0', '0', '0', 'Уходвтень');
INSERT INTO `world_autolearn` VALUES ('594', '1', '16', '0', '10', '589', '0', '0', 'СловоТьмы:БольУровень2');
INSERT INTO `world_autolearn` VALUES ('2006', '1', '16', '0', '10', '0', '0', '0', 'ВоскрешениеУровень1');
INSERT INTO `world_autolearn` VALUES ('8092', '1', '16', '0', '10', '0', '0', '0', 'ВзрывразумаУровень1');
INSERT INTO `world_autolearn` VALUES ('2053', '1', '16', '0', '10', '2050', '0', '0', 'МалоеисцелениеУровень3');
INSERT INTO `world_autolearn` VALUES ('588', '1', '16', '0', '12', '0', '0', '0', 'ВнутреннийогоньУровень1');
INSERT INTO `world_autolearn` VALUES ('1244', '1', '16', '0', '12', '1243', '0', '0', 'Словосилы:СтойкостьУровень2');
INSERT INTO `world_autolearn` VALUES ('592', '1', '16', '0', '12', '17', '0', '0', 'Словосилы:ЩитУровень2');
INSERT INTO `world_autolearn` VALUES ('8122', '1', '16', '0', '14', '0', '0', '0', 'МентальныйкрикУровень1');
INSERT INTO `world_autolearn` VALUES ('598', '1', '16', '0', '14', '585', '0', '0', 'КараУровень3');
INSERT INTO `world_autolearn` VALUES ('6074', '1', '16', '0', '14', '139', '0', '0', 'ОбновлениеУровень2');
INSERT INTO `world_autolearn` VALUES ('528', '1', '16', '0', '14', '0', '0', '0', 'Излечениеболезни');
INSERT INTO `world_autolearn` VALUES ('8102', '1', '16', '0', '16', '8092', '0', '0', 'ВзрывразумаУровень2');
INSERT INTO `world_autolearn` VALUES ('2054', '1', '16', '0', '16', '0', '0', '0', 'ИсцелениеУровень1');
INSERT INTO `world_autolearn` VALUES ('970', '1', '16', '0', '18', '589', '0', '0', 'СловоТьмы:БольУровень3');
INSERT INTO `world_autolearn` VALUES ('527', '1', '16', '0', '18', '0', '0', '0', 'РассеиваниезаклинанийУровень1');
INSERT INTO `world_autolearn` VALUES ('600', '1', '16', '0', '18', '17', '0', '0', 'Словосилы:ЩитУровень3');
INSERT INTO `world_autolearn` VALUES ('2061', '1', '16', '0', '20', '0', '0', '0', 'БыстроеисцелениеУровень1');
INSERT INTO `world_autolearn` VALUES ('6075', '1', '16', '0', '20', '139', '0', '0', 'ОбновлениеУровень3');
INSERT INTO `world_autolearn` VALUES ('453', '1', '16', '0', '20', '0', '0', '0', 'Усмирение');
INSERT INTO `world_autolearn` VALUES ('9484', '1', '16', '0', '20', '0', '0', '0', 'СковываниенежитиУровень1');
INSERT INTO `world_autolearn` VALUES ('2944', '1', '16', '0', '20', '0', '0', '0', 'ВсепожирающаячумаУровень1');
INSERT INTO `world_autolearn` VALUES ('14914', '1', '16', '0', '20', '0', '0', '0', 'СвященныйогоньУровень1');
INSERT INTO `world_autolearn` VALUES ('7128', '1', '16', '0', '20', '588', '0', '0', 'ВнутреннийогоньУровень2');
INSERT INTO `world_autolearn` VALUES ('6346', '1', '16', '0', '20', '0', '0', '0', 'Защитаотстраха');
INSERT INTO `world_autolearn` VALUES ('15237', '1', '16', '0', '20', '0', '0', '0', 'КольцосветаУровень1');
INSERT INTO `world_autolearn` VALUES ('8103', '1', '16', '0', '22', '8092', '0', '0', 'ВзрывразумаУровень3');
INSERT INTO `world_autolearn` VALUES ('2096', '1', '16', '0', '22', '0', '0', '0', 'ВнутреннеезрениеУровень1');
INSERT INTO `world_autolearn` VALUES ('2055', '1', '16', '0', '22', '2054', '0', '0', 'ИсцелениеУровень2');
INSERT INTO `world_autolearn` VALUES ('984', '1', '16', '0', '22', '585', '0', '0', 'КараУровень4');
INSERT INTO `world_autolearn` VALUES ('2010', '1', '16', '0', '22', '2006', '0', '0', 'ВоскрешениеУровень2');
INSERT INTO `world_autolearn` VALUES ('8129', '1', '16', '0', '24', '0', '0', '0', 'Сожжениеманы');
INSERT INTO `world_autolearn` VALUES ('1245', '1', '16', '0', '24', '1243', '0', '0', 'Словосилы:СтойкостьУровень3');
INSERT INTO `world_autolearn` VALUES ('15262', '1', '16', '0', '24', '14914', '0', '0', 'СвященныйогоньУровень2');
INSERT INTO `world_autolearn` VALUES ('3747', '1', '16', '0', '24', '17', '0', '0', 'Словосилы:ЩитУровень4');
INSERT INTO `world_autolearn` VALUES ('9472', '1', '16', '0', '26', '2061', '0', '0', 'БыстроеисцелениеУровень2');
INSERT INTO `world_autolearn` VALUES ('992', '1', '16', '0', '26', '589', '0', '0', 'СловоТьмы:БольУровень4');
INSERT INTO `world_autolearn` VALUES ('19238', '1', '16', '0', '26', '19236', '0', '0', 'МолитваотчаянияУровень2');
INSERT INTO `world_autolearn` VALUES ('6076', '1', '16', '0', '26', '139', '0', '0', 'ОбновлениеУровень4');
INSERT INTO `world_autolearn` VALUES ('17311', '1', '16', '0', '28', '15407', '0', '0', 'ПыткаразумаУровень2');
INSERT INTO `world_autolearn` VALUES ('19276', '1', '16', '0', '28', '2944', '0', '0', 'ВсепожирающаячумаУровень2');
INSERT INTO `world_autolearn` VALUES ('8104', '1', '16', '0', '28', '8092', '0', '0', 'ВзрывразумаУровень4');
INSERT INTO `world_autolearn` VALUES ('15430', '1', '16', '0', '28', '15237', '0', '0', 'КольцосветаУровень2');
INSERT INTO `world_autolearn` VALUES ('8124', '1', '16', '0', '28', '8122', '0', '0', 'МентальныйкрикУровень2');
INSERT INTO `world_autolearn` VALUES ('6063', '1', '16', '0', '28', '2054', '0', '0', 'ИсцелениеУровень3');
INSERT INTO `world_autolearn` VALUES ('602', '1', '16', '0', '30', '588', '0', '0', 'ВнутреннийогоньУровень3');
INSERT INTO `world_autolearn` VALUES ('14752', '1', '16', '0', '30', '0', '0', '0', 'БожественныйдухУровень1');
INSERT INTO `world_autolearn` VALUES ('15263', '1', '16', '0', '30', '14914', '0', '0', 'СвященныйогоньУровень3');
INSERT INTO `world_autolearn` VALUES ('976', '1', '16', '0', '30', '0', '0', '0', 'ЗащитаоттемноймагииУровень1');
INSERT INTO `world_autolearn` VALUES ('6065', '1', '16', '0', '30', '17', '0', '0', 'Словосилы:ЩитУровень5');
INSERT INTO `world_autolearn` VALUES ('1004', '1', '16', '0', '30', '585', '0', '0', 'КараУровень5');
INSERT INTO `world_autolearn` VALUES ('605', '1', '16', '0', '30', '0', '0', '0', 'Контрольнадразумом');
INSERT INTO `world_autolearn` VALUES ('596', '1', '16', '0', '30', '0', '0', '0', 'МолитваисцеленияУровень1');
INSERT INTO `world_autolearn` VALUES ('552', '1', '16', '0', '32', '0', '0', '0', 'Устранениеболезни');
INSERT INTO `world_autolearn` VALUES ('6077', '1', '16', '0', '32', '139', '0', '0', 'ОбновлениеУровень5');
INSERT INTO `world_autolearn` VALUES ('9473', '1', '16', '0', '32', '2061', '0', '0', 'БыстроеисцелениеУровень3');
INSERT INTO `world_autolearn` VALUES ('1706', '1', '16', '0', '34', '0', '0', '0', 'Левитация');
INSERT INTO `world_autolearn` VALUES ('10880', '1', '16', '0', '34', '2006', '0', '0', 'ВоскрешениеУровень3');
INSERT INTO `world_autolearn` VALUES ('19240', '1', '16', '0', '34', '19236', '0', '0', 'МолитваотчаянияУровень3');
INSERT INTO `world_autolearn` VALUES ('6064', '1', '16', '0', '34', '2054', '0', '0', 'ИсцелениеУровень4');
INSERT INTO `world_autolearn` VALUES ('2767', '1', '16', '0', '34', '589', '0', '0', 'СловоТьмы:БольУровень5');
INSERT INTO `world_autolearn` VALUES ('8105', '1', '16', '0', '34', '8092', '0', '0', 'ВзрывразумаУровень5');
INSERT INTO `world_autolearn` VALUES ('6066', '1', '16', '0', '36', '17', '0', '0', 'Словосилы:ЩитУровень6');
INSERT INTO `world_autolearn` VALUES ('19277', '1', '16', '0', '36', '2944', '0', '0', 'ВсепожирающаячумаУровень3');
INSERT INTO `world_autolearn` VALUES ('17312', '1', '16', '0', '36', '15407', '0', '0', 'ПыткаразумаУровень3');
INSERT INTO `world_autolearn` VALUES ('988', '1', '16', '0', '36', '527', '0', '0', 'РассеиваниезаклинанийУровень2');
INSERT INTO `world_autolearn` VALUES ('15431', '1', '16', '0', '36', '15237', '0', '0', 'КольцосветаУровень3');
INSERT INTO `world_autolearn` VALUES ('2791', '1', '16', '0', '36', '1243', '0', '0', 'Словосилы:СтойкостьУровень4');
INSERT INTO `world_autolearn` VALUES ('15264', '1', '16', '0', '36', '14914', '0', '0', 'СвященныйогоньУровень4');
INSERT INTO `world_autolearn` VALUES ('6060', '1', '16', '0', '38', '585', '0', '0', 'КараУровень6');
INSERT INTO `world_autolearn` VALUES ('9474', '1', '16', '0', '38', '2061', '0', '0', 'БыстроеисцелениеУровень4');
INSERT INTO `world_autolearn` VALUES ('6078', '1', '16', '0', '38', '139', '0', '0', 'ОбновлениеУровень6');
INSERT INTO `world_autolearn` VALUES ('2060', '1', '16', '0', '40', '0', '0', '0', 'ВеликоеисцелениеУровень1');
INSERT INTO `world_autolearn` VALUES ('1006', '1', '16', '0', '40', '588', '0', '0', 'ВнутреннийогоньУровень4');
INSERT INTO `world_autolearn` VALUES ('9485', '1', '16', '0', '40', '9484', '0', '0', 'СковываниенежитиУровень2');
INSERT INTO `world_autolearn` VALUES ('996', '1', '16', '0', '40', '596', '0', '0', 'МолитваисцеленияУровень2');
INSERT INTO `world_autolearn` VALUES ('14818', '1', '16', '0', '40', '14752', '0', '0', 'БожественныйдухУровень2');
INSERT INTO `world_autolearn` VALUES ('8106', '1', '16', '0', '40', '8092', '0', '0', 'ВзрывразумаУровень6');
INSERT INTO `world_autolearn` VALUES ('19241', '1', '16', '0', '42', '19236', '0', '0', 'МолитваотчаянияУровень4');
INSERT INTO `world_autolearn` VALUES ('10957', '1', '16', '0', '42', '976', '0', '0', 'ЗащитаоттемноймагииУровень2');
INSERT INTO `world_autolearn` VALUES ('15265', '1', '16', '0', '42', '14914', '0', '0', 'СвященныйогоньУровень5');
INSERT INTO `world_autolearn` VALUES ('10888', '1', '16', '0', '42', '8122', '0', '0', 'МентальныйкрикУровень3');
INSERT INTO `world_autolearn` VALUES ('10898', '1', '16', '0', '42', '17', '0', '0', 'Словосилы:ЩитУровень7');
INSERT INTO `world_autolearn` VALUES ('10892', '1', '16', '0', '42', '589', '0', '0', 'СловоТьмы:БольУровень6');
INSERT INTO `world_autolearn` VALUES ('19278', '1', '16', '0', '44', '2944', '0', '0', 'ВсепожирающаячумаУровень4');
INSERT INTO `world_autolearn` VALUES ('10927', '1', '16', '0', '44', '139', '0', '0', 'ОбновлениеУровень7');
INSERT INTO `world_autolearn` VALUES ('10915', '1', '16', '0', '44', '2061', '0', '0', 'БыстроеисцелениеУровень5');
INSERT INTO `world_autolearn` VALUES ('10909', '1', '16', '0', '44', '2096', '0', '0', 'ВнутреннеезрениеУровень2');
INSERT INTO `world_autolearn` VALUES ('27799', '1', '16', '0', '44', '15237', '0', '0', 'КольцосветаУровень4');
INSERT INTO `world_autolearn` VALUES ('17313', '1', '16', '0', '44', '15407', '0', '0', 'ПыткаразумаУровень4');
INSERT INTO `world_autolearn` VALUES ('10963', '1', '16', '0', '46', '2060', '0', '0', 'ВеликоеисцелениеУровень2');
INSERT INTO `world_autolearn` VALUES ('10945', '1', '16', '0', '46', '8092', '0', '0', 'ВзрывразумаУровень7');
INSERT INTO `world_autolearn` VALUES ('10933', '1', '16', '0', '46', '585', '0', '0', 'КараУровень7');
INSERT INTO `world_autolearn` VALUES ('10881', '1', '16', '0', '46', '2006', '0', '0', 'ВоскрешениеУровень4');
INSERT INTO `world_autolearn` VALUES ('15266', '1', '16', '0', '48', '14914', '0', '0', 'СвященныйогоньУровень6');
INSERT INTO `world_autolearn` VALUES ('10937', '1', '16', '0', '48', '1243', '0', '0', 'Словосилы:СтойкостьУровень5');
INSERT INTO `world_autolearn` VALUES ('10899', '1', '16', '0', '48', '17', '0', '0', 'Словосилы:ЩитУровень8');
INSERT INTO `world_autolearn` VALUES ('21562', '1', '16', '0', '48', '0', '0', '0', 'МолитвастойкостиУровень1');
INSERT INTO `world_autolearn` VALUES ('10960', '1', '16', '0', '50', '596', '0', '0', 'МолитваисцеленияУровень3');
INSERT INTO `world_autolearn` VALUES ('10893', '1', '16', '0', '50', '589', '0', '0', 'СловоТьмы:БольУровень7');
INSERT INTO `world_autolearn` VALUES ('14819', '1', '16', '0', '50', '14752', '0', '0', 'БожественныйдухУровень3');
INSERT INTO `world_autolearn` VALUES ('10916', '1', '16', '0', '50', '2061', '0', '0', 'БыстроеисцелениеУровень6');
INSERT INTO `world_autolearn` VALUES ('10928', '1', '16', '0', '50', '139', '0', '0', 'ОбновлениеУровень8');
INSERT INTO `world_autolearn` VALUES ('19242', '1', '16', '0', '50', '19236', '0', '0', 'МолитваотчаянияУровень5');
INSERT INTO `world_autolearn` VALUES ('10951', '1', '16', '0', '50', '588', '0', '0', 'ВнутреннийогоньУровень5');
INSERT INTO `world_autolearn` VALUES ('27870', '1', '16', '0', '50', '724', '0', '0', 'КолодецСветаУровень2');
INSERT INTO `world_autolearn` VALUES ('19279', '1', '16', '0', '52', '2944', '0', '0', 'ВсепожирающаячумаУровень5');
INSERT INTO `world_autolearn` VALUES ('27800', '1', '16', '0', '52', '15237', '0', '0', 'КольцосветаУровень5');
INSERT INTO `world_autolearn` VALUES ('17314', '1', '16', '0', '52', '15407', '0', '0', 'ПыткаразумаУровень5');
INSERT INTO `world_autolearn` VALUES ('10946', '1', '16', '0', '52', '8092', '0', '0', 'ВзрывразумаУровень8');
INSERT INTO `world_autolearn` VALUES ('10964', '1', '16', '0', '52', '2060', '0', '0', 'ВеликоеисцелениеУровень3');
INSERT INTO `world_autolearn` VALUES ('15267', '1', '16', '0', '54', '14914', '0', '0', 'СвященныйогоньУровень7');
INSERT INTO `world_autolearn` VALUES ('10900', '1', '16', '0', '54', '17', '0', '0', 'Словосилы:ЩитУровень9');
INSERT INTO `world_autolearn` VALUES ('10934', '1', '16', '0', '54', '585', '0', '0', 'КараУровень8');
INSERT INTO `world_autolearn` VALUES ('10958', '1', '16', '0', '56', '976', '0', '0', 'ЗащитаоттемноймагииУровень3');
INSERT INTO `world_autolearn` VALUES ('10929', '1', '16', '0', '56', '139', '0', '0', 'ОбновлениеУровень9');
INSERT INTO `world_autolearn` VALUES ('27683', '1', '16', '0', '56', '0', '0', '0', 'МолитвазащитыоттемноймагииУр.1');
INSERT INTO `world_autolearn` VALUES ('10917', '1', '16', '0', '56', '2061', '0', '0', 'БыстроеисцелениеУровень7');
INSERT INTO `world_autolearn` VALUES ('34863', '1', '16', '0', '56', '34861', '0', '0', 'КругисцеленияУровень2');
INSERT INTO `world_autolearn` VALUES ('10890', '1', '16', '0', '56', '8122', '0', '0', 'МентальныйкрикУровень4');
INSERT INTO `world_autolearn` VALUES ('20770', '1', '16', '0', '58', '2006', '0', '0', 'ВоскрешениеУровень5');
INSERT INTO `world_autolearn` VALUES ('10894', '1', '16', '0', '58', '589', '0', '0', 'СловоТьмы:БольУровень8');
INSERT INTO `world_autolearn` VALUES ('19243', '1', '16', '0', '58', '19236', '0', '0', 'МолитваотчаянияУровень6');
INSERT INTO `world_autolearn` VALUES ('10947', '1', '16', '0', '58', '8092', '0', '0', 'ВзрывразумаУровень9');
INSERT INTO `world_autolearn` VALUES ('10965', '1', '16', '0', '58', '2060', '0', '0', 'ВеликоеисцелениеУровень4');
INSERT INTO `world_autolearn` VALUES ('25314', '1', '16', '0', '60', '2060', '0', '0', 'ВеликоеисцелениеУровень5');
INSERT INTO `world_autolearn` VALUES ('25315', '1', '16', '0', '60', '139', '0', '0', 'ОбновлениеУровень10');
INSERT INTO `world_autolearn` VALUES ('27841', '1', '16', '0', '60', '14752', '0', '0', 'БожественныйдухУровень4');
INSERT INTO `world_autolearn` VALUES ('27801', '1', '16', '0', '60', '15237', '0', '0', 'КольцосветаУровень6');
INSERT INTO `world_autolearn` VALUES ('27681', '1', '16', '0', '60', '0', '0', '0', 'МолитвадухаУровень1');
INSERT INTO `world_autolearn` VALUES ('25316', '1', '16', '0', '60', '596', '0', '0', 'МолитваисцеленияУровень5');
INSERT INTO `world_autolearn` VALUES ('27871', '1', '16', '0', '60', '724', '0', '0', 'КолодецСветаУровень3');
INSERT INTO `world_autolearn` VALUES ('34864', '1', '16', '0', '60', '34861', '0', '0', 'КругисцеленияУровень3');
INSERT INTO `world_autolearn` VALUES ('15261', '1', '16', '0', '60', '14914', '0', '0', 'СвященныйогоньУровень8');
INSERT INTO `world_autolearn` VALUES ('10961', '1', '16', '0', '60', '596', '0', '0', 'МолитваисцеленияУровень4');
INSERT INTO `world_autolearn` VALUES ('18807', '1', '16', '0', '60', '15407', '0', '0', 'ПыткаразумаУровень6');
INSERT INTO `world_autolearn` VALUES ('10952', '1', '16', '0', '60', '588', '0', '0', 'ВнутреннийогоньУровень6');
INSERT INTO `world_autolearn` VALUES ('10938', '1', '16', '0', '60', '1243', '0', '0', 'Словосилы:СтойкостьУровень6');
INSERT INTO `world_autolearn` VALUES ('10955', '1', '16', '0', '60', '9484', '0', '0', 'СковываниенежитиУровень3');
INSERT INTO `world_autolearn` VALUES ('19280', '1', '16', '0', '60', '2944', '0', '0', 'ВсепожирающаячумаУровень6');
INSERT INTO `world_autolearn` VALUES ('10901', '1', '16', '0', '60', '17', '0', '0', 'Словосилы:ЩитУровень10');
INSERT INTO `world_autolearn` VALUES ('21564', '1', '16', '0', '60', '21562', '0', '0', 'МолитвастойкостиУровень2');
INSERT INTO `world_autolearn` VALUES ('34916', '1', '16', '0', '60', '34914', '0', '0', 'ПрикосновениевампираУровень2');
INSERT INTO `world_autolearn` VALUES ('25233', '1', '16', '0', '61', '2061', '0', '0', 'БыстроеисцелениеУровень8');
INSERT INTO `world_autolearn` VALUES ('25363', '1', '16', '0', '61', '585', '0', '0', 'КараУровень9');
INSERT INTO `world_autolearn` VALUES ('32379', '1', '16', '0', '62', '0', '0', '0', 'СловоТьмы:СмертьУровень1');
INSERT INTO `world_autolearn` VALUES ('25372', '1', '16', '0', '63', '8092', '0', '0', 'ВзрывразумаУровень10');
INSERT INTO `world_autolearn` VALUES ('25210', '1', '16', '0', '63', '2060', '0', '0', 'ВеликоеисцелениеУровень6');
INSERT INTO `world_autolearn` VALUES ('32546', '1', '16', '0', '64', '0', '0', '0', 'СвязующееисцелениеУровень1');
INSERT INTO `world_autolearn` VALUES ('25217', '1', '16', '0', '65', '17', '0', '0', 'Словосилы:ЩитУровень11');
INSERT INTO `world_autolearn` VALUES ('25367', '1', '16', '0', '65', '589', '0', '0', 'СловоТьмы:БольУровень9');
INSERT INTO `world_autolearn` VALUES ('34865', '1', '16', '0', '65', '34861', '0', '0', 'КругисцеленияУровень4');
INSERT INTO `world_autolearn` VALUES ('25221', '1', '16', '0', '65', '139', '0', '0', 'ОбновлениеУровень11');
INSERT INTO `world_autolearn` VALUES ('34433', '1', '16', '0', '66', '0', '0', '0', 'ИсчадиеТьмы');
INSERT INTO `world_autolearn` VALUES ('25437', '1', '16', '0', '66', '19236', '0', '0', 'МолитваотчаянияУровень7');
INSERT INTO `world_autolearn` VALUES ('25384', '1', '16', '0', '66', '14914', '0', '0', 'СвященныйогоньУровень9');
INSERT INTO `world_autolearn` VALUES ('25235', '1', '16', '0', '67', '2061', '0', '0', 'БыстроеисцелениеУровень9');
INSERT INTO `world_autolearn` VALUES ('25213', '1', '16', '0', '68', '2060', '0', '0', 'ВеликоеисцелениеУровень7');
INSERT INTO `world_autolearn` VALUES ('25467', '1', '16', '0', '68', '2944', '0', '0', 'ВсепожирающаячумаУровень7');
INSERT INTO `world_autolearn` VALUES ('33076', '1', '16', '0', '68', '0', '0', '0', 'МолитвавосстановленияУровень1');
INSERT INTO `world_autolearn` VALUES ('25308', '1', '16', '0', '68', '596', '0', '0', 'МолитваисцеленияУровень6');
INSERT INTO `world_autolearn` VALUES ('25387', '1', '16', '0', '68', '15407', '0', '0', 'ПыткаразумаУровень7');
INSERT INTO `world_autolearn` VALUES ('25331', '1', '16', '0', '68', '15237', '0', '0', 'КольцосветаУровень7');
INSERT INTO `world_autolearn` VALUES ('25433', '1', '16', '0', '68', '976', '0', '0', 'ЗащитаоттемноймагииУровень4');
INSERT INTO `world_autolearn` VALUES ('25435', '1', '16', '0', '68', '2006', '0', '0', 'ВоскрешениеУровень6');
INSERT INTO `world_autolearn` VALUES ('25364', '1', '16', '0', '69', '585', '0', '0', 'КараУровень10');
INSERT INTO `world_autolearn` VALUES ('25431', '1', '16', '0', '69', '588', '0', '0', 'ВнутреннийогоньУровень7');
INSERT INTO `world_autolearn` VALUES ('25375', '1', '16', '0', '69', '8092', '0', '0', 'ВзрывразумаУровень11');
INSERT INTO `world_autolearn` VALUES ('34917', '1', '16', '0', '70', '34914', '0', '0', 'ПрикосновениевампираУровень3');
INSERT INTO `world_autolearn` VALUES ('53005', '1', '16', '0', '70', '47540', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('39374', '1', '16', '0', '70', '27683', '0', '0', 'МолитвазащитыоттемноймагииУр.2');
INSERT INTO `world_autolearn` VALUES ('34866', '1', '16', '0', '70', '34861', '0', '0', 'КругисцеленияУровень5');
INSERT INTO `world_autolearn` VALUES ('32999', '1', '16', '0', '70', '27681', '0', '0', 'МолитвадухаУровень2');
INSERT INTO `world_autolearn` VALUES ('25218', '1', '16', '0', '70', '17', '0', '0', 'Словосилы:ЩитУровень12');
INSERT INTO `world_autolearn` VALUES ('25222', '1', '16', '0', '70', '139', '0', '0', 'ОбновлениеУровень12');
INSERT INTO `world_autolearn` VALUES ('25312', '1', '16', '0', '70', '14752', '0', '0', 'БожественныйдухУровень5');
INSERT INTO `world_autolearn` VALUES ('25368', '1', '16', '0', '70', '589', '0', '0', 'СловоТьмы:БольУровень10');
INSERT INTO `world_autolearn` VALUES ('25389', '1', '16', '0', '70', '1243', '0', '0', 'Словосилы:СтойкостьУровень7');
INSERT INTO `world_autolearn` VALUES ('25392', '1', '16', '0', '70', '21562', '0', '0', 'МолитвастойкостиУровень3');
INSERT INTO `world_autolearn` VALUES ('28275', '1', '16', '0', '70', '724', '0', '0', 'КолодецСветаУровень4');
INSERT INTO `world_autolearn` VALUES ('32375', '1', '16', '0', '70', '0', '0', '0', 'Массовоерассеивание');
INSERT INTO `world_autolearn` VALUES ('32996', '1', '16', '0', '70', '32379', '0', '0', 'СловоТьмы:СмертьУровень2');
INSERT INTO `world_autolearn` VALUES ('48040', '1', '16', '0', '71', '588', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48134', '1', '16', '0', '72', '14914', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48119', '1', '16', '0', '72', '32546', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48070', '1', '16', '0', '73', '2061', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48299', '1', '16', '0', '73', '2944', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48172', '1', '16', '0', '73', '19236', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48062', '1', '16', '0', '73', '2060', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48112', '1', '16', '0', '74', '33076', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48155', '1', '16', '0', '74', '15407', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48126', '1', '16', '0', '74', '8092', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48122', '1', '16', '0', '74', '585', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('53006', '1', '16', '0', '75', '47540', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48086', '1', '16', '0', '75', '724', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48124', '1', '16', '0', '75', '589', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48157', '1', '16', '0', '75', '32379', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48159', '1', '16', '0', '75', '34914', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48088', '1', '16', '0', '75', '34861', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48067', '1', '16', '0', '75', '139', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48065', '1', '16', '0', '75', '17', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48077', '1', '16', '0', '75', '15237', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48045', '1', '16', '0', '75', '0', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48169', '1', '16', '0', '76', '976', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48072', '1', '16', '0', '76', '596', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48170', '1', '16', '0', '77', '27683', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48168', '1', '16', '0', '77', '588', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48063', '1', '16', '0', '78', '2060', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48171', '1', '16', '0', '78', '2006', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48120', '1', '16', '0', '78', '32546', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48135', '1', '16', '0', '78', '14914', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48071', '1', '16', '0', '79', '2061', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48300', '1', '16', '0', '79', '2944', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48127', '1', '16', '0', '79', '8092', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48113', '1', '16', '0', '79', '33076', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48123', '1', '16', '0', '79', '585', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('53007', '1', '16', '0', '80', '47540', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('64843', '1', '16', '0', '80', '0', '0', '0', 'БожественныйгимнУровень1');
INSERT INTO `world_autolearn` VALUES ('53023', '1', '16', '0', '80', '48045', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48173', '1', '16', '0', '80', '19236', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48162', '1', '16', '0', '80', '21562', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48066', '1', '16', '0', '80', '17', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48087', '1', '16', '0', '80', '724', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48078', '1', '16', '0', '80', '15237', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48074', '1', '16', '0', '80', '27681', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48073', '1', '16', '0', '80', '14752', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48125', '1', '16', '0', '80', '589', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48156', '1', '16', '0', '80', '15407', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48068', '1', '16', '0', '80', '139', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48158', '1', '16', '0', '80', '32379', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48089', '1', '16', '0', '80', '34861', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48160', '1', '16', '0', '80', '34914', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48161', '1', '16', '0', '80', '1243', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('64901', '1', '16', '0', '80', '0', '0', '0', 'Гимннадежды');
INSERT INTO `world_autolearn` VALUES ('53343', '1', '32', '0', '0', '0', '0', '0', 'Руналедяногожара');
INSERT INTO `world_autolearn` VALUES ('53341', '1', '32', '0', '0', '0', '0', '0', 'Рунаоплавленноголедника');
INSERT INTO `world_autolearn` VALUES ('46584', '1', '32', '0', '0', '0', '0', '0', 'Воскрешениемертвых');
INSERT INTO `world_autolearn` VALUES ('50842', '1', '32', '0', '56', '0', '0', '0', 'Мор');
INSERT INTO `world_autolearn` VALUES ('49998', '1', '32', '0', '56', '0', '0', '0', 'Ударсмерти');
INSERT INTO `world_autolearn` VALUES ('48263', '1', '32', '0', '57', '0', '0', '0', 'Властькрови');
INSERT INTO `world_autolearn` VALUES ('53342', '1', '32', '0', '57', '0', '0', '0', 'Рунасокрушениячар');
INSERT INTO `world_autolearn` VALUES ('47528', '1', '32', '0', '57', '0', '0', '0', 'Заморозкаразума');
INSERT INTO `world_autolearn` VALUES ('54447', '1', '32', '0', '57', '0', '0', '0', 'Рунаразрушениячар');
INSERT INTO `world_autolearn` VALUES ('48721', '1', '32', '0', '58', '0', '0', '0', 'Вскипаниекрови');
INSERT INTO `world_autolearn` VALUES ('45524', '1', '32', '0', '58', '0', '0', '0', 'Ледяныеоковы');
INSERT INTO `world_autolearn` VALUES ('55258', '1', '32', '0', '59', '55050', '0', '0', 'УдарвсердцеУровень2');
INSERT INTO `world_autolearn` VALUES ('47476', '1', '32', '0', '59', '0', '0', '0', 'Удушение');
INSERT INTO `world_autolearn` VALUES ('49926', '1', '32', '0', '59', '45902', '0', '0', 'КровавыйударУровень2');
INSERT INTO `world_autolearn` VALUES ('51416', '1', '32', '0', '60', '49143', '0', '0', 'ЛедянойУдарУровень2');
INSERT INTO `world_autolearn` VALUES ('53331', '1', '32', '0', '60', '0', '0', '0', 'РунапроклятияПлети');
INSERT INTO `world_autolearn` VALUES ('49917', '1', '32', '0', '60', '45462', '0', '0', 'УдарчумыУровень2');
INSERT INTO `world_autolearn` VALUES ('43265', '1', '32', '0', '60', '0', '0', '0', 'СмертьиразложениеУровень1');
INSERT INTO `world_autolearn` VALUES ('51325', '1', '32', '0', '60', '49158', '0', '0', 'ВзрывтрупаУровень2');
INSERT INTO `world_autolearn` VALUES ('49020', '1', '32', '0', '61', '0', '0', '0', 'Уничтожение');
INSERT INTO `world_autolearn` VALUES ('49896', '1', '32', '0', '61', '45477', '0', '0', 'ЛедяноеприкосновениеУровень2');
INSERT INTO `world_autolearn` VALUES ('3714', '1', '32', '0', '61', '0', '0', '0', 'Льдистыйпуть');
INSERT INTO `world_autolearn` VALUES ('49892', '1', '32', '0', '61', '47541', '0', '0', 'ЛиксмертиУровень2');
INSERT INTO `world_autolearn` VALUES ('48792', '1', '32', '0', '62', '0', '0', '0', 'Незыблемостьльда');
INSERT INTO `world_autolearn` VALUES ('49999', '1', '32', '0', '63', '49998', '0', '0', 'УдарсмертиУровень2');
INSERT INTO `world_autolearn` VALUES ('53323', '1', '32', '0', '63', '0', '0', '0', 'Рунарасколотыхмечей');
INSERT INTO `world_autolearn` VALUES ('54446', '1', '32', '0', '63', '0', '0', '0', 'Рунасломанныхмечей');
INSERT INTO `world_autolearn` VALUES ('45529', '1', '32', '0', '64', '0', '0', '0', 'Кровоотвод');
INSERT INTO `world_autolearn` VALUES ('49927', '1', '32', '0', '64', '45902', '0', '0', 'КровавыйударУровень3');
INSERT INTO `world_autolearn` VALUES ('55259', '1', '32', '0', '64', '55050', '0', '0', 'УдарвсердцеУровень3');
INSERT INTO `world_autolearn` VALUES ('49918', '1', '32', '0', '65', '45462', '0', '0', 'УдарчумыУровень3');
INSERT INTO `world_autolearn` VALUES ('51417', '1', '32', '0', '65', '49143', '0', '0', 'ЛедянойУдарУровень3');
INSERT INTO `world_autolearn` VALUES ('57330', '1', '32', '0', '65', '0', '0', '0', 'ЗимнийгорнУровень1');
INSERT INTO `world_autolearn` VALUES ('56222', '1', '32', '0', '65', '0', '0', '0', 'Темнаявласть');
INSERT INTO `world_autolearn` VALUES ('49939', '1', '32', '0', '66', '48721', '0', '0', 'ВскипаниекровиУровень1');
INSERT INTO `world_autolearn` VALUES ('48743', '1', '32', '0', '66', '0', '0', '0', 'Смертельныйсоюз');
INSERT INTO `world_autolearn` VALUES ('56815', '1', '32', '0', '67', '0', '0', '0', 'Руническийудар');
INSERT INTO `world_autolearn` VALUES ('51423', '1', '32', '0', '67', '49020', '0', '0', 'УничтожениеУровень1');
INSERT INTO `world_autolearn` VALUES ('49936', '1', '32', '0', '67', '43265', '0', '0', 'СмертьиразложениеУровень2');
INSERT INTO `world_autolearn` VALUES ('49903', '1', '32', '0', '67', '45477', '0', '0', 'ЛедяноеприкосновениеУровень3');
INSERT INTO `world_autolearn` VALUES ('55265', '1', '32', '0', '67', '55090', '0', '0', 'УдарПлетиУровень2');
INSERT INTO `world_autolearn` VALUES ('49893', '1', '32', '0', '68', '47541', '0', '0', 'ЛиксмертиУровень1');
INSERT INTO `world_autolearn` VALUES ('48707', '1', '32', '0', '68', '0', '0', '0', 'Антимагическийпанцирь');
INSERT INTO `world_autolearn` VALUES ('49928', '1', '32', '0', '69', '45902', '0', '0', 'КровавыйудварУровень4');
INSERT INTO `world_autolearn` VALUES ('55260', '1', '32', '0', '69', '55050', '0', '0', 'УдарвсердцеУровень4');
INSERT INTO `world_autolearn` VALUES ('51418', '1', '32', '0', '70', '49143', '0', '0', 'ЛедянойУдарУровень4');
INSERT INTO `world_autolearn` VALUES ('53344', '1', '32', '0', '70', '0', '0', '0', 'Рунапавшегорыцаря');
INSERT INTO `world_autolearn` VALUES ('51409', '1', '32', '0', '70', '49184', '0', '0', 'ВоющийветерУровень2');
INSERT INTO `world_autolearn` VALUES ('49919', '1', '32', '0', '70', '45462', '0', '0', 'УдарчумыУровень4');
INSERT INTO `world_autolearn` VALUES ('51326', '1', '32', '0', '70', '49158', '0', '0', 'ВзрывтрупаУровень3');
INSERT INTO `world_autolearn` VALUES ('48265', '1', '32', '0', '70', '0', '0', '0', 'Властьнечестивости');
INSERT INTO `world_autolearn` VALUES ('45463', '1', '32', '0', '70', '49998', '0', '0', 'УдарсмертиУровень3');
INSERT INTO `world_autolearn` VALUES ('61999', '1', '32', '0', '72', '0', '0', '0', 'Воскрешениесоюзника');
INSERT INTO `world_autolearn` VALUES ('62158', '1', '32', '0', '72', '0', '0', '0', 'Рунакаменнойгоргульи');
INSERT INTO `world_autolearn` VALUES ('70164', '1', '32', '0', '72', '0', '0', '0', 'Рунанерубскогопанциря');
INSERT INTO `world_autolearn` VALUES ('49940', '1', '32', '0', '72', '48721', '0', '0', 'ВскипаниекровиУровень3');
INSERT INTO `world_autolearn` VALUES ('49937', '1', '32', '0', '73', '43265', '0', '0', 'СмертьиразложениеУровень3');
INSERT INTO `world_autolearn` VALUES ('49904', '1', '32', '0', '73', '45477', '0', '0', 'ЛедяноеприкосновениеУровень4');
INSERT INTO `world_autolearn` VALUES ('51424', '1', '32', '0', '73', '49020', '0', '0', 'УничтожениеУровень3');
INSERT INTO `world_autolearn` VALUES ('55270', '1', '32', '0', '73', '55090', '0', '0', 'УдарПлетиУровень3');
INSERT INTO `world_autolearn` VALUES ('55261', '1', '32', '0', '74', '55050', '0', '0', 'УдарвсердцеУровень5');
INSERT INTO `world_autolearn` VALUES ('49929', '1', '32', '0', '74', '45902', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49920', '1', '32', '0', '75', '45462', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49923', '1', '32', '0', '75', '49998', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('57623', '1', '32', '0', '75', '57330', '0', '0', 'ЗимнийгорнУровень2');
INSERT INTO `world_autolearn` VALUES ('51419', '1', '32', '0', '75', '49143', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('51327', '1', '32', '0', '75', '49158', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47568', '1', '32', '0', '75', '0', '0', '0', 'Усилениеруническогооружия');
INSERT INTO `world_autolearn` VALUES ('51410', '1', '32', '0', '75', '49184', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49894', '1', '32', '0', '76', '47541', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49941', '1', '32', '0', '78', '48721', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49909', '1', '32', '0', '78', '45477', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('55271', '1', '32', '0', '79', '55090', '0', '0', 'УдарПлетиУровень4');
INSERT INTO `world_autolearn` VALUES ('51425', '1', '32', '0', '79', '49020', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49895', '1', '32', '0', '80', '47541', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('42650', '1', '32', '0', '80', '0', '0', '0', 'Войскомертвых');
INSERT INTO `world_autolearn` VALUES ('49924', '1', '32', '0', '80', '49998', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('55268', '1', '32', '0', '80', '49143', '0', '0', 'ЛедянойударУровень6');
INSERT INTO `world_autolearn` VALUES ('49921', '1', '32', '0', '80', '45462', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49930', '1', '32', '0', '80', '45902', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49938', '1', '32', '0', '80', '43265', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('51328', '1', '32', '0', '80', '49158', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('51411', '1', '32', '0', '80', '49184', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('55262', '1', '32', '0', '80', '55050', '0', '0', 'УдарвсердцеУровень6');
INSERT INTO `world_autolearn` VALUES ('1459', '1', '128', '0', '1', '0', '0', '0', 'ЧародейскийинтеллектУровень1');
INSERT INTO `world_autolearn` VALUES ('116', '1', '128', '0', '4', '0', '0', '0', 'ЛедянаястрелаУровень1');
INSERT INTO `world_autolearn` VALUES ('5504', '1', '128', '0', '4', '0', '0', '0', 'СотворениеводыУровень1');
INSERT INTO `world_autolearn` VALUES ('143', '1', '128', '0', '6', '133', '0', '0', 'ОгненныйшарУровень2');
INSERT INTO `world_autolearn` VALUES ('587', '1', '128', '0', '6', '0', '0', '0', 'СотворениепищиУровень1');
INSERT INTO `world_autolearn` VALUES ('2136', '1', '128', '0', '6', '0', '0', '0', 'ОгненныйвзрывУровень1');
INSERT INTO `world_autolearn` VALUES ('5143', '1', '128', '0', '8', '0', '0', '0', 'ЧародейскиестрелыУровень1');
INSERT INTO `world_autolearn` VALUES ('205', '1', '128', '0', '8', '116', '0', '0', 'ЛедянаястрелаУровень2');
INSERT INTO `world_autolearn` VALUES ('118', '1', '128', '0', '8', '0', '0', '0', 'ПревращениеУровень1');
INSERT INTO `world_autolearn` VALUES ('7300', '1', '128', '0', '10', '168', '0', '0', 'МорозныйдоспехУровень2');
INSERT INTO `world_autolearn` VALUES ('122', '1', '128', '0', '10', '0', '0', '0', 'КольцольдаУровень1');
INSERT INTO `world_autolearn` VALUES ('5505', '1', '128', '0', '10', '5504', '0', '0', 'СотворениеводыУровень2');
INSERT INTO `world_autolearn` VALUES ('130', '1', '128', '0', '12', '0', '0', '0', 'Замедленноепадение');
INSERT INTO `world_autolearn` VALUES ('145', '1', '128', '0', '12', '133', '0', '0', 'ОгненныйшарУровень3');
INSERT INTO `world_autolearn` VALUES ('604', '1', '128', '0', '12', '0', '0', '0', 'ОслаблениемагииУровень1');
INSERT INTO `world_autolearn` VALUES ('597', '1', '128', '0', '12', '587', '0', '0', 'СотворениепищиУровень2');
INSERT INTO `world_autolearn` VALUES ('1449', '1', '128', '0', '14', '0', '0', '0', 'ЧародейскийвзрывУровень1');
INSERT INTO `world_autolearn` VALUES ('1460', '1', '128', '0', '14', '1459', '0', '0', 'ЧародейскийинтеллектУровень2');
INSERT INTO `world_autolearn` VALUES ('2137', '1', '128', '0', '14', '2136', '0', '0', 'ОгненныйвзрывУровень2');
INSERT INTO `world_autolearn` VALUES ('837', '1', '128', '0', '14', '116', '0', '0', 'ЛедянаястрелаУровень3');
INSERT INTO `world_autolearn` VALUES ('5144', '1', '128', '0', '16', '5143', '0', '0', 'ЧародейскиестрелыУровень2');
INSERT INTO `world_autolearn` VALUES ('2120', '1', '128', '0', '16', '0', '0', '0', 'ОгненныйстолбУровень1');
INSERT INTO `world_autolearn` VALUES ('3140', '1', '128', '0', '18', '133', '0', '0', 'ОгненныйшарУровень4');
INSERT INTO `world_autolearn` VALUES ('1008', '1', '128', '0', '18', '0', '0', '0', 'УсилениемагииУровень1');
INSERT INTO `world_autolearn` VALUES ('475', '1', '128', '0', '18', '0', '0', '0', 'Снятиепроклятия');
INSERT INTO `world_autolearn` VALUES ('7301', '1', '128', '0', '20', '168', '0', '0', 'МорозныйдоспехУровень3');
INSERT INTO `world_autolearn` VALUES ('5506', '1', '128', '0', '20', '5504', '0', '0', 'СотворениеводыУровень3');
INSERT INTO `world_autolearn` VALUES ('1953', '1', '128', '0', '20', '0', '0', '0', 'Скачок');
INSERT INTO `world_autolearn` VALUES ('1463', '1', '128', '0', '20', '0', '0', '0', 'ЩитманыУровень1');
INSERT INTO `world_autolearn` VALUES ('12824', '1', '128', '0', '20', '118', '0', '0', 'ПревращениеУровень2');
INSERT INTO `world_autolearn` VALUES ('10', '1', '128', '0', '20', '0', '0', '0', 'СнежнаябуряУровень1');
INSERT INTO `world_autolearn` VALUES ('543', '1', '128', '0', '20', '0', '0', '0', 'ЗащитаотогняУровень1');
INSERT INTO `world_autolearn` VALUES ('12051', '1', '128', '0', '20', '0', '0', '0', 'Приливсил');
INSERT INTO `world_autolearn` VALUES ('7322', '1', '128', '0', '20', '116', '0', '0', 'ЛедянаястрелаУровень4');
INSERT INTO `world_autolearn` VALUES ('2948', '1', '128', '0', '22', '0', '0', '0', 'ОжогУровень1');
INSERT INTO `world_autolearn` VALUES ('6143', '1', '128', '0', '22', '0', '0', '0', 'ЗащитаотмагиильдаУровень1');
INSERT INTO `world_autolearn` VALUES ('2138', '1', '128', '0', '22', '2136', '0', '0', 'ОгненныйвзрывУровень3');
INSERT INTO `world_autolearn` VALUES ('8437', '1', '128', '0', '22', '1449', '0', '0', 'ЧародейскийвзрывУровень2');
INSERT INTO `world_autolearn` VALUES ('990', '1', '128', '0', '22', '587', '0', '0', 'СотворениепищиУровень3');
INSERT INTO `world_autolearn` VALUES ('5145', '1', '128', '0', '24', '5143', '0', '0', 'ЧародейскиестрелыУровень3');
INSERT INTO `world_autolearn` VALUES ('2121', '1', '128', '0', '24', '2120', '0', '0', 'ОгненныйстолбУровень2');
INSERT INTO `world_autolearn` VALUES ('8400', '1', '128', '0', '24', '133', '0', '0', 'ОгненныйшарУровень5');
INSERT INTO `world_autolearn` VALUES ('8450', '1', '128', '0', '24', '604', '0', '0', 'ОслаблениемагииУровень2');
INSERT INTO `world_autolearn` VALUES ('2139', '1', '128', '0', '24', '0', '0', '0', 'Антимагия');
INSERT INTO `world_autolearn` VALUES ('12505', '1', '128', '0', '24', '11366', '0', '0', 'ОгненнаяглыбаУровень2');
INSERT INTO `world_autolearn` VALUES ('865', '1', '128', '0', '26', '122', '0', '0', 'КольцольдаУровень2');
INSERT INTO `world_autolearn` VALUES ('120', '1', '128', '0', '26', '0', '0', '0', 'КонусхолодаУровень1');
INSERT INTO `world_autolearn` VALUES ('8406', '1', '128', '0', '26', '116', '0', '0', 'ЛедянаястрелаУровень5');
INSERT INTO `world_autolearn` VALUES ('8494', '1', '128', '0', '28', '1463', '0', '0', 'ЩитманыУровень2');
INSERT INTO `world_autolearn` VALUES ('8444', '1', '128', '0', '28', '2948', '0', '0', 'ОжогУровень2');
INSERT INTO `world_autolearn` VALUES ('6141', '1', '128', '0', '28', '10', '0', '0', 'СнежнаябуряУровень2');
INSERT INTO `world_autolearn` VALUES ('1461', '1', '128', '0', '28', '1459', '0', '0', 'ЧародейскийинтеллектУровень3');
INSERT INTO `world_autolearn` VALUES ('759', '1', '128', '0', '28', '0', '0', '0', 'СотворениесамоцветаманыУровень1');
INSERT INTO `world_autolearn` VALUES ('45438', '1', '128', '0', '30', '0', '0', '0', 'Ледянаяглыба');
INSERT INTO `world_autolearn` VALUES ('12522', '1', '128', '0', '30', '11366', '0', '0', 'ОгненнаяглыбаУровень3');
INSERT INTO `world_autolearn` VALUES ('8457', '1', '128', '0', '30', '543', '0', '0', 'ЗащитаотогняУровень2');
INSERT INTO `world_autolearn` VALUES ('8455', '1', '128', '0', '30', '1008', '0', '0', 'УсилениемагииУровень2');
INSERT INTO `world_autolearn` VALUES ('6127', '1', '128', '0', '30', '5504', '0', '0', 'СотворениеводыУровень4');
INSERT INTO `world_autolearn` VALUES ('8438', '1', '128', '0', '30', '1449', '0', '0', 'ЧародейскийвзрывУровень3');
INSERT INTO `world_autolearn` VALUES ('7302', '1', '128', '0', '30', '0', '0', '0', 'ЛедянойдоспехУровень1');
INSERT INTO `world_autolearn` VALUES ('8412', '1', '128', '0', '30', '2136', '0', '0', 'ОгненныйвзрывУровень4');
INSERT INTO `world_autolearn` VALUES ('8401', '1', '128', '0', '30', '133', '0', '0', 'ОгненныйшарУровень6');
INSERT INTO `world_autolearn` VALUES ('8416', '1', '128', '0', '32', '5143', '0', '0', 'ЧародейскиестрелыУровень4');
INSERT INTO `world_autolearn` VALUES ('8461', '1', '128', '0', '32', '6143', '0', '0', 'ЗащитаотмагиильдаУровень2');
INSERT INTO `world_autolearn` VALUES ('8407', '1', '128', '0', '32', '116', '0', '0', 'ЛедянаястрелаУровень6');
INSERT INTO `world_autolearn` VALUES ('6129', '1', '128', '0', '32', '587', '0', '0', 'СотворениепищиУровень4');
INSERT INTO `world_autolearn` VALUES ('8422', '1', '128', '0', '32', '2120', '0', '0', 'ОгненныйстолбУровень3');
INSERT INTO `world_autolearn` VALUES ('8492', '1', '128', '0', '34', '120', '0', '0', 'КонусхолодаУровень2');
INSERT INTO `world_autolearn` VALUES ('6117', '1', '128', '0', '34', '0', '0', '0', 'МагическийдоспехУровень1');
INSERT INTO `world_autolearn` VALUES ('8445', '1', '128', '0', '34', '2948', '0', '0', 'ОжогУровень3');
INSERT INTO `world_autolearn` VALUES ('13018', '1', '128', '0', '36', '11113', '0', '0', 'ВзрывнаяволнаУровень2');
INSERT INTO `world_autolearn` VALUES ('8427', '1', '128', '0', '36', '10', '0', '0', 'СнежнаябуряУровень3');
INSERT INTO `world_autolearn` VALUES ('8451', '1', '128', '0', '36', '604', '0', '0', 'ОслаблениемагииУровень3');
INSERT INTO `world_autolearn` VALUES ('8402', '1', '128', '0', '36', '133', '0', '0', 'ОгненныйшарУровень7');
INSERT INTO `world_autolearn` VALUES ('8495', '1', '128', '0', '36', '1463', '0', '0', 'ЩитманыУровень3');
INSERT INTO `world_autolearn` VALUES ('12523', '1', '128', '0', '36', '11366', '0', '0', 'ОгненнаяглыбаУровень4');
INSERT INTO `world_autolearn` VALUES ('3552', '1', '128', '0', '38', '759', '0', '0', 'СотворениесамоцветаманыУровень2');
INSERT INTO `world_autolearn` VALUES ('8408', '1', '128', '0', '38', '116', '0', '0', 'ЛедянаястрелаУровень7');
INSERT INTO `world_autolearn` VALUES ('8439', '1', '128', '0', '38', '1449', '0', '0', 'ЧародейскийвзрывУровень4');
INSERT INTO `world_autolearn` VALUES ('8413', '1', '128', '0', '38', '2136', '0', '0', 'ОгненныйвзрывУровень5');
INSERT INTO `world_autolearn` VALUES ('10138', '1', '128', '0', '40', '5504', '0', '0', 'СотворениеводыУровень5');
INSERT INTO `world_autolearn` VALUES ('12825', '1', '128', '0', '40', '118', '0', '0', 'ПревращениеУровень3');
INSERT INTO `world_autolearn` VALUES ('8423', '1', '128', '0', '40', '2120', '0', '0', 'ОгненныйстолбУровень4');
INSERT INTO `world_autolearn` VALUES ('8446', '1', '128', '0', '40', '2948', '0', '0', 'ОжогУровень4');
INSERT INTO `world_autolearn` VALUES ('8458', '1', '128', '0', '40', '543', '0', '0', 'ЗащитаотогняУровень3');
INSERT INTO `world_autolearn` VALUES ('6131', '1', '128', '0', '40', '122', '0', '0', 'КольцольдаУровень3');
INSERT INTO `world_autolearn` VALUES ('8417', '1', '128', '0', '40', '5143', '0', '0', 'ЧародейскиестрелыУровень5');
INSERT INTO `world_autolearn` VALUES ('7320', '1', '128', '0', '40', '7302', '0', '0', 'ЛедянойдоспехУровень2');
INSERT INTO `world_autolearn` VALUES ('10159', '1', '128', '0', '42', '120', '0', '0', 'КонусхолодаУровень3');
INSERT INTO `world_autolearn` VALUES ('12524', '1', '128', '0', '42', '11366', '0', '0', 'ОгненнаяглыбаУровень5');
INSERT INTO `world_autolearn` VALUES ('10169', '1', '128', '0', '42', '1008', '0', '0', 'УсилениемагииУровень3');
INSERT INTO `world_autolearn` VALUES ('10156', '1', '128', '0', '42', '1459', '0', '0', 'ЧародейскийинтеллектУровень4');
INSERT INTO `world_autolearn` VALUES ('8462', '1', '128', '0', '42', '6143', '0', '0', 'ЗащитаотмагиильдаУровень3');
INSERT INTO `world_autolearn` VALUES ('10148', '1', '128', '0', '42', '133', '0', '0', 'ОгненныйшарУровень8');
INSERT INTO `world_autolearn` VALUES ('10144', '1', '128', '0', '42', '587', '0', '0', 'СотворениепищиУровень5');
INSERT INTO `world_autolearn` VALUES ('10179', '1', '128', '0', '44', '116', '0', '0', 'ЛедянаястрелаУровень8');
INSERT INTO `world_autolearn` VALUES ('10185', '1', '128', '0', '44', '10', '0', '0', 'СнежнаябуряУровень4');
INSERT INTO `world_autolearn` VALUES ('10191', '1', '128', '0', '44', '1463', '0', '0', 'ЩитманыУровень4');
INSERT INTO `world_autolearn` VALUES ('13019', '1', '128', '0', '44', '11113', '0', '0', 'ВзрывнаяволнаУровень3');
INSERT INTO `world_autolearn` VALUES ('13031', '1', '128', '0', '46', '11426', '0', '0', 'ЛедянаяпреградаУровень2');
INSERT INTO `world_autolearn` VALUES ('10201', '1', '128', '0', '46', '1449', '0', '0', 'ЧародейскийвзрывУровень5');
INSERT INTO `world_autolearn` VALUES ('10197', '1', '128', '0', '46', '2136', '0', '0', 'ОгненныйвзрывУровень6');
INSERT INTO `world_autolearn` VALUES ('22782', '1', '128', '0', '46', '6117', '0', '0', 'МагическийдоспехУровень2');
INSERT INTO `world_autolearn` VALUES ('10205', '1', '128', '0', '46', '2948', '0', '0', 'ОжогУровень5');
INSERT INTO `world_autolearn` VALUES ('10215', '1', '128', '0', '48', '2120', '0', '0', 'ОгненныйстолбУровень5');
INSERT INTO `world_autolearn` VALUES ('10211', '1', '128', '0', '48', '5143', '0', '0', 'ЧародейскиестрелыУровень6');
INSERT INTO `world_autolearn` VALUES ('10149', '1', '128', '0', '48', '133', '0', '0', 'ОгненныйшарУровень9');
INSERT INTO `world_autolearn` VALUES ('10173', '1', '128', '0', '48', '604', '0', '0', 'ОслаблениемагииУровень4');
INSERT INTO `world_autolearn` VALUES ('12525', '1', '128', '0', '48', '11366', '0', '0', 'ОгненнаяглыбаУровень6');
INSERT INTO `world_autolearn` VALUES ('10053', '1', '128', '0', '48', '759', '0', '0', 'СотворениесамоцветаманыУровень3');
INSERT INTO `world_autolearn` VALUES ('10223', '1', '128', '0', '50', '543', '0', '0', 'ЗащитаотогняУровень4');
INSERT INTO `world_autolearn` VALUES ('10139', '1', '128', '0', '50', '5504', '0', '0', 'СотворениеводыУровень6');
INSERT INTO `world_autolearn` VALUES ('10180', '1', '128', '0', '50', '116', '0', '0', 'ЛедянаястрелаУровень9');
INSERT INTO `world_autolearn` VALUES ('10160', '1', '128', '0', '50', '120', '0', '0', 'КонусхолодаУровень4');
INSERT INTO `world_autolearn` VALUES ('10219', '1', '128', '0', '50', '7302', '0', '0', 'ЛедянойдоспехУровень3');
INSERT INTO `world_autolearn` VALUES ('10177', '1', '128', '0', '52', '6143', '0', '0', 'ЗащитаотмагиильдаУровень4');
INSERT INTO `world_autolearn` VALUES ('13020', '1', '128', '0', '52', '11113', '0', '0', 'ВзрывнаяволнаУровень4');
INSERT INTO `world_autolearn` VALUES ('10145', '1', '128', '0', '52', '587', '0', '0', 'СотворениепищиУровень6');
INSERT INTO `world_autolearn` VALUES ('10206', '1', '128', '0', '52', '2948', '0', '0', 'ОжогУровень6');
INSERT INTO `world_autolearn` VALUES ('10186', '1', '128', '0', '52', '10', '0', '0', 'СнежнаябуряУровень5');
INSERT INTO `world_autolearn` VALUES ('13032', '1', '128', '0', '52', '11426', '0', '0', 'ЛедянаяпреградаУровень3');
INSERT INTO `world_autolearn` VALUES ('10192', '1', '128', '0', '52', '1463', '0', '0', 'ЩитманыУровень5');
INSERT INTO `world_autolearn` VALUES ('10150', '1', '128', '0', '54', '133', '0', '0', 'ОгненныйшарУровень10');
INSERT INTO `world_autolearn` VALUES ('12526', '1', '128', '0', '54', '11366', '0', '0', 'ОгненнаяглыбаУровень7');
INSERT INTO `world_autolearn` VALUES ('10170', '1', '128', '0', '54', '1008', '0', '0', 'УсилениемагииУровень4');
INSERT INTO `world_autolearn` VALUES ('10230', '1', '128', '0', '54', '122', '0', '0', 'КольцольдаУровень4');
INSERT INTO `world_autolearn` VALUES ('10199', '1', '128', '0', '54', '2136', '0', '0', 'ОгненныйвзрывУровень7');
INSERT INTO `world_autolearn` VALUES ('10202', '1', '128', '0', '54', '1449', '0', '0', 'ЧародейскийвзрывУровень6');
INSERT INTO `world_autolearn` VALUES ('10157', '1', '128', '0', '56', '1459', '0', '0', 'ЧародейскийинтеллектУровень5');
INSERT INTO `world_autolearn` VALUES ('10181', '1', '128', '0', '56', '116', '0', '0', 'ЛедянаястрелаУровень10');
INSERT INTO `world_autolearn` VALUES ('33041', '1', '128', '0', '56', '31661', '0', '0', 'ДыханиедраконаУровень2');
INSERT INTO `world_autolearn` VALUES ('10216', '1', '128', '0', '56', '2120', '0', '0', 'ОгненныйстолбУровень6');
INSERT INTO `world_autolearn` VALUES ('23028', '1', '128', '0', '56', '0', '0', '0', 'ЧародейскаягениальностьУровень1');
INSERT INTO `world_autolearn` VALUES ('10212', '1', '128', '0', '56', '5143', '0', '0', 'ЧародейскиестрелыУровень7');
INSERT INTO `world_autolearn` VALUES ('22783', '1', '128', '0', '58', '6117', '0', '0', 'МагическийдоспехУровень3');
INSERT INTO `world_autolearn` VALUES ('13033', '1', '128', '0', '58', '11426', '0', '0', 'ЛедянаяпреградаУровень4');
INSERT INTO `world_autolearn` VALUES ('10207', '1', '128', '0', '58', '2948', '0', '0', 'ОжогУровень7');
INSERT INTO `world_autolearn` VALUES ('10161', '1', '128', '0', '58', '120', '0', '0', 'КонусхолодаУровень5');
INSERT INTO `world_autolearn` VALUES ('10054', '1', '128', '0', '58', '759', '0', '0', 'СотворениесамоцветаманыУровень4');
INSERT INTO `world_autolearn` VALUES ('28609', '1', '128', '0', '60', '6143', '0', '0', 'ЗащитаотмагиильдаУровень5');
INSERT INTO `world_autolearn` VALUES ('28612', '1', '128', '0', '60', '587', '0', '0', 'СотворениепищиУровень7');
INSERT INTO `world_autolearn` VALUES ('25345', '1', '128', '0', '60', '5143', '0', '0', 'ЧародейскиестрелыУровень8');
INSERT INTO `world_autolearn` VALUES ('25304', '1', '128', '0', '60', '116', '0', '0', 'ЛедянаястрелаУровень11');
INSERT INTO `world_autolearn` VALUES ('10140', '1', '128', '0', '60', '5504', '0', '0', 'СотворениеводыУровень7');
INSERT INTO `world_autolearn` VALUES ('10151', '1', '128', '0', '60', '133', '0', '0', 'ОгненныйшарУровень11');
INSERT INTO `world_autolearn` VALUES ('10174', '1', '128', '0', '60', '604', '0', '0', 'ОслаблениемагииУровень5');
INSERT INTO `world_autolearn` VALUES ('18809', '1', '128', '0', '60', '11366', '0', '0', 'ОгненнаяглыбаУровень8');
INSERT INTO `world_autolearn` VALUES ('10220', '1', '128', '0', '60', '7302', '0', '0', 'ЛедянойдоспехУровень4');
INSERT INTO `world_autolearn` VALUES ('10225', '1', '128', '0', '60', '543', '0', '0', 'ЗащитаотогняУровень5');
INSERT INTO `world_autolearn` VALUES ('12826', '1', '128', '0', '60', '118', '0', '0', 'ПревращениеУровень4');
INSERT INTO `world_autolearn` VALUES ('10193', '1', '128', '0', '60', '1463', '0', '0', 'ЩитманыУровень6');
INSERT INTO `world_autolearn` VALUES ('10187', '1', '128', '0', '60', '10', '0', '0', 'СнежнаябуряУровень6');
INSERT INTO `world_autolearn` VALUES ('13021', '1', '128', '0', '60', '11113', '0', '0', 'ВзрывнаяволнаУровень5');
INSERT INTO `world_autolearn` VALUES ('27078', '1', '128', '0', '61', '2136', '0', '0', 'ОгненныйвзрывУровень8');
INSERT INTO `world_autolearn` VALUES ('25306', '1', '128', '0', '62', '133', '0', '0', 'ОгненныйшарУровень12');
INSERT INTO `world_autolearn` VALUES ('30482', '1', '128', '0', '62', '0', '0', '0', 'РаскаленныйдоспехУровень1');
INSERT INTO `world_autolearn` VALUES ('27080', '1', '128', '0', '62', '1449', '0', '0', 'ЧародейскийвзрывУровень7');
INSERT INTO `world_autolearn` VALUES ('27075', '1', '128', '0', '63', '5143', '0', '0', 'ЧародейскиестрелыУровень9');
INSERT INTO `world_autolearn` VALUES ('27130', '1', '128', '0', '63', '1008', '0', '0', 'УсилениемагииУровень5');
INSERT INTO `world_autolearn` VALUES ('27071', '1', '128', '0', '63', '116', '0', '0', 'ЛедянаястрелаУровень12');
INSERT INTO `world_autolearn` VALUES ('30451', '1', '128', '0', '64', '0', '0', '0', 'ЧародейскаявспышкаУровень1');
INSERT INTO `world_autolearn` VALUES ('27134', '1', '128', '0', '64', '11426', '0', '0', 'ЛедянаяпреградаУровень5');
INSERT INTO `world_autolearn` VALUES ('33042', '1', '128', '0', '64', '31661', '0', '0', 'ДыханиедраконаУровень3');
INSERT INTO `world_autolearn` VALUES ('27086', '1', '128', '0', '64', '2120', '0', '0', 'ОгненныйстолбУровень7');
INSERT INTO `world_autolearn` VALUES ('27087', '1', '128', '0', '65', '120', '0', '0', 'КонусхолодаУровень6');
INSERT INTO `world_autolearn` VALUES ('27133', '1', '128', '0', '65', '11113', '0', '0', 'ВзрывнаяволнаУровень6');
INSERT INTO `world_autolearn` VALUES ('27073', '1', '128', '0', '65', '2948', '0', '0', 'ОжогУровень8');
INSERT INTO `world_autolearn` VALUES ('37420', '1', '128', '0', '65', '5504', '0', '0', 'СотворениеводыУровень8');
INSERT INTO `world_autolearn` VALUES ('27070', '1', '128', '0', '66', '133', '0', '0', 'ОгненныйшарУровень13');
INSERT INTO `world_autolearn` VALUES ('30455', '1', '128', '0', '66', '0', '0', '0', 'ЛедяноекопьеУровень1');
INSERT INTO `world_autolearn` VALUES ('27132', '1', '128', '0', '66', '11366', '0', '0', 'ОгненнаяглыбаУровень9');
INSERT INTO `world_autolearn` VALUES ('33944', '1', '128', '0', '67', '604', '0', '0', 'ОслаблениемагииУровень6');
INSERT INTO `world_autolearn` VALUES ('27088', '1', '128', '0', '67', '122', '0', '0', 'КольцольдаУровень5');
INSERT INTO `world_autolearn` VALUES ('66', '1', '128', '0', '68', '0', '0', '0', 'Невидимость');
INSERT INTO `world_autolearn` VALUES ('27085', '1', '128', '0', '68', '10', '0', '0', 'СнежнаябуряУровень7');
INSERT INTO `world_autolearn` VALUES ('27101', '1', '128', '0', '68', '759', '0', '0', 'СотворениесамоцветаманыУровень5');
INSERT INTO `world_autolearn` VALUES ('27131', '1', '128', '0', '68', '1463', '0', '0', 'ЩитманыУровень7');
INSERT INTO `world_autolearn` VALUES ('38699', '1', '128', '0', '69', '5143', '0', '0', 'ЧародейскиестрелыУровень10');
INSERT INTO `world_autolearn` VALUES ('33946', '1', '128', '0', '69', '1008', '0', '0', 'УсилениемагииУровень6');
INSERT INTO `world_autolearn` VALUES ('27124', '1', '128', '0', '69', '7302', '0', '0', 'ЛедянойдоспехУровень5');
INSERT INTO `world_autolearn` VALUES ('27128', '1', '128', '0', '69', '543', '0', '0', 'ЗащитаотогняУровень6');
INSERT INTO `world_autolearn` VALUES ('27072', '1', '128', '0', '69', '116', '0', '0', 'ЛедянаястрелаУровень13');
INSERT INTO `world_autolearn` VALUES ('27125', '1', '128', '0', '69', '6117', '0', '0', 'МагическийдоспехУровень4');
INSERT INTO `world_autolearn` VALUES ('27079', '1', '128', '0', '70', '2136', '0', '0', 'ОгненныйвзрывУровень9');
INSERT INTO `world_autolearn` VALUES ('38692', '1', '128', '0', '70', '133', '0', '0', 'ОгненныйшарУровень14');
INSERT INTO `world_autolearn` VALUES ('38697', '1', '128', '0', '70', '116', '0', '0', 'ЛедянаястрелаУровень14');
INSERT INTO `world_autolearn` VALUES ('27074', '1', '128', '0', '70', '2948', '0', '0', 'ОжогУровень9');
INSERT INTO `world_autolearn` VALUES ('38704', '1', '128', '0', '70', '5143', '0', '0', 'ЧародейскиестрелыУровень11');
INSERT INTO `world_autolearn` VALUES ('30449', '1', '128', '0', '70', '0', '0', '0', 'Чарокрад');
INSERT INTO `world_autolearn` VALUES ('55359', '1', '128', '0', '70', '44457', '0', '0', 'ЖиваябомбаУровень2');
INSERT INTO `world_autolearn` VALUES ('44780', '1', '128', '0', '70', '44425', '0', '0', 'ЧародейскийобстрелУровень2');
INSERT INTO `world_autolearn` VALUES ('27082', '1', '128', '0', '70', '1449', '0', '0', 'ЧародейскийвзрывУровень8');
INSERT INTO `world_autolearn` VALUES ('27090', '1', '128', '0', '70', '5504', '0', '0', 'СотворениеводыУровень9');
INSERT INTO `world_autolearn` VALUES ('27127', '1', '128', '0', '70', '23028', '0', '0', 'ЧародейскаягениальностьУровень2');
INSERT INTO `world_autolearn` VALUES ('27126', '1', '128', '0', '70', '1459', '0', '0', 'ЧародейскийинтеллектУровень6');
INSERT INTO `world_autolearn` VALUES ('32796', '1', '128', '0', '70', '6143', '0', '0', 'ЗащитаотмагиильдаУровень6');
INSERT INTO `world_autolearn` VALUES ('33043', '1', '128', '0', '70', '31661', '0', '0', 'ДыханиедраконаУровень4');
INSERT INTO `world_autolearn` VALUES ('33405', '1', '128', '0', '70', '11426', '0', '0', 'ЛедянаяпреградаУровень6');
INSERT INTO `world_autolearn` VALUES ('43987', '1', '128', '0', '70', '0', '0', '0', 'ОбрядсотворенияяствУровень1');
INSERT INTO `world_autolearn` VALUES ('33938', '1', '128', '0', '70', '11366', '0', '0', 'ОгненнаяглыбаУровень10');
INSERT INTO `world_autolearn` VALUES ('33933', '1', '128', '0', '70', '11113', '0', '0', 'ВзрывнаяволнаУровень7');
INSERT INTO `world_autolearn` VALUES ('33717', '1', '128', '0', '70', '587', '0', '0', 'СотворениепищиУровень8');
INSERT INTO `world_autolearn` VALUES ('43045', '1', '128', '0', '71', '30482', '0', '0', 'РаскаленныйдоспехУровень2');
INSERT INTO `world_autolearn` VALUES ('43023', '1', '128', '0', '71', '6117', '0', '0', 'МагическийдоспехУровень5');
INSERT INTO `world_autolearn` VALUES ('42894', '1', '128', '0', '71', '30451', '0', '0', 'ЧародейскаявспышкаУровень2');
INSERT INTO `world_autolearn` VALUES ('42930', '1', '128', '0', '72', '120', '0', '0', 'КонусхолодаУровень7');
INSERT INTO `world_autolearn` VALUES ('42913', '1', '128', '0', '72', '30455', '0', '0', 'ЛедяноекопьеУровень2');
INSERT INTO `world_autolearn` VALUES ('42925', '1', '128', '0', '72', '2120', '0', '0', 'ОгненныйстолбУровень8');
INSERT INTO `world_autolearn` VALUES ('43019', '1', '128', '0', '73', '1463', '0', '0', 'ЩитманыУровень8');
INSERT INTO `world_autolearn` VALUES ('42858', '1', '128', '0', '73', '2948', '0', '0', 'ОжогУровень10');
INSERT INTO `world_autolearn` VALUES ('42890', '1', '128', '0', '73', '11366', '0', '0', 'ОгненнаяглыбаУровень11');
INSERT INTO `world_autolearn` VALUES ('42872', '1', '128', '0', '74', '2136', '0', '0', 'ОгненныйвзрывУровень10');
INSERT INTO `world_autolearn` VALUES ('42939', '1', '128', '0', '74', '10', '0', '0', 'СнежнаябуряУровень8');
INSERT INTO `world_autolearn` VALUES ('42832', '1', '128', '0', '74', '133', '0', '0', 'ОгненныйшарУровень15');
INSERT INTO `world_autolearn` VALUES ('43038', '1', '128', '0', '75', '11426', '0', '0', 'ЛедянаяпреградаУровень7');
INSERT INTO `world_autolearn` VALUES ('42955', '1', '128', '0', '75', '0', '0', '0', 'СотворениеяствУровень1');
INSERT INTO `world_autolearn` VALUES ('44614', '1', '128', '0', '75', '0', '0', '0', 'СтрелаледяногоогняУровень1');
INSERT INTO `world_autolearn` VALUES ('42944', '1', '128', '0', '75', '11113', '0', '0', 'ВзрывнаяволнаУровень8');
INSERT INTO `world_autolearn` VALUES ('42949', '1', '128', '0', '75', '31661', '0', '0', 'ДыханиедраконаУровень5');
INSERT INTO `world_autolearn` VALUES ('42841', '1', '128', '0', '75', '116', '0', '0', 'ЛедянаястрелаУровень15');
INSERT INTO `world_autolearn` VALUES ('42843', '1', '128', '0', '75', '5143', '0', '0', 'ЧародейскиестрелыУровень12');
INSERT INTO `world_autolearn` VALUES ('42917', '1', '128', '0', '75', '122', '0', '0', 'КольцольдаУровень6');
INSERT INTO `world_autolearn` VALUES ('43015', '1', '128', '0', '76', '604', '0', '0', 'ОслаблениемагииУровень7');
INSERT INTO `world_autolearn` VALUES ('42896', '1', '128', '0', '76', '30451', '0', '0', 'ЧародейскаявспышкаУровень3');
INSERT INTO `world_autolearn` VALUES ('42920', '1', '128', '0', '76', '1449', '0', '0', 'ЧародейскийвзрывУровень9');
INSERT INTO `world_autolearn` VALUES ('42891', '1', '128', '0', '77', '11366', '0', '0', 'ОгненнаяглыбаУровень12');
INSERT INTO `world_autolearn` VALUES ('42985', '1', '128', '0', '77', '759', '0', '0', 'СотворениесамоцветаманыУровень6');
INSERT INTO `world_autolearn` VALUES ('43017', '1', '128', '0', '77', '1008', '0', '0', 'УсилениемагииУровень7');
INSERT INTO `world_autolearn` VALUES ('42859', '1', '128', '0', '78', '2948', '0', '0', 'ОжогУровень11');
INSERT INTO `world_autolearn` VALUES ('42914', '1', '128', '0', '78', '30455', '0', '0', 'ЛедяноекопьеУровень3');
INSERT INTO `world_autolearn` VALUES ('43010', '1', '128', '0', '78', '543', '0', '0', 'ЗащитаотогняУровень7');
INSERT INTO `world_autolearn` VALUES ('42833', '1', '128', '0', '78', '133', '0', '0', 'ОгненныйшарУровень16');
INSERT INTO `world_autolearn` VALUES ('43046', '1', '128', '0', '79', '30482', '0', '0', 'РаскаленныйдоспехУровень3');
INSERT INTO `world_autolearn` VALUES ('42842', '1', '128', '0', '79', '116', '0', '0', 'ЛедянаястрелаУровень16');
INSERT INTO `world_autolearn` VALUES ('43020', '1', '128', '0', '79', '1463', '0', '0', 'ЩитманыУровень9');
INSERT INTO `world_autolearn` VALUES ('42931', '1', '128', '0', '79', '120', '0', '0', 'КонусхолодаУровень8');
INSERT INTO `world_autolearn` VALUES ('42926', '1', '128', '0', '79', '2120', '0', '0', 'ОгненныйстолбУровень9');
INSERT INTO `world_autolearn` VALUES ('43012', '1', '128', '0', '79', '6143', '0', '0', 'ЗащитаотмагиильдаУровень7');
INSERT INTO `world_autolearn` VALUES ('43008', '1', '128', '0', '79', '7302', '0', '0', 'ЛедянойдоспехУровень6');
INSERT INTO `world_autolearn` VALUES ('42846', '1', '128', '0', '79', '5143', '0', '0', 'ЧародейскиестрелыУровень13');
INSERT INTO `world_autolearn` VALUES ('43024', '1', '128', '0', '79', '6117', '0', '0', 'МагическийдоспехУровень6');
INSERT INTO `world_autolearn` VALUES ('42940', '1', '128', '0', '80', '10', '0', '0', 'СнежнаябуряУровень9');
INSERT INTO `world_autolearn` VALUES ('44781', '1', '128', '0', '80', '44425', '0', '0', 'ЧародейскийобстрелУровень3');
INSERT INTO `world_autolearn` VALUES ('55360', '1', '128', '0', '80', '44457', '0', '0', 'ЖиваябомбаУровень3');
INSERT INTO `world_autolearn` VALUES ('47610', '1', '128', '0', '80', '44614', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('55342', '1', '128', '0', '80', '0', '0', '0', 'Зеркальноеизображение');
INSERT INTO `world_autolearn` VALUES ('43039', '1', '128', '0', '80', '11426', '0', '0', 'ЛедянаяпреградаУровень8');
INSERT INTO `world_autolearn` VALUES ('42956', '1', '128', '0', '80', '42955', '0', '0', 'СотворениеяствУровень2');
INSERT INTO `world_autolearn` VALUES ('42921', '1', '128', '0', '80', '1449', '0', '0', 'ЧародейскийвзрывУровень10');
INSERT INTO `world_autolearn` VALUES ('42995', '1', '128', '0', '80', '1459', '0', '0', 'ЧародейскийинтеллектУровень7');
INSERT INTO `world_autolearn` VALUES ('43002', '1', '128', '0', '80', '23028', '0', '0', 'ЧародейскаягениальностьУровень3');
INSERT INTO `world_autolearn` VALUES ('42897', '1', '128', '0', '80', '30451', '0', '0', 'ЧародейскаявспышкаУровень4');
INSERT INTO `world_autolearn` VALUES ('42873', '1', '128', '0', '80', '2136', '0', '0', 'ОгненныйвзрывУровень11');
INSERT INTO `world_autolearn` VALUES ('42945', '1', '128', '0', '80', '11113', '0', '0', 'ВзрывнаяволнаУровень9');
INSERT INTO `world_autolearn` VALUES ('42950', '1', '128', '0', '80', '31661', '0', '0', 'ДыханиедраконаУровень6');
INSERT INTO `world_autolearn` VALUES ('58659', '1', '128', '0', '80', '43987', '0', '0', 'ОбрядсотворенияяствУровень2');
INSERT INTO `world_autolearn` VALUES ('348', '1', '256', '0', '0', '0', '0', '0', 'ЖертвенныйогоньУровень1');
INSERT INTO `world_autolearn` VALUES ('688', '1', '256', '0', '0', '0', '0', '0', 'ПризывбесаПризыв');
INSERT INTO `world_autolearn` VALUES ('172', '1', '256', '0', '4', '0', '0', '0', 'ПорчаУровень1');
INSERT INTO `world_autolearn` VALUES ('702', '1', '256', '0', '4', '0', '0', '0', 'ПроклятиеслабостиУровень1');
INSERT INTO `world_autolearn` VALUES ('695', '1', '256', '0', '6', '686', '0', '0', 'СтрелаТьмыУровень2');
INSERT INTO `world_autolearn` VALUES ('1454', '1', '256', '0', '6', '0', '0', '0', 'ЖизнеотводУровень1');
INSERT INTO `world_autolearn` VALUES ('980', '1', '256', '0', '8', '0', '0', '0', 'ПроклятиеагонииУровень1');
INSERT INTO `world_autolearn` VALUES ('5782', '1', '256', '0', '8', '0', '0', '0', 'СтрахУровень1');
INSERT INTO `world_autolearn` VALUES ('697', '1', '256', '0', '10', '0', '0', '0', 'ПризывдемонаБездны');
INSERT INTO `world_autolearn` VALUES ('6201', '1', '256', '0', '10', '0', '0', '0', 'СозданиекамняздоровьяУровень1');
INSERT INTO `world_autolearn` VALUES ('707', '1', '256', '0', '10', '348', '0', '0', 'ЖертвенныйогоньУровень2');
INSERT INTO `world_autolearn` VALUES ('696', '1', '256', '0', '10', '687', '0', '0', 'ШкурадемонаУровень2');
INSERT INTO `world_autolearn` VALUES ('1120', '1', '256', '0', '10', '0', '0', '0', 'ПохищениедушиУровень1');
INSERT INTO `world_autolearn` VALUES ('1108', '1', '256', '0', '12', '702', '0', '0', 'ПроклятиеслабостиУровень2');
INSERT INTO `world_autolearn` VALUES ('705', '1', '256', '0', '12', '686', '0', '0', 'СтрелаТьмыУровень3');
INSERT INTO `world_autolearn` VALUES ('755', '1', '256', '0', '12', '0', '0', '0', 'КаналздоровьяУровень1');
INSERT INTO `world_autolearn` VALUES ('6222', '1', '256', '0', '14', '172', '0', '0', 'ПорчаУровень2');
INSERT INTO `world_autolearn` VALUES ('689', '1', '256', '0', '14', '0', '0', '0', 'ПохищениежизниУровень1');
INSERT INTO `world_autolearn` VALUES ('1455', '1', '256', '0', '16', '1454', '0', '0', 'ЖизнеотводУровень2');
INSERT INTO `world_autolearn` VALUES ('5697', '1', '256', '0', '16', '0', '0', '0', 'Бесконечноедыхание');
INSERT INTO `world_autolearn` VALUES ('5676', '1', '256', '0', '18', '0', '0', '0', 'ЖгучаябольУровень1');
INSERT INTO `world_autolearn` VALUES ('1014', '1', '256', '0', '18', '980', '0', '0', 'ПроклятиеагонииУровень2');
INSERT INTO `world_autolearn` VALUES ('693', '1', '256', '0', '18', '0', '0', '0', 'СозданиекамнядушиУровень1');
INSERT INTO `world_autolearn` VALUES ('712', '1', '256', '0', '20', '0', '0', '0', 'Призывсуккуба');
INSERT INTO `world_autolearn` VALUES ('706', '1', '256', '0', '20', '0', '0', '0', 'ДемоническийдоспехУровень1');
INSERT INTO `world_autolearn` VALUES ('1710', '1', '256', '0', '20', '0', '0', '0', 'ПризываниеконяСкверныПризыв');
INSERT INTO `world_autolearn` VALUES ('5740', '1', '256', '0', '20', '0', '0', '0', 'ОгненныйливеньУровень1');
INSERT INTO `world_autolearn` VALUES ('1094', '1', '256', '0', '20', '348', '0', '0', 'ЖертвенныйогоньУровень3');
INSERT INTO `world_autolearn` VALUES ('1088', '1', '256', '0', '20', '686', '0', '0', 'СтрелаТьмыУровень4');
INSERT INTO `world_autolearn` VALUES ('3698', '1', '256', '0', '20', '755', '0', '0', 'КаналздоровьяУровень2');
INSERT INTO `world_autolearn` VALUES ('698', '1', '256', '0', '20', '0', '0', '0', 'Ритуалпризыва');
INSERT INTO `world_autolearn` VALUES ('126', '1', '256', '0', '22', '0', '0', '0', 'ОкоКилроггаПризыв');
INSERT INTO `world_autolearn` VALUES ('699', '1', '256', '0', '22', '689', '0', '0', 'ПохищениежизниУровень2');
INSERT INTO `world_autolearn` VALUES ('6202', '1', '256', '0', '22', '6201', '0', '0', 'СозданиекамняздоровьяУровень2');
INSERT INTO `world_autolearn` VALUES ('6205', '1', '256', '0', '22', '702', '0', '0', 'ПроклятиеслабостиУровень3');
INSERT INTO `world_autolearn` VALUES ('5500', '1', '256', '0', '24', '0', '0', '0', 'Чутьенадемонов');
INSERT INTO `world_autolearn` VALUES ('18867', '1', '256', '0', '24', '17877', '0', '0', 'ОжогТьмыУровень2');
INSERT INTO `world_autolearn` VALUES ('5138', '1', '256', '0', '24', '0', '0', '0', 'Похищениеманы');
INSERT INTO `world_autolearn` VALUES ('6223', '1', '256', '0', '24', '172', '0', '0', 'ПорчаУровень3');
INSERT INTO `world_autolearn` VALUES ('8288', '1', '256', '0', '24', '1120', '0', '0', 'ПохищениедушиУровень2');
INSERT INTO `world_autolearn` VALUES ('1714', '1', '256', '0', '26', '0', '0', '0', 'ПроклятиекосноязычияУровень1');
INSERT INTO `world_autolearn` VALUES ('17919', '1', '256', '0', '26', '5676', '0', '0', 'ЖгучаябольУровень2');
INSERT INTO `world_autolearn` VALUES ('132', '1', '256', '0', '26', '0', '0', '0', 'Обнаружениеневидимости');
INSERT INTO `world_autolearn` VALUES ('1456', '1', '256', '0', '26', '1454', '0', '0', 'ЖизнеотводУровень3');
INSERT INTO `world_autolearn` VALUES ('6217', '1', '256', '0', '28', '980', '0', '0', 'ПроклятиеагонииУровень3');
INSERT INTO `world_autolearn` VALUES ('6366', '1', '256', '0', '28', '0', '0', '0', 'СозданиекамняогняУровень1');
INSERT INTO `world_autolearn` VALUES ('3699', '1', '256', '0', '28', '755', '0', '0', 'КаналздоровьяУровень3');
INSERT INTO `world_autolearn` VALUES ('1106', '1', '256', '0', '28', '686', '0', '0', 'СтрелаТьмыУровень5');
INSERT INTO `world_autolearn` VALUES ('710', '1', '256', '0', '28', '0', '0', '0', 'ИзгнаниеУровень1');
INSERT INTO `world_autolearn` VALUES ('691', '1', '256', '0', '30', '0', '0', '0', 'ПризывохотникаСкверны');
INSERT INTO `world_autolearn` VALUES ('1098', '1', '256', '0', '30', '0', '0', '0', 'ПорабощениедемонаУровень1');
INSERT INTO `world_autolearn` VALUES ('709', '1', '256', '0', '30', '689', '0', '0', 'ПохищениежизниУровень3');
INSERT INTO `world_autolearn` VALUES ('1086', '1', '256', '0', '30', '706', '0', '0', 'ДемоническийдоспехУровень2');
INSERT INTO `world_autolearn` VALUES ('1949', '1', '256', '0', '30', '0', '0', '0', 'АдскоеПламяУровень1');
INSERT INTO `world_autolearn` VALUES ('2941', '1', '256', '0', '30', '348', '0', '0', 'ЖертвенныйогоньУровень4');
INSERT INTO `world_autolearn` VALUES ('20752', '1', '256', '0', '30', '693', '0', '0', 'СозданиекамнядушиУровень2');
INSERT INTO `world_autolearn` VALUES ('6229', '1', '256', '0', '32', '0', '0', '0', 'ЗаслоноттемноймагииУровень1');
INSERT INTO `world_autolearn` VALUES ('18868', '1', '256', '0', '32', '17877', '0', '0', 'ОжогТьмыУровень3');
INSERT INTO `world_autolearn` VALUES ('6213', '1', '256', '0', '32', '5782', '0', '0', 'СтрахУровень2');
INSERT INTO `world_autolearn` VALUES ('1490', '1', '256', '0', '32', '0', '0', '0', 'ПроклятиестихийУровень1');
INSERT INTO `world_autolearn` VALUES ('7646', '1', '256', '0', '32', '702', '0', '0', 'ПроклятиеслабостиУровень4');
INSERT INTO `world_autolearn` VALUES ('7648', '1', '256', '0', '34', '172', '0', '0', 'ПорчаУровень4');
INSERT INTO `world_autolearn` VALUES ('17920', '1', '256', '0', '34', '5676', '0', '0', 'ЖгучаябольУровень3');
INSERT INTO `world_autolearn` VALUES ('6219', '1', '256', '0', '34', '5740', '0', '0', 'ОгненныйливеньУровень2');
INSERT INTO `world_autolearn` VALUES ('5699', '1', '256', '0', '34', '6201', '0', '0', 'СозданиекамняздоровьяУровень3');
INSERT INTO `world_autolearn` VALUES ('17951', '1', '256', '0', '36', '6366', '0', '0', 'СозданиекамняогняУровень2');
INSERT INTO `world_autolearn` VALUES ('3700', '1', '256', '0', '36', '755', '0', '0', 'КаналздоровьяУровень4');
INSERT INTO `world_autolearn` VALUES ('11687', '1', '256', '0', '36', '1454', '0', '0', 'ЖизнеотводУровень4');
INSERT INTO `world_autolearn` VALUES ('2362', '1', '256', '0', '36', '0', '0', '0', 'СозданиекамнячарУровень1');
INSERT INTO `world_autolearn` VALUES ('7641', '1', '256', '0', '36', '686', '0', '0', 'СтрелаТьмыУровень6');
INSERT INTO `world_autolearn` VALUES ('8289', '1', '256', '0', '38', '1120', '0', '0', 'ПохищениедушиУровень3');
INSERT INTO `world_autolearn` VALUES ('11711', '1', '256', '0', '38', '980', '0', '0', 'ПроклятиеагонииУровень4');
INSERT INTO `world_autolearn` VALUES ('7651', '1', '256', '0', '38', '689', '0', '0', 'ПохищениежизниУровень4');
INSERT INTO `world_autolearn` VALUES ('11733', '1', '256', '0', '40', '706', '0', '0', 'ДемоническийдоспехУровень3');
INSERT INTO `world_autolearn` VALUES ('5484', '1', '256', '0', '40', '0', '0', '0', 'ВойужасаУровень1');
INSERT INTO `world_autolearn` VALUES ('11665', '1', '256', '0', '40', '348', '0', '0', 'ЖертвенныйогоньУровень5');
INSERT INTO `world_autolearn` VALUES ('20755', '1', '256', '0', '40', '693', '0', '0', 'СозданиекамнядушиУровень3');
INSERT INTO `world_autolearn` VALUES ('18869', '1', '256', '0', '40', '17877', '0', '0', 'ОжогТьмыУровень4');
INSERT INTO `world_autolearn` VALUES ('23161', '1', '256', '0', '40', '0', '0', '0', 'Коньужаса');
INSERT INTO `world_autolearn` VALUES ('11739', '1', '256', '0', '42', '6229', '0', '0', 'ЗаслоноттемноймагииУровень2');
INSERT INTO `world_autolearn` VALUES ('11683', '1', '256', '0', '42', '1949', '0', '0', 'АдскоеПламяУровень2');
INSERT INTO `world_autolearn` VALUES ('17921', '1', '256', '0', '42', '5676', '0', '0', 'ЖгучаябольУровень4');
INSERT INTO `world_autolearn` VALUES ('11707', '1', '256', '0', '42', '702', '0', '0', 'ПроклятиеслабостиУровень5');
INSERT INTO `world_autolearn` VALUES ('6789', '1', '256', '0', '42', '0', '0', '0', 'ЛиксмертиУровень1');
INSERT INTO `world_autolearn` VALUES ('11671', '1', '256', '0', '44', '172', '0', '0', 'ПорчаУровень5');
INSERT INTO `world_autolearn` VALUES ('11725', '1', '256', '0', '44', '1098', '0', '0', 'ПорабощениедемонаУровень2');
INSERT INTO `world_autolearn` VALUES ('11659', '1', '256', '0', '44', '686', '0', '0', 'СтрелаТьмыУровень7');
INSERT INTO `world_autolearn` VALUES ('11693', '1', '256', '0', '44', '755', '0', '0', 'КаналздоровьяУровень5');
INSERT INTO `world_autolearn` VALUES ('17952', '1', '256', '0', '46', '6366', '0', '0', 'СозданиекамняогняУровень3');
INSERT INTO `world_autolearn` VALUES ('11729', '1', '256', '0', '46', '6201', '0', '0', 'СозданиекамняздоровьяУровень4');
INSERT INTO `world_autolearn` VALUES ('11721', '1', '256', '0', '46', '1490', '0', '0', 'ПроклятиестихийУровень2');
INSERT INTO `world_autolearn` VALUES ('11688', '1', '256', '0', '46', '1454', '0', '0', 'ЖизнеотводУровень5');
INSERT INTO `world_autolearn` VALUES ('11677', '1', '256', '0', '46', '5740', '0', '0', 'ОгненныйливеньУровень3');
INSERT INTO `world_autolearn` VALUES ('11699', '1', '256', '0', '46', '689', '0', '0', 'ПохищениежизниУровень5');
INSERT INTO `world_autolearn` VALUES ('17727', '1', '256', '0', '48', '2362', '0', '0', 'СозданиекамнячарУровень2');
INSERT INTO `world_autolearn` VALUES ('18870', '1', '256', '0', '48', '17877', '0', '0', 'ОжогТьмыУровень5');
INSERT INTO `world_autolearn` VALUES ('18647', '1', '256', '0', '48', '710', '0', '0', 'ИзгнаниеУровень2');
INSERT INTO `world_autolearn` VALUES ('6353', '1', '256', '0', '48', '0', '0', '0', 'ОжогдушиУровень1');
INSERT INTO `world_autolearn` VALUES ('11712', '1', '256', '0', '48', '980', '0', '0', 'ПроклятиеагонииУровень5');
INSERT INTO `world_autolearn` VALUES ('1122', '1', '256', '0', '50', '0', '0', '0', 'Призывинфернала');
INSERT INTO `world_autolearn` VALUES ('17925', '1', '256', '0', '50', '6789', '0', '0', 'ЛиксмертиУровень2');
INSERT INTO `world_autolearn` VALUES ('11734', '1', '256', '0', '50', '706', '0', '0', 'ДемоническийдоспехУровень4');
INSERT INTO `world_autolearn` VALUES ('11719', '1', '256', '0', '50', '1714', '0', '0', 'ПроклятиекосноязычияУровень2');
INSERT INTO `world_autolearn` VALUES ('20756', '1', '256', '0', '50', '693', '0', '0', 'СозданиекамнядушиУровень4');
INSERT INTO `world_autolearn` VALUES ('11667', '1', '256', '0', '50', '348', '0', '0', 'ЖертвенныйогоньУровень6');
INSERT INTO `world_autolearn` VALUES ('18937', '1', '256', '0', '50', '18220', '0', '0', 'ТемныйсоюзУровень2');
INSERT INTO `world_autolearn` VALUES ('17922', '1', '256', '0', '50', '5676', '0', '0', 'ЖгучаябольУровень5');
INSERT INTO `world_autolearn` VALUES ('11740', '1', '256', '0', '52', '6229', '0', '0', 'ЗаслоноттемноймагииУровень3');
INSERT INTO `world_autolearn` VALUES ('11660', '1', '256', '0', '52', '686', '0', '0', 'СтрелаТьмыУровень8');
INSERT INTO `world_autolearn` VALUES ('11675', '1', '256', '0', '52', '1120', '0', '0', 'ПохищениедушиУровень4');
INSERT INTO `world_autolearn` VALUES ('11708', '1', '256', '0', '52', '702', '0', '0', 'ПроклятиеслабостиУровень6');
INSERT INTO `world_autolearn` VALUES ('11694', '1', '256', '0', '52', '755', '0', '0', 'КаналздоровьяУровень6');
INSERT INTO `world_autolearn` VALUES ('17928', '1', '256', '0', '54', '5484', '0', '0', 'ВойужасаУровень2');
INSERT INTO `world_autolearn` VALUES ('11672', '1', '256', '0', '54', '172', '0', '0', 'ПорчаУровень6');
INSERT INTO `world_autolearn` VALUES ('11700', '1', '256', '0', '54', '689', '0', '0', 'ПохищениежизниУровень6');
INSERT INTO `world_autolearn` VALUES ('11684', '1', '256', '0', '54', '1949', '0', '0', 'АдскоеПламяУровень3');
INSERT INTO `world_autolearn` VALUES ('6215', '1', '256', '0', '56', '5782', '0', '0', 'СтрахУровень3');
INSERT INTO `world_autolearn` VALUES ('17924', '1', '256', '0', '56', '6353', '0', '0', 'ОжогдушиУровень2');
INSERT INTO `world_autolearn` VALUES ('11689', '1', '256', '0', '56', '1454', '0', '0', 'ЖизнеотводУровень6');
INSERT INTO `world_autolearn` VALUES ('17953', '1', '256', '0', '56', '6366', '0', '0', 'СозданиекамняогняУровень4');
INSERT INTO `world_autolearn` VALUES ('18871', '1', '256', '0', '56', '17877', '0', '0', 'ОжогТьмыУровень6');
INSERT INTO `world_autolearn` VALUES ('11678', '1', '256', '0', '58', '5740', '0', '0', 'ОгненныйливеньУровень4');
INSERT INTO `world_autolearn` VALUES ('17923', '1', '256', '0', '58', '5676', '0', '0', 'ЖгучаябольУровень6');
INSERT INTO `world_autolearn` VALUES ('17926', '1', '256', '0', '58', '6789', '0', '0', 'ЛиксмертиУровень3');
INSERT INTO `world_autolearn` VALUES ('11730', '1', '256', '0', '58', '6201', '0', '0', 'СозданиекамняздоровьяУровень5');
INSERT INTO `world_autolearn` VALUES ('11713', '1', '256', '0', '58', '980', '0', '0', 'ПроклятиеагонииУровень6');
INSERT INTO `world_autolearn` VALUES ('11726', '1', '256', '0', '58', '1098', '0', '0', 'ПорабощениедемонаУровень3');
INSERT INTO `world_autolearn` VALUES ('20757', '1', '256', '0', '60', '693', '0', '0', 'СозданиекамнядушиУровень5');
INSERT INTO `world_autolearn` VALUES ('30404', '1', '256', '0', '60', '30108', '0', '0', 'НестабильноеколдовствоУровень2');
INSERT INTO `world_autolearn` VALUES ('603', '1', '256', '0', '60', '0', '0', '0', 'ПроклятиерокаУровень1');
INSERT INTO `world_autolearn` VALUES ('28610', '1', '256', '0', '60', '6229', '0', '0', 'ЗаслоноттемноймагииУровень4');
INSERT INTO `world_autolearn` VALUES ('25309', '1', '256', '0', '60', '348', '0', '0', 'ЖертвенныйогоньУровень8');
INSERT INTO `world_autolearn` VALUES ('30413', '1', '256', '0', '60', '30283', '0', '0', 'НеистовствоТьмыУровень2');
INSERT INTO `world_autolearn` VALUES ('25311', '1', '256', '0', '60', '172', '0', '0', 'ПорчаУровень7');
INSERT INTO `world_autolearn` VALUES ('18938', '1', '256', '0', '60', '18220', '0', '0', 'ТемныйсоюзУровень3');
INSERT INTO `world_autolearn` VALUES ('11695', '1', '256', '0', '60', '755', '0', '0', 'КаналздоровьяУровень7');
INSERT INTO `world_autolearn` VALUES ('11735', '1', '256', '0', '60', '706', '0', '0', 'ДемоническийдоспехУровень5');
INSERT INTO `world_autolearn` VALUES ('11668', '1', '256', '0', '60', '348', '0', '0', 'ЖертвенныйогоньУровень7');
INSERT INTO `world_autolearn` VALUES ('11722', '1', '256', '0', '60', '1490', '0', '0', 'ПроклятиестихийУровень3');
INSERT INTO `world_autolearn` VALUES ('11661', '1', '256', '0', '60', '686', '0', '0', 'СтрелаТьмыУровень9');
INSERT INTO `world_autolearn` VALUES ('17728', '1', '256', '0', '60', '2362', '0', '0', 'СозданиекамнячарУровень3');
INSERT INTO `world_autolearn` VALUES ('27224', '1', '256', '0', '61', '702', '0', '0', 'ПроклятиеслабостиУровень7');
INSERT INTO `world_autolearn` VALUES ('25307', '1', '256', '0', '62', '686', '0', '0', 'СтрелаТьмыУровень10');
INSERT INTO `world_autolearn` VALUES ('28176', '1', '256', '0', '62', '0', '0', '0', 'ДоспехСкверныУровень1');
INSERT INTO `world_autolearn` VALUES ('27219', '1', '256', '0', '62', '689', '0', '0', 'ПохищениежизниУровень7');
INSERT INTO `world_autolearn` VALUES ('27263', '1', '256', '0', '63', '17877', '0', '0', 'ОжогТьмыУровень7');
INSERT INTO `world_autolearn` VALUES ('29722', '1', '256', '0', '64', '0', '0', '0', 'ИспепелениеУровень1');
INSERT INTO `world_autolearn` VALUES ('27211', '1', '256', '0', '64', '6353', '0', '0', 'ОжогдушиУровень3');
INSERT INTO `world_autolearn` VALUES ('27210', '1', '256', '0', '65', '5676', '0', '0', 'ЖгучаябольУровень7');
INSERT INTO `world_autolearn` VALUES ('27216', '1', '256', '0', '65', '172', '0', '0', 'ПорчаУровень8');
INSERT INTO `world_autolearn` VALUES ('28172', '1', '256', '0', '66', '2362', '0', '0', 'СозданиекамнячарУровень4');
INSERT INTO `world_autolearn` VALUES ('29858', '1', '256', '0', '66', '0', '0', '0', 'Расколдуши');
INSERT INTO `world_autolearn` VALUES ('27250', '1', '256', '0', '66', '6366', '0', '0', 'СозданиекамняогняУровень5');
INSERT INTO `world_autolearn` VALUES ('27218', '1', '256', '0', '67', '980', '0', '0', 'ПроклятиеагонииУровень7');
INSERT INTO `world_autolearn` VALUES ('27259', '1', '256', '0', '67', '755', '0', '0', 'КаналздоровьяУровень8');
INSERT INTO `world_autolearn` VALUES ('27217', '1', '256', '0', '67', '1120', '0', '0', 'ПохищениедушиУровень5');
INSERT INTO `world_autolearn` VALUES ('27213', '1', '256', '0', '68', '1949', '0', '0', 'АдскоеПламяУровень4');
INSERT INTO `world_autolearn` VALUES ('27222', '1', '256', '0', '68', '1454', '0', '0', 'ЖизнеотводУровень7');
INSERT INTO `world_autolearn` VALUES ('29893', '1', '256', '0', '68', '0', '0', '0', 'РитуалдушУровень1');
INSERT INTO `world_autolearn` VALUES ('27223', '1', '256', '0', '68', '6789', '0', '0', 'ЛиксмертиУровень4');
INSERT INTO `world_autolearn` VALUES ('27230', '1', '256', '0', '68', '6201', '0', '0', 'СозданиекамняздоровьяУровень6');
INSERT INTO `world_autolearn` VALUES ('27212', '1', '256', '0', '69', '5740', '0', '0', 'ОгненныйливеньУровень5');
INSERT INTO `world_autolearn` VALUES ('30909', '1', '256', '0', '69', '702', '0', '0', 'ПроклятиеслабостиУровень8');
INSERT INTO `world_autolearn` VALUES ('27209', '1', '256', '0', '69', '686', '0', '0', 'СтрелаТьмыУровень11');
INSERT INTO `world_autolearn` VALUES ('27215', '1', '256', '0', '69', '348', '0', '0', 'ЖертвенныйогоньУровень9');
INSERT INTO `world_autolearn` VALUES ('28189', '1', '256', '0', '69', '28176', '0', '0', 'ДоспехСкверныУровень2');
INSERT INTO `world_autolearn` VALUES ('27220', '1', '256', '0', '69', '689', '0', '0', 'ПохищениежизниУровень8');
INSERT INTO `world_autolearn` VALUES ('27228', '1', '256', '0', '69', '1490', '0', '0', 'ПроклятиестихийУровень4');
INSERT INTO `world_autolearn` VALUES ('30910', '1', '256', '0', '70', '603', '0', '0', 'ПроклятиерокаУровень2');
INSERT INTO `world_autolearn` VALUES ('32231', '1', '256', '0', '70', '29722', '0', '0', 'ИспепелениеУровень2');
INSERT INTO `world_autolearn` VALUES ('59170', '1', '256', '0', '70', '50796', '0', '0', 'СтрелаХаосаУровень2');
INSERT INTO `world_autolearn` VALUES ('59161', '1', '256', '0', '70', '48181', '0', '0', 'БлуждающийдухУровень2');
INSERT INTO `world_autolearn` VALUES ('30546', '1', '256', '0', '70', '17877', '0', '0', 'ОжогТьмыУровень8');
INSERT INTO `world_autolearn` VALUES ('30545', '1', '256', '0', '70', '6353', '0', '0', 'ОжогдушиУровень4');
INSERT INTO `world_autolearn` VALUES ('30459', '1', '256', '0', '70', '5676', '0', '0', 'ЖгучаябольУровень8');
INSERT INTO `world_autolearn` VALUES ('30414', '1', '256', '0', '70', '30283', '0', '0', 'НеистовствоТьмыУровень3');
INSERT INTO `world_autolearn` VALUES ('30405', '1', '256', '0', '70', '30108', '0', '0', 'НестабильноеколдовствоУровень3');
INSERT INTO `world_autolearn` VALUES ('27238', '1', '256', '0', '70', '693', '0', '0', 'СозданиекамнядушиУровень6');
INSERT INTO `world_autolearn` VALUES ('27265', '1', '256', '0', '70', '18220', '0', '0', 'ТемныйсоюзУровень4');
INSERT INTO `world_autolearn` VALUES ('27243', '1', '256', '0', '70', '0', '0', '0', 'СемяпорчиУровень1');
INSERT INTO `world_autolearn` VALUES ('27260', '1', '256', '0', '70', '706', '0', '0', 'ДемоническийдоспехУровень6');
INSERT INTO `world_autolearn` VALUES ('50511', '1', '256', '0', '71', '702', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47812', '1', '256', '0', '71', '172', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47886', '1', '256', '0', '72', '2362', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('61191', '1', '256', '0', '72', '1098', '0', '0', 'ПорабощениедемонаУровень4');
INSERT INTO `world_autolearn` VALUES ('47890', '1', '256', '0', '72', '6229', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47819', '1', '256', '0', '72', '5740', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47863', '1', '256', '0', '73', '980', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47859', '1', '256', '0', '73', '6789', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47871', '1', '256', '0', '73', '6201', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47837', '1', '256', '0', '74', '29722', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47892', '1', '256', '0', '74', '28176', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47814', '1', '256', '0', '74', '5676', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47808', '1', '256', '0', '74', '686', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('60219', '1', '256', '0', '74', '6366', '0', '0', 'СозданиекамняогняУровень6');
INSERT INTO `world_autolearn` VALUES ('47846', '1', '256', '0', '75', '30283', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47841', '1', '256', '0', '75', '30108', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47897', '1', '256', '0', '75', '0', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47835', '1', '256', '0', '75', '27243', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47826', '1', '256', '0', '75', '17877', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('59163', '1', '256', '0', '75', '48181', '0', '0', 'БлуждающийдухУровень3');
INSERT INTO `world_autolearn` VALUES ('47824', '1', '256', '0', '75', '6353', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('59171', '1', '256', '0', '75', '50796', '0', '0', 'СтрелаХаосаУровень3');
INSERT INTO `world_autolearn` VALUES ('47810', '1', '256', '0', '75', '348', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47856', '1', '256', '0', '76', '755', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47884', '1', '256', '0', '76', '693', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47793', '1', '256', '0', '76', '706', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47813', '1', '256', '0', '77', '172', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47855', '1', '256', '0', '77', '1120', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47888', '1', '256', '0', '78', '2362', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47891', '1', '256', '0', '78', '6229', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47865', '1', '256', '0', '78', '1490', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47860', '1', '256', '0', '78', '6789', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47823', '1', '256', '0', '78', '1949', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47857', '1', '256', '0', '78', '689', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47820', '1', '256', '0', '79', '5740', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47893', '1', '256', '0', '79', '28176', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47809', '1', '256', '0', '79', '686', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47815', '1', '256', '0', '79', '5676', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47864', '1', '256', '0', '79', '980', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47878', '1', '256', '0', '79', '6201', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47825', '1', '256', '0', '80', '6353', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('59164', '1', '256', '0', '80', '48181', '0', '0', 'БлуждающийдухУровень4');
INSERT INTO `world_autolearn` VALUES ('47867', '1', '256', '0', '80', '603', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('59172', '1', '256', '0', '80', '50796', '0', '0', 'СтрелаХаосаУровень4');
INSERT INTO `world_autolearn` VALUES ('47811', '1', '256', '0', '80', '348', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('60220', '1', '256', '0', '80', '6366', '0', '0', 'СозданиекамняогняУровень7');
INSERT INTO `world_autolearn` VALUES ('47827', '1', '256', '0', '80', '17877', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('59092', '1', '256', '0', '80', '18220', '0', '0', 'ТемныйсоюзУровень5');
INSERT INTO `world_autolearn` VALUES ('58887', '1', '256', '0', '80', '29893', '0', '0', 'РитуалдушУровень2');
INSERT INTO `world_autolearn` VALUES ('47889', '1', '256', '0', '80', '706', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47843', '1', '256', '0', '80', '30108', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47838', '1', '256', '0', '80', '29722', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47847', '1', '256', '0', '80', '30283', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48018', '1', '256', '0', '80', '0', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48020', '1', '256', '0', '80', '0', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('47836', '1', '256', '0', '80', '27243', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('57946', '1', '256', '0', '80', '1454', '0', '0', 'ЖизнеотводУровень8');
INSERT INTO `world_autolearn` VALUES ('61290', '1', '256', '0', '80', '47897', '0', '0', 'ПламяТьмыУровень2');
INSERT INTO `world_autolearn` VALUES ('1126', '1', '1024', '0', '0', '0', '0', '0', 'ЗнакдикойприродыУровень1');
INSERT INTO `world_autolearn` VALUES ('774', '1', '1024', '0', '4', '0', '0', '0', 'ОмоложениеУровень1');
INSERT INTO `world_autolearn` VALUES ('8921', '1', '1024', '0', '4', '0', '0', '0', 'ЛунныйогоньУровень1');
INSERT INTO `world_autolearn` VALUES ('467', '1', '1024', '0', '6', '0', '0', '0', 'ШипыУровень1');
INSERT INTO `world_autolearn` VALUES ('5177', '1', '1024', '0', '6', '5176', '0', '0', 'ГневУровень2');
INSERT INTO `world_autolearn` VALUES ('339', '1', '1024', '0', '8', '0', '0', '0', 'ГневдеревьевУровень1');
INSERT INTO `world_autolearn` VALUES ('5186', '1', '1024', '0', '8', '5185', '0', '0', 'ЦелительноеприкосновениеУровень2');
INSERT INTO `world_autolearn` VALUES ('5487', '1', '1024', '0', '10', '0', '0', '0', 'Обликмедведя');
INSERT INTO `world_autolearn` VALUES ('6807', '1', '1024', '0', '10', '0', '0', '0', 'Трепка');
INSERT INTO `world_autolearn` VALUES ('6795', '1', '1024', '0', '10', '0', '0', '0', 'Рык');
INSERT INTO `world_autolearn` VALUES ('8924', '1', '1024', '0', '10', '8921', '0', '0', 'ЛунныйогоньУровень2');
INSERT INTO `world_autolearn` VALUES ('16689', '1', '1024', '0', '10', '0', '0', '0', 'ХваткаприродыУровень1');
INSERT INTO `world_autolearn` VALUES ('5232', '1', '1024', '0', '10', '1126', '0', '0', 'ЗнакдикойприродыУровень2');
INSERT INTO `world_autolearn` VALUES ('1058', '1', '1024', '0', '10', '774', '0', '0', 'ОмоложениеУровень2');
INSERT INTO `world_autolearn` VALUES ('99', '1', '1024', '0', '10', '0', '0', '0', 'УстрашающийревУровень1');
INSERT INTO `world_autolearn` VALUES ('8936', '1', '1024', '0', '12', '0', '0', '0', 'ВосстановлениеУровень1');
INSERT INTO `world_autolearn` VALUES ('50769', '1', '1024', '0', '12', '0', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('5229', '1', '1024', '0', '12', '0', '0', '0', 'Исступление');
INSERT INTO `world_autolearn` VALUES ('782', '1', '1024', '0', '14', '467', '0', '0', 'ШипыУровень2');
INSERT INTO `world_autolearn` VALUES ('5187', '1', '1024', '0', '14', '5185', '0', '0', 'ЦелительноеприкосновениеУровень3');
INSERT INTO `world_autolearn` VALUES ('5178', '1', '1024', '0', '14', '5176', '0', '0', 'ГневУровень3');
INSERT INTO `world_autolearn` VALUES ('5211', '1', '1024', '0', '14', '0', '0', '0', 'ОглушитьУровень1');
INSERT INTO `world_autolearn` VALUES ('8925', '1', '1024', '0', '16', '8921', '0', '0', 'ЛунныйогоньУровень3');
INSERT INTO `world_autolearn` VALUES ('779', '1', '1024', '0', '16', '0', '0', '0', 'Размах(медведь)Уровень1');
INSERT INTO `world_autolearn` VALUES ('783', '1', '1024', '0', '16', '0', '0', '0', 'ПоходныйобликСменаоблика');
INSERT INTO `world_autolearn` VALUES ('1066', '1', '1024', '0', '16', '0', '0', '0', 'ВодныйобликСменаоблика');
INSERT INTO `world_autolearn` VALUES ('1430', '1', '1024', '0', '16', '774', '0', '0', 'ОмоложениеУровень3');
INSERT INTO `world_autolearn` VALUES ('1062', '1', '1024', '0', '18', '339', '0', '0', 'ГневдеревьевУровень2');
INSERT INTO `world_autolearn` VALUES ('2637', '1', '1024', '0', '18', '0', '0', '0', 'СпячкаУровень1');
INSERT INTO `world_autolearn` VALUES ('770', '1', '1024', '0', '18', '0', '0', '0', 'Волшебныйогонь');
INSERT INTO `world_autolearn` VALUES ('8938', '1', '1024', '0', '18', '8936', '0', '0', 'ВосстановлениеУровень2');
INSERT INTO `world_autolearn` VALUES ('16810', '1', '1024', '0', '18', '16689', '0', '0', 'ХваткаприродыУровень2');
INSERT INTO `world_autolearn` VALUES ('16857', '1', '1024', '0', '18', '0', '0', '0', 'Волшебныйогонь(зверь)');
INSERT INTO `world_autolearn` VALUES ('6808', '1', '1024', '0', '18', '6807', '0', '0', 'ТрепкаУровень2');
INSERT INTO `world_autolearn` VALUES ('5215', '1', '1024', '0', '20', '0', '0', '0', 'Крадущийсязверь');
INSERT INTO `world_autolearn` VALUES ('5188', '1', '1024', '0', '20', '5185', '0', '0', 'ЦелительноеприкосновениеУровень4');
INSERT INTO `world_autolearn` VALUES ('2912', '1', '1024', '0', '20', '0', '0', '0', 'ЗвездныйогоньУровень1');
INSERT INTO `world_autolearn` VALUES ('1735', '1', '1024', '0', '20', '99', '0', '0', 'УстрашающийревУровень2');
INSERT INTO `world_autolearn` VALUES ('1079', '1', '1024', '0', '20', '0', '0', '0', 'РазорватьУровень1');
INSERT INTO `world_autolearn` VALUES ('1082', '1', '1024', '0', '20', '0', '0', '0', 'ЦапнутьУровень1');
INSERT INTO `world_autolearn` VALUES ('6756', '1', '1024', '0', '20', '1126', '0', '0', 'ЗнакдикойприродыУровень3');
INSERT INTO `world_autolearn` VALUES ('768', '1', '1024', '0', '20', '0', '0', '0', 'ОбликкошкиСменаоблика');
INSERT INTO `world_autolearn` VALUES ('20484', '1', '1024', '0', '20', '0', '0', '0', 'ВозрождениеУровень1');
INSERT INTO `world_autolearn` VALUES ('8926', '1', '1024', '0', '22', '8921', '0', '0', 'ЛунныйогоньУровень4');
INSERT INTO `world_autolearn` VALUES ('2908', '1', '1024', '0', '22', '0', '0', '0', 'УмиротворениеживотногоУровень1');
INSERT INTO `world_autolearn` VALUES ('5179', '1', '1024', '0', '22', '5176', '0', '0', 'ГневУровень4');
INSERT INTO `world_autolearn` VALUES ('2090', '1', '1024', '0', '22', '774', '0', '0', 'ОмоложениеУровень4');
INSERT INTO `world_autolearn` VALUES ('5221', '1', '1024', '0', '22', '0', '0', '0', 'ПолоснутьУровень1');
INSERT INTO `world_autolearn` VALUES ('5217', '1', '1024', '0', '24', '0', '0', '0', 'ТигриноенеистовствоУровень1');
INSERT INTO `world_autolearn` VALUES ('8939', '1', '1024', '0', '24', '8936', '0', '0', 'ВосстановлениеУровень3');
INSERT INTO `world_autolearn` VALUES ('1075', '1', '1024', '0', '24', '467', '0', '0', 'ШипыУровень3');
INSERT INTO `world_autolearn` VALUES ('2782', '1', '1024', '0', '24', '0', '0', '0', 'Снятиепроклятия');
INSERT INTO `world_autolearn` VALUES ('780', '1', '1024', '0', '24', '779', '0', '0', 'Размах(медведь)Уровень2');
INSERT INTO `world_autolearn` VALUES ('50768', '1', '1024', '0', '24', '50769', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('1822', '1', '1024', '0', '24', '0', '0', '0', 'ГлубокаяранаУровень1');
INSERT INTO `world_autolearn` VALUES ('6809', '1', '1024', '0', '26', '6807', '0', '0', 'ТрепкаУровень3');
INSERT INTO `world_autolearn` VALUES ('8949', '1', '1024', '0', '26', '2912', '0', '0', 'ЗвездныйогоньУровень2');
INSERT INTO `world_autolearn` VALUES ('1850', '1', '1024', '0', '26', '0', '0', '0', 'ПорывУровень1');
INSERT INTO `world_autolearn` VALUES ('5189', '1', '1024', '0', '26', '5185', '0', '0', 'ЦелительноеприкосновениеУровень5');
INSERT INTO `world_autolearn` VALUES ('2893', '1', '1024', '0', '26', '0', '0', '0', 'Устранениеяда');
INSERT INTO `world_autolearn` VALUES ('16811', '1', '1024', '0', '28', '16689', '0', '0', 'ХваткаприродыУровень3');
INSERT INTO `world_autolearn` VALUES ('8927', '1', '1024', '0', '28', '8921', '0', '0', 'ЛунныйогоньУровень5');
INSERT INTO `world_autolearn` VALUES ('8998', '1', '1024', '0', '28', '0', '0', '0', 'ПопятитьсяУровень1');
INSERT INTO `world_autolearn` VALUES ('9492', '1', '1024', '0', '28', '1079', '0', '0', 'РазорватьУровень2');
INSERT INTO `world_autolearn` VALUES ('2091', '1', '1024', '0', '28', '774', '0', '0', 'ОмоложениеУровень5');
INSERT INTO `world_autolearn` VALUES ('5195', '1', '1024', '0', '28', '339', '0', '0', 'ГневдеревьевУровень3');
INSERT INTO `world_autolearn` VALUES ('5209', '1', '1024', '0', '28', '0', '0', '0', 'Вызывающийрев');
INSERT INTO `world_autolearn` VALUES ('3029', '1', '1024', '0', '28', '1082', '0', '0', 'ЦапнутьУровень2');
INSERT INTO `world_autolearn` VALUES ('5180', '1', '1024', '0', '30', '5176', '0', '0', 'ГневУровень5');
INSERT INTO `world_autolearn` VALUES ('8940', '1', '1024', '0', '30', '8936', '0', '0', 'ВосстановлениеУровень4');
INSERT INTO `world_autolearn` VALUES ('5234', '1', '1024', '0', '30', '1126', '0', '0', 'ЗнакдикойприродыУровень4');
INSERT INTO `world_autolearn` VALUES ('20739', '1', '1024', '0', '30', '20484', '0', '0', 'ВозрождениеУровень2');
INSERT INTO `world_autolearn` VALUES ('740', '1', '1024', '0', '30', '0', '0', '0', 'СпокойствиеУровень1');
INSERT INTO `world_autolearn` VALUES ('24974', '1', '1024', '0', '30', '5570', '0', '0', 'РойнасекомыхУровень2');
INSERT INTO `world_autolearn` VALUES ('6800', '1', '1024', '0', '30', '5221', '0', '0', 'ПолоснутьУровень2');
INSERT INTO `world_autolearn` VALUES ('6798', '1', '1024', '0', '30', '5211', '0', '0', 'ОглушитьУровень2');
INSERT INTO `world_autolearn` VALUES ('6785', '1', '1024', '0', '32', '0', '0', '0', 'НакинутьсяУровень1');
INSERT INTO `world_autolearn` VALUES ('5225', '1', '1024', '0', '32', '0', '0', '0', 'Выслеживаниегуманоидов');
INSERT INTO `world_autolearn` VALUES ('6778', '1', '1024', '0', '32', '5185', '0', '0', 'ЦелительноеприкосновениеУровень6');
INSERT INTO `world_autolearn` VALUES ('22568', '1', '1024', '0', '32', '0', '0', '0', 'СвирепыйукусУровень1');
INSERT INTO `world_autolearn` VALUES ('9490', '1', '1024', '0', '32', '99', '0', '0', 'УстрашающийревУровень3');
INSERT INTO `world_autolearn` VALUES ('8950', '1', '1024', '0', '34', '2912', '0', '0', 'ЗвездныйогоньУровень3');
INSERT INTO `world_autolearn` VALUES ('8928', '1', '1024', '0', '34', '8921', '0', '0', 'ЛунныйогоньУровень6');
INSERT INTO `world_autolearn` VALUES ('1823', '1', '1024', '0', '34', '1822', '0', '0', 'ГлубокаяранаУровень2');
INSERT INTO `world_autolearn` VALUES ('8914', '1', '1024', '0', '34', '467', '0', '0', 'ШипыУровень4');
INSERT INTO `world_autolearn` VALUES ('769', '1', '1024', '0', '34', '779', '0', '0', 'Размах(медведь)Уровень3');
INSERT INTO `world_autolearn` VALUES ('3627', '1', '1024', '0', '34', '774', '0', '0', 'ОмоложениеУровень6');
INSERT INTO `world_autolearn` VALUES ('8972', '1', '1024', '0', '34', '6807', '0', '0', 'ТрепкаУровень4');
INSERT INTO `world_autolearn` VALUES ('9493', '1', '1024', '0', '36', '1079', '0', '0', 'РазорватьУровень3');
INSERT INTO `world_autolearn` VALUES ('9005', '1', '1024', '0', '36', '0', '0', '0', 'НаскокУровень1');
INSERT INTO `world_autolearn` VALUES ('50767', '1', '1024', '0', '36', '50769', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('22842', '1', '1024', '0', '36', '0', '0', '0', 'Неистовоевосстановление');
INSERT INTO `world_autolearn` VALUES ('6793', '1', '1024', '0', '36', '5217', '0', '0', 'ТигриноенеистовствоУровень2');
INSERT INTO `world_autolearn` VALUES ('8941', '1', '1024', '0', '36', '8936', '0', '0', 'ВосстановлениеУровень5');
INSERT INTO `world_autolearn` VALUES ('5201', '1', '1024', '0', '38', '1082', '0', '0', 'ЦапнутьУровень3');
INSERT INTO `world_autolearn` VALUES ('16812', '1', '1024', '0', '38', '16689', '0', '0', 'ХваткаприродыУровень4');
INSERT INTO `world_autolearn` VALUES ('8903', '1', '1024', '0', '38', '5185', '0', '0', 'ЦелительноеприкосновениеУровень7');
INSERT INTO `world_autolearn` VALUES ('5196', '1', '1024', '0', '38', '339', '0', '0', 'ГневдеревьевУровень4');
INSERT INTO `world_autolearn` VALUES ('18657', '1', '1024', '0', '38', '2637', '0', '0', 'СпячкаУровень2');
INSERT INTO `world_autolearn` VALUES ('8955', '1', '1024', '0', '38', '2908', '0', '0', 'УмиротворениеживотногоУровень2');
INSERT INTO `world_autolearn` VALUES ('8992', '1', '1024', '0', '38', '5221', '0', '0', 'ПолоснутьУровень3');
INSERT INTO `world_autolearn` VALUES ('6780', '1', '1024', '0', '38', '5176', '0', '0', 'ГневУровень6');
INSERT INTO `world_autolearn` VALUES ('29166', '1', '1024', '0', '40', '0', '0', '0', 'Озарение');
INSERT INTO `world_autolearn` VALUES ('24975', '1', '1024', '0', '40', '5570', '0', '0', 'РойнасекомыхУровень3');
INSERT INTO `world_autolearn` VALUES ('20719', '1', '1024', '0', '40', '0', '0', '0', 'КошачьяграцияПассивная');
INSERT INTO `world_autolearn` VALUES ('20742', '1', '1024', '0', '40', '20484', '0', '0', 'ВозрождениеУровень3');
INSERT INTO `world_autolearn` VALUES ('16914', '1', '1024', '0', '40', '0', '0', '0', 'ГрозаУровень1');
INSERT INTO `world_autolearn` VALUES ('22827', '1', '1024', '0', '40', '22568', '0', '0', 'СвирепыйукусУровень2');
INSERT INTO `world_autolearn` VALUES ('62600', '1', '1024', '0', '40', '0', '0', '0', 'ДикаязащитаПассивная');
INSERT INTO `world_autolearn` VALUES ('8910', '1', '1024', '0', '40', '774', '0', '0', 'ОмоложениеУровень7');
INSERT INTO `world_autolearn` VALUES ('8907', '1', '1024', '0', '40', '1126', '0', '0', 'ЗнакдикойприродыУровень5');
INSERT INTO `world_autolearn` VALUES ('8918', '1', '1024', '0', '40', '740', '0', '0', 'СпокойствиеУровень2');
INSERT INTO `world_autolearn` VALUES ('8929', '1', '1024', '0', '40', '8921', '0', '0', 'ЛунныйогоньУровень7');
INSERT INTO `world_autolearn` VALUES ('9000', '1', '1024', '0', '40', '8998', '0', '0', 'ПопятитьсяУровень2');
INSERT INTO `world_autolearn` VALUES ('9634', '1', '1024', '0', '40', '5487', '0', '0', 'ОбликлютогомедведяСменаоблика');
INSERT INTO `world_autolearn` VALUES ('8951', '1', '1024', '0', '42', '2912', '0', '0', 'ЗвездныйогоньУровень4');
INSERT INTO `world_autolearn` VALUES ('6787', '1', '1024', '0', '42', '6785', '0', '0', 'НакинутьсяУровень2');
INSERT INTO `world_autolearn` VALUES ('9745', '1', '1024', '0', '42', '6807', '0', '0', 'ТрепкаУровень5');
INSERT INTO `world_autolearn` VALUES ('9747', '1', '1024', '0', '42', '99', '0', '0', 'УстрашающийревУровень4');
INSERT INTO `world_autolearn` VALUES ('9750', '1', '1024', '0', '42', '8936', '0', '0', 'ВосстановлениеУровень6');
INSERT INTO `world_autolearn` VALUES ('9756', '1', '1024', '0', '44', '467', '0', '0', 'ШипыУровень5');
INSERT INTO `world_autolearn` VALUES ('9754', '1', '1024', '0', '44', '779', '0', '0', 'Размах(медведь)Уровень4');
INSERT INTO `world_autolearn` VALUES ('9752', '1', '1024', '0', '44', '1079', '0', '0', 'РазорватьУровень4');
INSERT INTO `world_autolearn` VALUES ('22812', '1', '1024', '0', '44', '0', '0', '0', 'Дубоваякожа');
INSERT INTO `world_autolearn` VALUES ('1824', '1', '1024', '0', '44', '1822', '0', '0', 'ГлубокаяранаУровень3');
INSERT INTO `world_autolearn` VALUES ('9758', '1', '1024', '0', '44', '5185', '0', '0', 'ЦелительноеприкосновениеУровень8');
INSERT INTO `world_autolearn` VALUES ('9839', '1', '1024', '0', '46', '774', '0', '0', 'ОмоложениеУровень8');
INSERT INTO `world_autolearn` VALUES ('9833', '1', '1024', '0', '46', '8921', '0', '0', 'ЛунныйогоньУровень8');
INSERT INTO `world_autolearn` VALUES ('9823', '1', '1024', '0', '46', '9005', '0', '0', 'НаскокУровень2');
INSERT INTO `world_autolearn` VALUES ('8905', '1', '1024', '0', '46', '5176', '0', '0', 'ГневУровень7');
INSERT INTO `world_autolearn` VALUES ('9829', '1', '1024', '0', '46', '5221', '0', '0', 'ПолоснутьУровень4');
INSERT INTO `world_autolearn` VALUES ('9821', '1', '1024', '0', '46', '1850', '0', '0', 'ПорывУровень2');
INSERT INTO `world_autolearn` VALUES ('8983', '1', '1024', '0', '46', '5211', '0', '0', 'ОглушитьУровень3');
INSERT INTO `world_autolearn` VALUES ('9845', '1', '1024', '0', '48', '5217', '0', '0', 'ТигриноенеистовствоУровень3');
INSERT INTO `world_autolearn` VALUES ('50766', '1', '1024', '0', '48', '50769', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('22828', '1', '1024', '0', '48', '22568', '0', '0', 'СвирепыйукусУровень3');
INSERT INTO `world_autolearn` VALUES ('9852', '1', '1024', '0', '48', '339', '0', '0', 'ГневдеревьевУровень5');
INSERT INTO `world_autolearn` VALUES ('16813', '1', '1024', '0', '48', '16689', '0', '0', 'ХваткаприродыУровень5');
INSERT INTO `world_autolearn` VALUES ('9849', '1', '1024', '0', '48', '1082', '0', '0', 'ЦапнутьУровень4');
INSERT INTO `world_autolearn` VALUES ('9856', '1', '1024', '0', '48', '8936', '0', '0', 'ВосстановлениеУровень7');
INSERT INTO `world_autolearn` VALUES ('9875', '1', '1024', '0', '50', '2912', '0', '0', 'ЗвездныйогоньУровень5');
INSERT INTO `world_autolearn` VALUES ('9888', '1', '1024', '0', '50', '5185', '0', '0', 'ЦелительноеприкосновениеУровень9');
INSERT INTO `world_autolearn` VALUES ('17401', '1', '1024', '0', '50', '16914', '0', '0', 'ГрозаУровень2');
INSERT INTO `world_autolearn` VALUES ('9866', '1', '1024', '0', '50', '6785', '0', '0', 'НакинутьсяУровень3');
INSERT INTO `world_autolearn` VALUES ('9884', '1', '1024', '0', '50', '1126', '0', '0', 'ЗнакдикойприродыУровень6');
INSERT INTO `world_autolearn` VALUES ('9880', '1', '1024', '0', '50', '6807', '0', '0', 'ТрепкаУровень6');
INSERT INTO `world_autolearn` VALUES ('20747', '1', '1024', '0', '50', '20484', '0', '0', 'ВозрождениеУровень4');
INSERT INTO `world_autolearn` VALUES ('21849', '1', '1024', '0', '50', '0', '0', '0', 'ДардикойприродыУровень1');
INSERT INTO `world_autolearn` VALUES ('9862', '1', '1024', '0', '50', '740', '0', '0', 'СпокойствиеУровень3');
INSERT INTO `world_autolearn` VALUES ('24976', '1', '1024', '0', '50', '5570', '0', '0', 'РойнасекомыхУровень4');
INSERT INTO `world_autolearn` VALUES ('9840', '1', '1024', '0', '52', '774', '0', '0', 'ОмоложениеУровень9');
INSERT INTO `world_autolearn` VALUES ('9894', '1', '1024', '0', '52', '1079', '0', '0', 'РазорватьУровень5');
INSERT INTO `world_autolearn` VALUES ('9898', '1', '1024', '0', '52', '99', '0', '0', 'УстрашающийревУровень5');
INSERT INTO `world_autolearn` VALUES ('9892', '1', '1024', '0', '52', '8998', '0', '0', 'ПопятитьсяУровень3');
INSERT INTO `world_autolearn` VALUES ('9834', '1', '1024', '0', '52', '8921', '0', '0', 'ЛунныйогоньУровень9');
INSERT INTO `world_autolearn` VALUES ('9908', '1', '1024', '0', '54', '779', '0', '0', 'Размах(медведь)Уровень5');
INSERT INTO `world_autolearn` VALUES ('9901', '1', '1024', '0', '54', '2908', '0', '0', 'УмиротворениеживотногоУровень3');
INSERT INTO `world_autolearn` VALUES ('9904', '1', '1024', '0', '54', '1822', '0', '0', 'ГлубокаяранаУровень4');
INSERT INTO `world_autolearn` VALUES ('9830', '1', '1024', '0', '54', '5221', '0', '0', 'ПолоснутьУровень5');
INSERT INTO `world_autolearn` VALUES ('9910', '1', '1024', '0', '54', '467', '0', '0', 'ШипыУровень6');
INSERT INTO `world_autolearn` VALUES ('9912', '1', '1024', '0', '54', '5176', '0', '0', 'ГневУровень8');
INSERT INTO `world_autolearn` VALUES ('9857', '1', '1024', '0', '54', '8936', '0', '0', 'ВосстановлениеУровень8');
INSERT INTO `world_autolearn` VALUES ('22829', '1', '1024', '0', '56', '22568', '0', '0', 'СвирепыйукусУровень4');
INSERT INTO `world_autolearn` VALUES ('9889', '1', '1024', '0', '56', '5185', '0', '0', 'ЦелительноеприкосновениеУровень10');
INSERT INTO `world_autolearn` VALUES ('9827', '1', '1024', '0', '56', '9005', '0', '0', 'НаскокУровень3');
INSERT INTO `world_autolearn` VALUES ('9835', '1', '1024', '0', '58', '8921', '0', '0', 'ЛунныйогоньУровень10');
INSERT INTO `world_autolearn` VALUES ('9867', '1', '1024', '0', '58', '6785', '0', '0', 'НакинутьсяУровень4');
INSERT INTO `world_autolearn` VALUES ('9881', '1', '1024', '0', '58', '6807', '0', '0', 'ТрепкаУровень7');
INSERT INTO `world_autolearn` VALUES ('9853', '1', '1024', '0', '58', '339', '0', '0', 'ГневдеревьевУровень6');
INSERT INTO `world_autolearn` VALUES ('9841', '1', '1024', '0', '58', '774', '0', '0', 'ОмоложениеУровень10');
INSERT INTO `world_autolearn` VALUES ('9876', '1', '1024', '0', '58', '2912', '0', '0', 'ЗвездныйогоньУровень6');
INSERT INTO `world_autolearn` VALUES ('18658', '1', '1024', '0', '58', '2637', '0', '0', 'СпячкаУровень3');
INSERT INTO `world_autolearn` VALUES ('9850', '1', '1024', '0', '58', '1082', '0', '0', 'ЦапнутьУровень5');
INSERT INTO `world_autolearn` VALUES ('33986', '1', '1024', '0', '58', '33878', '0', '0', 'Увечье(медведь)Уровень2');
INSERT INTO `world_autolearn` VALUES ('17329', '1', '1024', '0', '58', '16689', '0', '0', 'ХваткаприродыУровень6');
INSERT INTO `world_autolearn` VALUES ('33982', '1', '1024', '0', '58', '33876', '0', '0', 'Увечье(кошка)Уровень2');
INSERT INTO `world_autolearn` VALUES ('53223', '1', '1024', '0', '60', '50516', '0', '0', 'ТайфунУровень2');
INSERT INTO `world_autolearn` VALUES ('31018', '1', '1024', '0', '60', '22568', '0', '0', 'СвирепыйукусУровень5');
INSERT INTO `world_autolearn` VALUES ('50765', '1', '1024', '0', '60', '50769', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('33943', '1', '1024', '0', '60', '0', '0', '0', 'ВоздушныйобликСменаоблика');
INSERT INTO `world_autolearn` VALUES ('31709', '1', '1024', '0', '60', '8998', '0', '0', 'ПопятитьсяУровень4');
INSERT INTO `world_autolearn` VALUES ('25299', '1', '1024', '0', '60', '774', '0', '0', 'ОмоложениеУровень11');
INSERT INTO `world_autolearn` VALUES ('25298', '1', '1024', '0', '60', '2912', '0', '0', 'ЗвездныйогоньУровень7');
INSERT INTO `world_autolearn` VALUES ('20748', '1', '1024', '0', '60', '20484', '0', '0', 'ВозрождениеУровень5');
INSERT INTO `world_autolearn` VALUES ('21850', '1', '1024', '0', '60', '21849', '0', '0', 'ДардикойприродыУровень2');
INSERT INTO `world_autolearn` VALUES ('24977', '1', '1024', '0', '60', '5570', '0', '0', 'РойнасекомыхУровень5');
INSERT INTO `world_autolearn` VALUES ('9846', '1', '1024', '0', '60', '5217', '0', '0', 'ТигриноенеистовствоУровень4');
INSERT INTO `world_autolearn` VALUES ('17402', '1', '1024', '0', '60', '16914', '0', '0', 'ГрозаУровень3');
INSERT INTO `world_autolearn` VALUES ('25297', '1', '1024', '0', '60', '5185', '0', '0', 'ЦелительноеприкосновениеУровень11');
INSERT INTO `world_autolearn` VALUES ('9858', '1', '1024', '0', '60', '8936', '0', '0', 'ВосстановлениеУровень9');
INSERT INTO `world_autolearn` VALUES ('9885', '1', '1024', '0', '60', '1126', '0', '0', 'ЗнакдикойприродыУровень7');
INSERT INTO `world_autolearn` VALUES ('9896', '1', '1024', '0', '60', '1079', '0', '0', 'РазорватьУровень6');
INSERT INTO `world_autolearn` VALUES ('9863', '1', '1024', '0', '60', '740', '0', '0', 'СпокойствиеУровень4');
INSERT INTO `world_autolearn` VALUES ('26984', '1', '1024', '0', '61', '5176', '0', '0', 'ГневУровень9');
INSERT INTO `world_autolearn` VALUES ('27001', '1', '1024', '0', '61', '5221', '0', '0', 'ПолоснутьУровень6');
INSERT INTO `world_autolearn` VALUES ('26978', '1', '1024', '0', '62', '5185', '0', '0', 'ЦелительноеприкосновениеУровень12');
INSERT INTO `world_autolearn` VALUES ('22570', '1', '1024', '0', '62', '0', '0', '0', 'КалечениеУровень1');
INSERT INTO `world_autolearn` VALUES ('26998', '1', '1024', '0', '62', '99', '0', '0', 'УстрашающийревУровень6');
INSERT INTO `world_autolearn` VALUES ('26987', '1', '1024', '0', '63', '8921', '0', '0', 'ЛунныйогоньУровень11');
INSERT INTO `world_autolearn` VALUES ('26981', '1', '1024', '0', '63', '774', '0', '0', 'ОмоложениеУровень12');
INSERT INTO `world_autolearn` VALUES ('24248', '1', '1024', '0', '63', '22568', '0', '0', 'СвирепыйукусУровень6');
INSERT INTO `world_autolearn` VALUES ('26997', '1', '1024', '0', '64', '779', '0', '0', 'Размах(медведь)Уровень6');
INSERT INTO `world_autolearn` VALUES ('33763', '1', '1024', '0', '64', '0', '0', '0', 'ЖизнецветУровень1');
INSERT INTO `world_autolearn` VALUES ('26992', '1', '1024', '0', '64', '467', '0', '0', 'ШипыУровень7');
INSERT INTO `world_autolearn` VALUES ('27003', '1', '1024', '0', '64', '1822', '0', '0', 'ГлубокаяранаУровень5');
INSERT INTO `world_autolearn` VALUES ('33357', '1', '1024', '0', '65', '1850', '0', '0', 'ПорывУровень3');
INSERT INTO `world_autolearn` VALUES ('26980', '1', '1024', '0', '65', '8936', '0', '0', 'ВосстановлениеУровень10');
INSERT INTO `world_autolearn` VALUES ('27005', '1', '1024', '0', '66', '6785', '0', '0', 'НакинутьсяУровень5');
INSERT INTO `world_autolearn` VALUES ('27006', '1', '1024', '0', '66', '9005', '0', '0', 'НаскокУровень4');
INSERT INTO `world_autolearn` VALUES ('33745', '1', '1024', '0', '66', '0', '0', '0', 'РастерзатьУровень1');
INSERT INTO `world_autolearn` VALUES ('26996', '1', '1024', '0', '67', '6807', '0', '0', 'ТрепкаУровень8');
INSERT INTO `world_autolearn` VALUES ('27000', '1', '1024', '0', '67', '1082', '0', '0', 'ЦапнутьУровень6');
INSERT INTO `world_autolearn` VALUES ('26986', '1', '1024', '0', '67', '2912', '0', '0', 'ЗвездныйогоньУровень8');
INSERT INTO `world_autolearn` VALUES ('27008', '1', '1024', '0', '67', '1079', '0', '0', 'РазорватьУровень7');
INSERT INTO `world_autolearn` VALUES ('33987', '1', '1024', '0', '68', '33878', '0', '0', 'Увечье(медведь)Уровень3');
INSERT INTO `world_autolearn` VALUES ('26989', '1', '1024', '0', '68', '339', '0', '0', 'ГневдеревьевУровень7');
INSERT INTO `world_autolearn` VALUES ('27009', '1', '1024', '0', '68', '16689', '0', '0', 'ХваткаприродыУровень7');
INSERT INTO `world_autolearn` VALUES ('33983', '1', '1024', '0', '68', '33876', '0', '0', 'Увечье(кошка)Уровень3');
INSERT INTO `world_autolearn` VALUES ('26979', '1', '1024', '0', '69', '5185', '0', '0', 'ЦелительноеприкосновениеУровень13');
INSERT INTO `world_autolearn` VALUES ('26985', '1', '1024', '0', '69', '5176', '0', '0', 'ГневУровень10');
INSERT INTO `world_autolearn` VALUES ('26982', '1', '1024', '0', '69', '774', '0', '0', 'ОмоложениеУровень13');
INSERT INTO `world_autolearn` VALUES ('26994', '1', '1024', '0', '69', '20484', '0', '0', 'ВозрождениеУровень6');
INSERT INTO `world_autolearn` VALUES ('27004', '1', '1024', '0', '69', '8998', '0', '0', 'ПопятитьсяУровень5');
INSERT INTO `world_autolearn` VALUES ('50764', '1', '1024', '0', '69', '50769', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('40120', '1', '1024', '0', '71', '33943', '0', '0', 'ОбликстремительнойптицыСменаоблика');
INSERT INTO `world_autolearn` VALUES ('53248', '1', '1024', '0', '70', '48438', '0', '0', 'БуйныйростУровень2');
INSERT INTO `world_autolearn` VALUES ('53225', '1', '1024', '0', '70', '50516', '0', '0', 'ТайфунУровень3');
INSERT INTO `world_autolearn` VALUES ('53199', '1', '1024', '0', '70', '48505', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('27013', '1', '1024', '0', '70', '5570', '0', '0', 'РойнасекомыхУровень6');
INSERT INTO `world_autolearn` VALUES ('27002', '1', '1024', '0', '70', '5221', '0', '0', 'ПолоснутьУровень7');
INSERT INTO `world_autolearn` VALUES ('26991', '1', '1024', '0', '70', '21849', '0', '0', 'ДардикойприродыУровень3');
INSERT INTO `world_autolearn` VALUES ('27012', '1', '1024', '0', '70', '16914', '0', '0', 'ГрозаУровень4');
INSERT INTO `world_autolearn` VALUES ('26990', '1', '1024', '0', '70', '1126', '0', '0', 'ЗнакдикойприродыУровень8');
INSERT INTO `world_autolearn` VALUES ('26983', '1', '1024', '0', '70', '740', '0', '0', 'СпокойствиеУровень5');
INSERT INTO `world_autolearn` VALUES ('26988', '1', '1024', '0', '70', '8921', '0', '0', 'ЛунныйогоньУровень12');
INSERT INTO `world_autolearn` VALUES ('33786', '1', '1024', '0', '70', '0', '0', '0', 'Смерч');
INSERT INTO `world_autolearn` VALUES ('26995', '1', '1024', '0', '70', '2908', '0', '0', 'УмиротворениеживотногоУровень4');
INSERT INTO `world_autolearn` VALUES ('49799', '1', '1024', '0', '71', '1079', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48559', '1', '1024', '0', '71', '99', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('50212', '1', '1024', '0', '71', '5217', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('62078', '1', '1024', '0', '71', '0', '0', '0', 'Размах(кошка)Уровень1');
INSERT INTO `world_autolearn` VALUES ('48442', '1', '1024', '0', '71', '8936', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48573', '1', '1024', '0', '72', '1822', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48450', '1', '1024', '0', '72', '33763', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48576', '1', '1024', '0', '72', '22568', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48464', '1', '1024', '0', '72', '2912', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48561', '1', '1024', '0', '72', '779', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48578', '1', '1024', '0', '73', '6785', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48479', '1', '1024', '0', '73', '6807', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48567', '1', '1024', '0', '73', '33745', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48569', '1', '1024', '0', '73', '1082', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48377', '1', '1024', '0', '74', '5185', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('53307', '1', '1024', '0', '74', '467', '0', '0', 'ШипыУровень8');
INSERT INTO `world_autolearn` VALUES ('48459', '1', '1024', '0', '74', '5176', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49802', '1', '1024', '0', '74', '22570', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('53226', '1', '1024', '0', '75', '50516', '0', '0', 'ТайфунУровень4');
INSERT INTO `world_autolearn` VALUES ('53200', '1', '1024', '0', '75', '48505', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('52610', '1', '1024', '0', '75', '0', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48571', '1', '1024', '0', '75', '5221', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('53249', '1', '1024', '0', '75', '48438', '0', '0', 'БуйныйростУровень3');
INSERT INTO `world_autolearn` VALUES ('48440', '1', '1024', '0', '75', '774', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48462', '1', '1024', '0', '75', '8921', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48565', '1', '1024', '0', '75', '33876', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48563', '1', '1024', '0', '75', '33878', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48446', '1', '1024', '0', '75', '740', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48575', '1', '1024', '0', '76', '8998', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49803', '1', '1024', '0', '77', '9005', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48443', '1', '1024', '0', '77', '8936', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48560', '1', '1024', '0', '77', '99', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48562', '1', '1024', '0', '77', '779', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48465', '1', '1024', '0', '78', '2912', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('53312', '1', '1024', '0', '78', '16689', '0', '0', 'ХваткаприродыУровень8');
INSERT INTO `world_autolearn` VALUES ('53308', '1', '1024', '0', '78', '339', '0', '0', 'ГневдеревьевУровень8');
INSERT INTO `world_autolearn` VALUES ('48577', '1', '1024', '0', '78', '22568', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48574', '1', '1024', '0', '78', '1822', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48378', '1', '1024', '0', '79', '5185', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48477', '1', '1024', '0', '79', '20484', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48461', '1', '1024', '0', '79', '5176', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('50213', '1', '1024', '0', '79', '5217', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48480', '1', '1024', '0', '79', '6807', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48570', '1', '1024', '0', '79', '1082', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48579', '1', '1024', '0', '79', '6785', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('61384', '1', '1024', '0', '80', '50516', '0', '0', 'ТайфунУровень5');
INSERT INTO `world_autolearn` VALUES ('48451', '1', '1024', '0', '80', '33763', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48447', '1', '1024', '0', '80', '740', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48441', '1', '1024', '0', '80', '774', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('53251', '1', '1024', '0', '80', '48438', '0', '0', 'БуйныйростУровень4');
INSERT INTO `world_autolearn` VALUES ('53201', '1', '1024', '0', '80', '48505', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48463', '1', '1024', '0', '80', '8921', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48568', '1', '1024', '0', '80', '33745', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48566', '1', '1024', '0', '80', '33876', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('49800', '1', '1024', '0', '80', '1079', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48564', '1', '1024', '0', '80', '33878', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('50464', '1', '1024', '0', '80', '0', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('50763', '1', '1024', '0', '80', '50769', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48470', '1', '1024', '0', '80', '21849', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48469', '1', '1024', '0', '80', '1126', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48468', '1', '1024', '0', '80', '5570', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48467', '1', '1024', '0', '80', '16914', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('48572', '1', '1024', '0', '80', '5221', '0', '0', 'unk');
INSERT INTO `world_autolearn` VALUES ('674', '1', '8', '0', '10', '0', '0', '0', 'БойдвумяоружиямиПассивная');
INSERT INTO `world_autolearn` VALUES ('3127', '1', '8', '0', '12', '0', '0', '0', 'ПарированиеПассивная');
INSERT INTO `world_autolearn` VALUES ('8737', '1', '68', '0', '40', '0', '0', '0', 'Кольчужныедоспехи');
INSERT INTO `world_autolearn` VALUES ('3127', '1', '1', '0', '6', '0', '0', '0', 'ПарированиеПассивная');
INSERT INTO `world_autolearn` VALUES ('750', '1', '3', '0', '40', '0', '0', '0', 'Латы');
REPLACE INTO `world_autolearn` (`SpellId`, `SpellMask`, `RequiredClassMask`, `RequiredRaceMask`, `RequiredLevel`, `RequiredSpellId`, `RequiredSkillId`, `RequiredSkillValue`, `Comment`) VALUES
(3101, 16, 0, 0, 0, 0, 171, 50, 'Alchemy (150)'),
(3464, 16, 0, 0, 0, 0, 171, 125, 'Alchemy (225)'),
(11611, 16, 0, 0, 0, 0, 171, 200, 'Alchemy (300)'),
(28596, 16, 0, 0, 0, 0, 171, 275, 'Alchemy (375)'),
(51304, 16, 0, 0, 0, 0, 171, 350, 'Alchemy (450)'),
(3100, 16, 0, 0, 0, 0, 164, 50, 'Blacksmithing (150)'),
(3538, 16, 0, 0, 0, 0, 164, 125, 'Blacksmithing (225)'),
(9785, 16, 0, 0, 0, 0, 164, 200, 'Blacksmithing (300)'),
(29844, 16, 0, 0, 0, 0, 164, 275, 'Blacksmithing (375)'),
(51300, 16, 0, 0, 0, 0, 164, 350, 'Blacksmithing (450)'),
(7412, 16, 0, 0, 0, 0, 333, 50, 'Enchanting (150)'),
(7413, 16, 0, 0, 0, 0, 333, 125, 'Enchanting (225)'),
(13920, 16, 0, 0, 0, 0, 333, 200, 'Enchanting (300)'),
(28029, 16, 0, 0, 0, 0, 333, 275, 'Enchanting (375)'),
(51313, 16, 0, 0, 0, 0, 333, 350, 'Enchanting (450)'),
(4037, 16, 0, 0, 0, 0, 202, 50, 'Engineering (150)'),
(4038, 16, 0, 0, 0, 0, 202, 125, 'Engineering (225)'),
(12656, 16, 0, 0, 0, 0, 202, 200, 'Engineering (300)'),
(30350, 16, 0, 0, 0, 0, 202, 275, 'Engineering (375)'),
(51306, 16, 0, 0, 0, 0, 202, 350, 'Engineering (450)'),
(2368, 16, 0, 0, 0, 0, 182, 50, 'Herbalism (150)'),
(3570, 16, 0, 0, 0, 0, 182, 125, 'Herbalism (225)'),
(11993, 16, 0, 0, 0, 0, 182, 200, 'Herbalism (300)'),
(28695, 16, 0, 0, 0, 0, 182, 275, 'Herbalism (375)'),
(50300, 16, 0, 0, 0, 0, 182, 350, 'Herbalism (450)'),
(45358, 16, 0, 0, 0, 0, 773, 50, 'Inscription (150)'),
(45359, 16, 0, 0, 0, 0, 773, 125, 'Inscription (225)'),
(45360, 16, 0, 0, 0, 0, 773, 200, 'Inscription (300)'),
(45361, 16, 0, 0, 0, 0, 773, 275, 'Inscription (375)'),
(45363, 16, 0, 0, 0, 0, 773, 350, 'Inscription (450)'),
(25230, 16, 0, 0, 0, 0, 755, 50, 'Jewelcrafting (150)'),
(28894, 16, 0, 0, 0, 0, 755, 125, 'Jewelcrafting (225)'),
(28895, 16, 0, 0, 0, 0, 755, 200, 'Jewelcrafting (300)'),
(28897, 16, 0, 0, 0, 0, 755, 275, 'Jewelcrafting (375)'),
(51311, 16, 0, 0, 0, 0, 755, 350, 'Jewelcrafting (450)'),
(3104, 16, 0, 0, 0, 0, 165, 50, 'Leatherworking (150)'),
(3811, 16, 0, 0, 0, 0, 165, 125, 'Leatherworking (225)'),
(10662, 16, 0, 0, 0, 0, 165, 200, 'Leatherworking (300)'),
(32549, 16, 0, 0, 0, 0, 165, 275, 'Leatherworking (375)'),
(51302, 16, 0, 0, 0, 0, 165, 350, 'Leatherworking (450)'),
(2576, 16, 0, 0, 0, 0, 186, 50, 'Mining (150)'),
(3564, 16, 0, 0, 0, 0, 186, 125, 'Mining (225)'),
(10248, 16, 0, 0, 0, 0, 186, 200, 'Mining (300)'),
(29354, 16, 0, 0, 0, 0, 186, 275, 'Mining (375)'),
(50310, 16, 0, 0, 0, 0, 186, 350, 'Mining (450)'),
(8617, 16, 0, 0, 0, 0, 393, 50, 'Skinning (150)'),
(8618, 16, 0, 0, 0, 0, 393, 125, 'Skinning (225)'),
(10768, 16, 0, 0, 0, 0, 393, 200, 'Skinning (300)'),
(32678, 16, 0, 0, 0, 0, 393, 275, 'Skinning (375)'),
(50305, 16, 0, 0, 0, 0, 393, 350, 'Skinning (450)'),
(3909, 16, 0, 0, 0, 0, 197, 50, 'Tailoring (150)'),
(3910, 16, 0, 0, 0, 0, 197, 125, 'Tailoring (225)'),
(12180, 16, 0, 0, 0, 0, 197, 200, 'Tailoring (300)'),
(26790, 16, 0, 0, 0, 0, 197, 275, 'Tailoring (375)'),
(51309, 16, 0, 0, 0, 0, 197, 350, 'Tailoring (450)'),
(3102, 16, 0, 0, 0, 0, 185, 50, 'Cooking (150)'),
(3413, 16, 0, 0, 0, 0, 185, 125, 'Cooking (225)'),
(18260, 16, 0, 0, 0, 0, 185, 200, 'Cooking (300)'),
(33359, 16, 0, 0, 0, 0, 185, 275, 'Cooking (375)'),
(51296, 16, 0, 0, 0, 0, 185, 350, 'Cooking (450)'),
(3274, 16, 0, 0, 0, 0, 129, 50, 'First Aid (150)'),
(7924, 16, 0, 0, 0, 0, 129, 125, 'First Aid (225)'),
(10846, 16, 0, 0, 0, 0, 129, 200, 'First Aid (300)'),
(27028, 16, 0, 0, 0, 0, 129, 275, 'First Aid (375)'),
(45542, 16, 0, 0, 0, 0, 129, 350, 'First Aid (450)'),
(7731, 16, 0, 0, 0, 0, 356, 50, 'Fishing (150)'),
(7732, 16, 0, 0, 0, 0, 356, 125, 'Fishing (225)'),
(18248, 16, 0, 0, 0, 0, 356, 200, 'Fishing (300)'),
(33095, 16, 0, 0, 0, 0, 356, 275, 'Fishing (375)'),
(51294, 16, 0, 0, 0, 0, 356, 350, 'Fishing (450)');
REPLACE INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(11100, 'Win guild \'%s\' max damage \'%s\'  max heal \'%s\' (need corrected text)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Гильдия \'%s\', выйграла сражение на поле боя, больше всех на поле боя нанёс урон \'%s\', а вылечил \'%s\''),
(11101, 'Lose guild \'%s\' max damage \'%s\'  max heal \'%s\' (need corrected text)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Гильдия \'%s\', проиграла сражение на поле боя, больше всех на поле боя нанёс урон \'%s\', а вылечил \'%s\''),
(11102, 'Win guild \'%s\' and lose guild \'%s\' max damage \'%s\'  max heal \'%s\' (need corrected text)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Гильдия \'%s\', выйграла сражение на поле боя против гильдии \'%s\', больше всех на поле боя нанёс урон \'%s\', а вылечил \'%s\'');
-- need corrected english text :( (my english is bad)
REPLACE INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(11006, '%s - %s (Normal on %u peoples) defeated guild \"%s\", %u in the composition of the person(s)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s - %s (Обычный режим на %u человек) повержен гильдией \'%s\', составом в %u человек(а)'),
(11007, '%s - %s (Heroic on %u peoples) defeated guild \"%s\", %u in the composition of the person(s)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s - %s (Героический режим на %u человек) повержен гильдией \'%s\', составом в %u человек(а)');
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(11002, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Подождите 2 минут после смены множителя опыта, чтобы изменить его повторно.'),
(11003, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Множитель не может быть меньше %f и больше %f.'),
(11004, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Установлены новый множитель опыта для учетной записи'),
(11005, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Установлены новый множитель опыта: %f для персонажа %s');
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(15000, 'FriendChat ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Личные сообщения только для друзей включены'),
(15001, 'FriendChat OFF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Личные сообщения только для друзей отключены');DROP TABLE IF EXISTS `world_item_upgrade`;
CREATE TABLE `world_item_upgrade` (
  `enchant_id` int(10) NOT NULL,
  `prev_enchant_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `golds` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`enchant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DELETE FROM `world_item_upgrade`;
INSERT INTO `world_item_upgrade` VALUES ('66', '0', '+1 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('72', '66', '+2 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('73', '72', '+3 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('102', '73', '+4 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('103', '102', '+5 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('104', '103', '+6 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('105', '104', '+7 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('353', '105', '+8 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('356', '353', '+9 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('361', '356', '+10 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('366', '361', '+11 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('371', '366', '+12 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('409', '371', '+13 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('411', '409', '+14 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1068', '411', '+15 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1069', '1068', '+16 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1070', '1069', '+17 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1071', '1070', '+18 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1072', '1071', '+19 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1073', '1072', '+20 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1074', '1073', '+21 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1075', '1074', '+22 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1076', '1075', '+23 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1077', '1076', '+24 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1078', '1077', '+25 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1079', '1078', '+26 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1080', '1079', '+27 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1081', '1080', '+28 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1082', '1081', '+29 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1083', '1082', '+30 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1084', '1083', '+31 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1085', '1084', '+32 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1086', '1085', '+33 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1087', '1086', '+34 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1088', '1087', '+35 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1089', '1088', '+36 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1090', '1089', '+37 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1091', '1090', '+38 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1092', '1091', '+39 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1093', '1092', '+40 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1209', '1093', '+41 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1210', '1209', '+42 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1211', '1210', '+43 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1212', '1211', '+44 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1213', '1212', '+45 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1214', '1213', '+46 к выносливости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('3851', '1214', '+50 к выносливости', '4000');
INSERT INTO `world_item_upgrade` VALUES ('68', '0', '+1 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('69', '68', '+2 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('70', '69', '+3 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('106', '70', '+4 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('107', '106', '+5 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('108', '107', '+6 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('109', '108', '+7 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('352', '109', '+8 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('357', '352', '+9 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('362', '357', '+10 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('367', '362', '+11 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('372', '367', '+12 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('410', '372', '+13 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('412', '410', '+14 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('684', '412', '+15 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1043', '684', '+16 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1044', '1043', '+17 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1045', '1044', '+18 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1046', '1045', '+19 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1047', '1046', '+20 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1048', '1047', '+21 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1049', '1048', '+22 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1050', '1049', '+23 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1051', '1050', '+24 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1052', '1051', '+25 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1053', '1052', '+26 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1054', '1053', '+27 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1055', '1054', '+28 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1056', '1055', '+29 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1057', '1056', '+30 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1058', '1057', '+31 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1059', '1058', '+32 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1060', '1059', '+33 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1061', '1060', '+34 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1062', '1061', '+35 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1063', '1062', '+36 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1064', '1063', '+37 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1065', '1064', '+38 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1066', '1065', '+39 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1067', '1066', '+40 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1203', '1067', '+41 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1204', '1203', '+42 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1205', '1204', '+43 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1206', '1205', '+44 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1207', '1206', '+45 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1208', '1207', '+46 к силе', '1000');
INSERT INTO `world_item_upgrade` VALUES ('79', '0', '+1 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('80', '79', '+2 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('81', '80', '+3 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('94', '81', '+4 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('95', '94', '+5 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('96', '95', '+6 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('97', '96', '+7 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('350', '97', '+8 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('354', '350', '+9 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('359', '354', '+10 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('364', '359', '+11 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('369', '364', '+12 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('405', '369', '+13 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('406', '405', '+14 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1118', '406', '+15 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1119', '1118', '+16 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1120', '1119', '+17 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1121', '1120', '+18 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1122', '1121', '+19 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1123', '1122', '+20 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1124', '1123', '+21 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1125', '1124', '+22 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1126', '1125', '+23 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1127', '1126', '+24 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1128', '1127', '+25 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1129', '1128', '+26 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1130', '1129', '+27 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1131', '1130', '+28 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1132', '1131', '+29 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1133', '1132', '+30 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1134', '1133', '+31 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1135', '1134', '+32 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1136', '1135', '+33 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1137', '1136', '+34 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1138', '1137', '+35 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1139', '1138', '+36 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1140', '1139', '+37 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1141', '1140', '+38 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1142', '1141', '+39 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1143', '1142', '+40 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1221', '1143', '+41 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1222', '1221', '+42 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1223', '1222', '+43 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1224', '1223', '+44 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1225', '1224', '+45 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1226', '1225', '+46 к интеллекту', '1000');
INSERT INTO `world_item_upgrade` VALUES ('206', '0', '+1 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('207', '206', '+2 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2910', '207', '+3 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('208', '2910', '+4 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('209', '208', '+5 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('210', '209', '+6 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('211', '210', '+7 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('212', '211', '+8 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('430', '212', '+9 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('431', '430', '+11 к силе заклинаний', '2000');
INSERT INTO `world_item_upgrade` VALUES ('432', '431', '+12 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2317', '432', '+13 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2318', '2317', '+14 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2319', '2318', '+15 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2320', '2319', '+16 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2321', '2320', '+18 к силе заклинаний', '2000');
INSERT INTO `world_item_upgrade` VALUES ('2322', '2321', '+19 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2323', '2322', '+20 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2324', '2323', '+21 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2325', '2324', '+22 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2326', '2325', '+23 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2327', '2326', '+25 к силе заклинаний', '2000');
INSERT INTO `world_item_upgrade` VALUES ('2328', '2327', '+26 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2329', '2328', '+27 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2330', '2329', '+28 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2331', '2330', '+29 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2332', '2331', '+30 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2333', '2332', '+32 к силе заклинаний', '2000');
INSERT INTO `world_item_upgrade` VALUES ('2334', '2333', '+33 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2335', '2334', '+34 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2336', '2335', '+35 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2337', '2336', '+36 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2338', '2337', '+37 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2339', '2338', '+39 к силе заклинаний', '2000');
INSERT INTO `world_item_upgrade` VALUES ('2340', '2339', '+40 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2341', '2340', '+41 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2342', '2341', '+42 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2343', '2342', '+43 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2344', '2343', '+44 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('3257', '2344', '+54 к силе заклинаний', '10000');
INSERT INTO `world_item_upgrade` VALUES ('3255', '3257', '+55 к силе заклинаний', '1000');
INSERT INTO `world_item_upgrade` VALUES ('74', '0', '+1 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('75', '74', '+2 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('76', '75', '+3 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('90', '76', '+4 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('91', '90', '+5 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('92', '91', '+6 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('93', '92', '+7 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('343', '93', '+8 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('349', '343', '+9 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('358', '349', '+10 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('363', '358', '+11 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('368', '363', '+12 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('403', '368', '+13 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('404', '403', '+14 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('883', '404', '+15 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('983', '883', '+16 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1094', '983', '+17 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1095', '1094', '+18 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1096', '1095', '+19 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1097', '1096', '+20 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1098', '1097', '+21 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1099', '1098', '+22 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1100', '1099', '+23 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1101', '1100', '+24 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1102', '1101', '+25 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1103', '1102', '+26 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1104', '1103', '+27 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1105', '1104', '+28 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1106', '1105', '+29 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1107', '1106', '+30 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1108', '1107', '+31 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1109', '1108', '+32 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1110', '1109', '+33 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1111', '1110', '+34 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1112', '1111', '+35 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1113', '1112', '+36 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1114', '1113', '+37 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1115', '1114', '+38 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1116', '1115', '+39 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1117', '1116', '+40 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1215', '1117', '+41 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1216', '1215', '+42 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1217', '1216', '+43 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1218', '1217', '+44 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1219', '1218', '+45 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1220', '1219', '+46 к ловкости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2801', '0', '+8 к устойчивости', '8000');
INSERT INTO `world_item_upgrade` VALUES ('2788', '2801', '+9 к устойчивости', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2789', '2788', '+15 к устойчивости', '6000');
INSERT INTO `world_item_upgrade` VALUES ('1563', '0', '+2 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1583', '1563', '+4 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1584', '1583', '+6 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1585', '1584', '+8 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1586', '1585', '+10 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1587', '1586', '+12 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1588', '1587', '+14 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1589', '1588', '+16 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1590', '1589', '+18 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1591', '1590', '+20 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1592', '1591', '+22 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1593', '1592', '+24 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1594', '1593', '+26 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1595', '1594', '+28 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1596', '1595', '+30 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1597', '1596', '+32 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1598', '1597', '+34 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1599', '1598', '+36 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1600', '1599', '+38 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('3521', '1600', '+40 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1602', '3521', '+42 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1603', '1602', '+44 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1604', '1603', '+46 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1605', '1604', '+48 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('3845', '1605', '+50 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1607', '3845', '+52 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1608', '1607', '+54 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1609', '1608', '+56 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1610', '1609', '+58 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1611', '1610', '+60 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1612', '1611', '+62 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1613', '1612', '+64 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1614', '1613', '+66 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1615', '1614', '+68 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1616', '1615', '+70 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1617', '1616', '+72 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1618', '1617', '+74 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1619', '1618', '+76 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1620', '1619', '+78 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1621', '1620', '+80 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1622', '1621', '+82 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1623', '1622', '+84 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1624', '1623', '+86 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1625', '1624', '+88 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1626', '1625', '+90 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1627', '1626', '+92 к силе атаки', '1000');
INSERT INTO `world_item_upgrade` VALUES ('2838', '0', '+7 к рейтингу критического удара', '1500');
INSERT INTO `world_item_upgrade` VALUES ('195', '2838', '+14 к рейтингу критического удара', '3000');
INSERT INTO `world_item_upgrade` VALUES ('196', '195', '+28 к рейтингу критического удара', '6000');
INSERT INTO `world_item_upgrade` VALUES ('197', '196', '+42 к рейтингу критического удара', '8000');
INSERT INTO `world_item_upgrade` VALUES ('198', '197', '+56 к рейтингу критического удара', '12000');
INSERT INTO `world_item_upgrade` VALUES ('436', '198', '+70 к рейтингу критического удара', '15000');
INSERT INTO `world_item_upgrade` VALUES ('82', '0', '+1 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('83', '82', '+2 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('84', '83', '+3 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('98', '84', '+4 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('99', '98', '+5 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('100', '99', '+6 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('101', '100', '+7 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('351', '101', '+8 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('355', '351', '+9 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('360', '355', '+10 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('365', '360', '+11 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('370', '365', '+12 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('407', '370', '+13 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('408', '407', '+14 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1144', '408', '+15 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1145', '1144', '+16 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1146', '1145', '+17 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1147', '1146', '+18 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1148', '1147', '+19 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1149', '1148', '+20 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1150', '1149', '+21 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1151', '1150', '+22 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1152', '1151', '+23 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1153', '1152', '+24 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1154', '1153', '+25 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1155', '1154', '+26 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1156', '1155', '+27 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1157', '1156', '+28 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1158', '1157', '+29 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1159', '1158', '+30 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1160', '1159', '+31 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1161', '1160', '+32 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1162', '1161', '+33 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1163', '1162', '+34 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1183', '1163', '+35 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1164', '1183', '+36 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1165', '1164', '+37 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1166', '1165', '+38 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1167', '1166', '+39 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1168', '1167', '+40 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1227', '1168', '+41 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1228', '1227', '+42 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1229', '1228', '+43 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1230', '1229', '+44 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1231', '1230', '+45 к духу', '1000');
INSERT INTO `world_item_upgrade` VALUES ('1232', '1231', '+46 к духу', '1000');

DELETE FROM `trinity_string` WHERE `entry` BETWEEN 11300 AND 11303;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(11303, 'Remove effect', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Удалить эффект'),
(11302, 'Effect №%i (now: %s)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Эффект №%i (%s)'),
(11301, 'no effect', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'нет эффекта'),
(11300, 'Are you sure you want to remove the effect?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы уверены что хотите удалить эффект?');

SET @OBJECT_ID = 250000;
SET @OBJECT_GUID = 180000;
DELETE FROM `gameobject_template` WHERE `entry` = @OBJECT_ID;
DELETE FROM `locales_gameobject` WHERE `entry` = @OBJECT_ID;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`,
`questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`,
`data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`) VALUES
(@OBJECT_ID, '2', '8300', 'Upgrade items', '', '', '', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0', '0', '0', '', 'go_item_upgrade', '12340');
INSERT INTO `locales_gameobject` (`entry`, `name_loc8`) VALUES (@OBJECT_ID, 'Шмотка на прокачку');

-- Warning!!! Install in stormwind and orgrimmar
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OBJECT_GUID AND @OBJECT_GUID + 1 OR `id` = @OBJECT_ID;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OBJECT_GUID, @OBJECT_ID, '1', '1', '1', '2060.13', '-4803.88', '22.4355', '5.74909', '0', '0', '0.263886', '-0.964554', '300', '0', '1'),
(@OBJECT_GUID + 1, @OBJECT_ID, '0', '1', '1', '-8434.95', '623.952', '95.2377', '4.34578', '0', '0', '0.824152', '-0.566369', '300', '0', '1');REPLACE INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(11008, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF DOUBLE KILL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF ДВОЙНОЕ УБИЙСТВО'),
(11009, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF MULTI KILL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF ТРОЙНОЕ УБИЙСТВО'),
(11010, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF MEGA KILL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF МЕГА УБИЙСТВО'),
(11011, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF ULTRA KILL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF НЕВЕРОЯТНОЕ УБИЙСТВО'),
(11012, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF MONSTER KILL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF ЧУДОВИЩНОЕ УБИЙСТВО'),
(11013, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF LUDICROUS KILL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF ЕМУ НЕ ДОШУТОК'),
(11014, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFFFF0018 HOLY SHIT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFFFF0018 СРАНЬ ГОСПОДНЯ'),
(11015, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFFFF0018 FIRST BLOOD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFFFF0018 ПЕРВАЯ КРОВЬ'),
(11016, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF KILLING SPREE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF ЧЕРЕДА УБИЙСТВ'),
(11017, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF RAMPAGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF ЯРОСТНЫЙ'),
(11018, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF DOMINATING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF ДОМИНИРУЮЩИЙ'),
(11019, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF UNSTOPPABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF НЕОСТАНОВИМЫЙ'),
(11020, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF GODLIKE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF КАК БОГ'),
(11021, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF WICKED SICK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|TInterface\\Icons\\Achievement_bg_topdps.png:30|t |cFF60FF00 %s |cFF00FFFF ПОГИБЕЛЬ СЛАБЫХ');

-- ----------------------------
-- Table structure for `world_multikill`
-- ----------------------------
DROP TABLE IF EXISTS `world_multikill`;
CREATE TABLE `world_multikill` (
  `Type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Count` tinyint(3) unsigned NOT NULL,
  `Gold` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Honor` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `BuffFirst` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `BuffSecond` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `TrinityStringId` mediumint(8) NOT NULL,
  `KillCredit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Type`,`Count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of world_multikill
-- ----------------------------
INSERT INTO `world_multikill` VALUES ('0', '2', '0', '1000', '2379', '0', '0', '11008', '0');
INSERT INTO `world_multikill` VALUES ('0', '3', '0', '2000', '2379', '23505', '0', '11009', '0');
INSERT INTO `world_multikill` VALUES ('0', '4', '0', '3000', '2379', '23505', '0', '11010', '0');
INSERT INTO `world_multikill` VALUES ('0', '5', '0', '4000', '2379', '23505', '0', '11011', '0');
INSERT INTO `world_multikill` VALUES ('0', '6', '0', '5000', '2379', '23505', '14808', '11012', '0');
INSERT INTO `world_multikill` VALUES ('0', '7', '0', '6000', '2379', '23505', '14808', '11013', '0');
INSERT INTO `world_multikill` VALUES ('0', '8', '0', '7000', '2379', '23505', '14808', '11014', '0');
INSERT INTO `world_multikill` VALUES ('2', '0', '0', '2000', '0', '0', '0', '11015', '0');
INSERT INTO `world_multikill` VALUES ('1', '5', '0', '1000', '0', '0', '0', '11016', '0');
INSERT INTO `world_multikill` VALUES ('1', '10', '0', '2000', '0', '0', '0', '11017', '0');
INSERT INTO `world_multikill` VALUES ('1', '15', '0', '3000', '0', '0', '0', '11018', '0');
INSERT INTO `world_multikill` VALUES ('1', '20', '0', '4000', '0', '0', '0', '11019', '0');
INSERT INTO `world_multikill` VALUES ('1', '25', '0', '5000', '0', '0', '0', '11020', '0');
INSERT INTO `world_multikill` VALUES ('1', '30', '0', '6000', '0', '0', '0', '11021', '0');
DELETE FROM `creature_template` WHERE `entry` = 100124;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`,
`modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`,
`faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`,
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`,
`trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`,
`resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`,
`spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`,
`Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`,
`RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES
('100124', '0', '0', '0', '0', '0', '22750', '0', '0', '0', 'Tournament test', '', '', '0', '80', '80', '2', '35', '35', '1', '0', '0', '1', '0',
'315', '473', '0', '118', '1', '1500', '1500', '1', '0', '0', '0', '0', '0', '0', '0', '252', '378', '94', '7', '0', '0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0',
'0', '1', '0', '0', '0', 'npc_tournaments_organizer', '12340');

-- ----------------------------
-- Table structure for `world_tournaments`
-- ----------------------------
DROP TABLE IF EXISTS `world_tournaments`;
CREATE TABLE `world_tournaments` (
  `entry` int(11) NOT NULL,
  `level` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_limit` int(11) NOT NULL DEFAULT '0',
  `say_start` int(11) unsigned NOT NULL DEFAULT '0',
  `say_win` int(11) unsigned NOT NULL DEFAULT '0',
  `say_lose` int(10) unsigned NOT NULL DEFAULT '0',
  `chest_id` int(10) unsigned NOT NULL DEFAULT '0',
  `point_id` int(10) unsigned NOT NULL DEFAULT '0',
  `req_quest_id` int(10) unsigned NOT NULL DEFAULT '0',
  `kill_credit` int(10) unsigned NOT NULL DEFAULT '0',
  `menu_string` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`entry`,`level`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of world_tournaments
-- ----------------------------
INSERT INTO `world_tournaments` VALUES ('100124', '1', '30000', '0', '0', '0', '2850', '1', '0', '0', '0', 'Npc 100124, level 1, limit 30 sec.');
INSERT INTO `world_tournaments` VALUES ('100124', '2', '20000', '0', '0', '0', '3715', '1', '0', '0', '0', 'Npc 100124, level 2, limit 20 sec.');

-- ----------------------------
-- Table structure for `world_tournament_points`
-- ----------------------------
DROP TABLE IF EXISTS `world_tournament_points`;
CREATE TABLE `world_tournament_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(10) unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of world_tournament_points
-- ----------------------------
INSERT INTO `world_tournament_points` VALUES ('1', '0', '-13218', '249', '22', '1.34', 'Gurubashi Enter');
INSERT INTO `world_tournament_points` VALUES ('2', '0', '-13205', '275', '22', '4.37', 'Gurubashi Center');

-- ----------------------------
-- Table structure for `world_tournament_creature`
-- ----------------------------
DROP TABLE IF EXISTS `world_tournament_creature`;
CREATE TABLE `world_tournament_creature` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tournament_entry` int(10) unsigned NOT NULL DEFAULT '0',
  `tournament_level` int(10) unsigned NOT NULL DEFAULT '0',
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `from_point_id` int(10) unsigned NOT NULL DEFAULT '0',
  `to_point_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of world_tournament_creature
-- ----------------------------
INSERT INTO `world_tournament_creature` VALUES ('1', '100124', '1', '15931', '1', '1', '2', '0', 'Tour. 100124, level 1, npc: Grobbulus');
INSERT INTO `world_tournament_creature` VALUES ('2', '100124', '2', '6', '1', '1', '2', '0', 'Tour. 100124, level 2, npc: Kobold');
