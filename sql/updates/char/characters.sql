CREATE TABLE `custom_transmogrifications` (
	`GUID` INT(10) UNSIGNED NOT NULL COMMENT 'Item guidLow',
	`FakeEntry` INT(10) UNSIGNED NOT NULL COMMENT 'Item entry',
	`Owner` INT(10) UNSIGNED NOT NULL COMMENT 'Player guidLow',
	PRIMARY KEY (`GUID`)
)
COMMENT='version 4.0'
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB;
