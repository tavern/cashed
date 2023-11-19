CREATE TABLE `t3turbo_account` (
	`userId` varchar(255) NOT NULL,
	`type` varchar(255) NOT NULL,
	`provider` varchar(255) NOT NULL,
	`providerAccountId` varchar(255) NOT NULL,
	`refresh_token` varchar(255),
	`access_token` varchar(255),
	`expires_at` int,
	`token_type` varchar(255),
	`scope` varchar(255),
	`id_token` text,
	`session_state` varchar(255),
	CONSTRAINT `t3turbo_account_provider_providerAccountId_pk` PRIMARY KEY(`provider`,`providerAccountId`)
);
--> statement-breakpoint
CREATE TABLE `t3turbo_session` (
	`sessionToken` varchar(255) NOT NULL,
	`userId` varchar(255) NOT NULL,
	`expires` timestamp NOT NULL,
	CONSTRAINT `t3turbo_session_sessionToken` PRIMARY KEY(`sessionToken`)
);
--> statement-breakpoint
CREATE TABLE `t3turbo_user` (
	`id` varchar(255) NOT NULL,
	`name` varchar(255),
	`email` varchar(255) NOT NULL,
	`emailVerified` timestamp(3) DEFAULT CURRENT_TIMESTAMP(3),
	`image` varchar(255),
	CONSTRAINT `t3turbo_user_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `t3turbo_verificationToken` (
	`identifier` varchar(255) NOT NULL,
	`token` varchar(255) NOT NULL,
	`expires` timestamp NOT NULL,
	CONSTRAINT `t3turbo_verificationToken_identifier_token_pk` PRIMARY KEY(`identifier`,`token`)
);
--> statement-breakpoint
CREATE TABLE `t3turbo_post` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`name` varchar(256) NOT NULL,
	`content` varchar(256) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` timestamp ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `t3turbo_post_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE INDEX `userId_idx` ON `t3turbo_account` (`userId`);--> statement-breakpoint
CREATE INDEX `userId_idx` ON `t3turbo_session` (`userId`);