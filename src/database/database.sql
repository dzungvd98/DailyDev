USE [master]
GO
/****** Object:  Database [daily_dev]    Script Date: 29/09/2024 10:38:48 CH ******/
CREATE DATABASE [daily_dev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'daily_dev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\daily_dev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'daily_dev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\daily_dev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [daily_dev] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [daily_dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [daily_dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [daily_dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [daily_dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [daily_dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [daily_dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [daily_dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [daily_dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [daily_dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [daily_dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [daily_dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [daily_dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [daily_dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [daily_dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [daily_dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [daily_dev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [daily_dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [daily_dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [daily_dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [daily_dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [daily_dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [daily_dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [daily_dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [daily_dev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [daily_dev] SET  MULTI_USER 
GO
ALTER DATABASE [daily_dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [daily_dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [daily_dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [daily_dev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [daily_dev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [daily_dev] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [daily_dev] SET QUERY_STORE = ON
GO
ALTER DATABASE [daily_dev] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [daily_dev]
GO
/****** Object:  Table [dbo].[Article_Squads]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article_Squads](
	[article_id] [int] NOT NULL,
	[squad_id] [int] NOT NULL,
	[shared_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[article_id] ASC,
	[squad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article_Tags]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article_Tags](
	[article_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[article_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article_Topic]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article_Topic](
	[article_id] [int] NOT NULL,
	[topic_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[article_id] ASC,
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[content] [text] NOT NULL,
	[source_type] [varchar](10) NOT NULL,
	[user_id] [int] NULL,
	[rss_id] [int] NULL,
	[published_at] [datetime] NOT NULL,
	[thumbnail_url] [varchar](255) NULL,
	[link] [varchar](255) NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookmarks]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookmarks](
	[user_id] [int] NOT NULL,
	[article_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[article_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[text] [text] NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reactions]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[article_id] [int] NOT NULL,
	[comment_id] [int] NULL,
	[type] [varchar](10) NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSS_Sources]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSS_Sources](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[source_name] [varchar](255) NOT NULL,
	[rss_url] [varchar](255) NOT NULL,
	[website_url] [varchar](255) NULL,
	[last_fetched_at] [datetime] NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Squad_Members]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Squad_Members](
	[squad_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[role] [varchar](10) NOT NULL,
	[joined_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[squad_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Squads]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Squads](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[followed_tag_id] [int] NULL,
	[followed_user_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic_Tags]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic_Tags](
	[topic_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29/09/2024 10:38:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password_hash] [varchar](255) NOT NULL,
	[profile_picture] [varchar](255) NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Article_Tags] ([article_id], [tag_id]) VALUES (2, 1)
INSERT [dbo].[Article_Tags] ([article_id], [tag_id]) VALUES (2, 10)
INSERT [dbo].[Article_Tags] ([article_id], [tag_id]) VALUES (3, 1)
INSERT [dbo].[Article_Tags] ([article_id], [tag_id]) VALUES (4, 7)
INSERT [dbo].[Article_Tags] ([article_id], [tag_id]) VALUES (5, 11)
INSERT [dbo].[Article_Tags] ([article_id], [tag_id]) VALUES (6, 4)
INSERT [dbo].[Article_Tags] ([article_id], [tag_id]) VALUES (7, 4)
INSERT [dbo].[Article_Tags] ([article_id], [tag_id]) VALUES (8, 5)
INSERT [dbo].[Article_Tags] ([article_id], [tag_id]) VALUES (9, 6)
INSERT [dbo].[Article_Tags] ([article_id], [tag_id]) VALUES (10, 1)
GO
INSERT [dbo].[Article_Topic] ([article_id], [topic_id]) VALUES (2, 1)
INSERT [dbo].[Article_Topic] ([article_id], [topic_id]) VALUES (2, 10)
INSERT [dbo].[Article_Topic] ([article_id], [topic_id]) VALUES (3, 1)
INSERT [dbo].[Article_Topic] ([article_id], [topic_id]) VALUES (4, 9)
INSERT [dbo].[Article_Topic] ([article_id], [topic_id]) VALUES (5, 11)
INSERT [dbo].[Article_Topic] ([article_id], [topic_id]) VALUES (6, 12)
INSERT [dbo].[Article_Topic] ([article_id], [topic_id]) VALUES (7, 4)
INSERT [dbo].[Article_Topic] ([article_id], [topic_id]) VALUES (8, 5)
INSERT [dbo].[Article_Topic] ([article_id], [topic_id]) VALUES (9, 6)
INSERT [dbo].[Article_Topic] ([article_id], [topic_id]) VALUES (10, 1)
GO
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([id], [title], [content], [source_type], [user_id], [rss_id], [published_at], [thumbnail_url], [link], [created_at]) VALUES (2, N'Tech News Today', N'Latest technology news...', N'user', 635, NULL, CAST(N'2024-09-29T08:00:00.000' AS DateTime), N'thumb1.jpg', NULL, CAST(N'2024-09-29T07:00:00.000' AS DateTime))
INSERT [dbo].[Articles] ([id], [title], [content], [source_type], [user_id], [rss_id], [published_at], [thumbnail_url], [link], [created_at]) VALUES (3, N'How to Start a Startup', N'Step by step guide...', N'user', 638, NULL, CAST(N'2024-09-29T09:00:00.000' AS DateTime), N'thumb2.jpg', NULL, CAST(N'2024-09-29T08:30:00.000' AS DateTime))
INSERT [dbo].[Articles] ([id], [title], [content], [source_type], [user_id], [rss_id], [published_at], [thumbnail_url], [link], [created_at]) VALUES (4, N'TechCrunch Update', N'Today’s top stories...', N'rss', NULL, 1, CAST(N'2024-09-29T10:00:00.000' AS DateTime), N'thumb3.jpg', N'https://rss.com/article1', CAST(N'2024-09-29T09:45:00.000' AS DateTime))
INSERT [dbo].[Articles] ([id], [title], [content], [source_type], [user_id], [rss_id], [published_at], [thumbnail_url], [link], [created_at]) VALUES (5, N'Tech Innovations', N'Innovations in tech...', N'rss', NULL, 1, CAST(N'2024-09-29T11:00:00.000' AS DateTime), N'thumb4.jpg', N'https://rss.com/article2', CAST(N'2024-09-29T10:15:00.000' AS DateTime))
INSERT [dbo].[Articles] ([id], [title], [content], [source_type], [user_id], [rss_id], [published_at], [thumbnail_url], [link], [created_at]) VALUES (6, N'Coding Best Practices', N'Improve your coding...', N'user', 639, NULL, CAST(N'2024-09-29T12:00:00.000' AS DateTime), N'thumb5.jpg', NULL, CAST(N'2024-09-29T11:30:00.000' AS DateTime))
INSERT [dbo].[Articles] ([id], [title], [content], [source_type], [user_id], [rss_id], [published_at], [thumbnail_url], [link], [created_at]) VALUES (7, N'AI Revolution', N'The future of AI...', N'rss', NULL, 1, CAST(N'2024-09-29T13:00:00.000' AS DateTime), N'thumb6.jpg', N'https://rss.com/article3', CAST(N'2024-09-29T12:45:00.000' AS DateTime))
INSERT [dbo].[Articles] ([id], [title], [content], [source_type], [user_id], [rss_id], [published_at], [thumbnail_url], [link], [created_at]) VALUES (8, N'Cybersecurity Trends', N'Staying safe online...', N'rss', NULL, 1, CAST(N'2024-09-29T14:00:00.000' AS DateTime), N'thumb7.jpg', N'https://rss.com/article4', CAST(N'2024-09-29T13:30:00.000' AS DateTime))
INSERT [dbo].[Articles] ([id], [title], [content], [source_type], [user_id], [rss_id], [published_at], [thumbnail_url], [link], [created_at]) VALUES (9, N'Guide to Cloud Computing', N'Understanding the cloud...', N'user', 723, NULL, CAST(N'2024-09-29T15:00:00.000' AS DateTime), N'thumb8.jpg', NULL, CAST(N'2024-09-29T14:30:00.000' AS DateTime))
INSERT [dbo].[Articles] ([id], [title], [content], [source_type], [user_id], [rss_id], [published_at], [thumbnail_url], [link], [created_at]) VALUES (10, N'Blockchain Explained', N'The basics of blockchain...', N'user', 750, NULL, CAST(N'2024-09-29T16:00:00.000' AS DateTime), N'thumb9.jpg', NULL, CAST(N'2024-09-29T15:30:00.000' AS DateTime))
INSERT [dbo].[Articles] ([id], [title], [content], [source_type], [user_id], [rss_id], [published_at], [thumbnail_url], [link], [created_at]) VALUES (11, N'TechCrunch Weekly', N'Top news in tech...', N'rss', NULL, 1, CAST(N'2024-09-29T17:00:00.000' AS DateTime), N'thumb10.jpg', N'https://rss.com/article5', CAST(N'2024-09-29T16:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Articles] OFF
GO
INSERT [dbo].[Bookmarks] ([user_id], [article_id], [created_at]) VALUES (618, 6, CAST(N'2024-09-29T20:00:00.000' AS DateTime))
INSERT [dbo].[Bookmarks] ([user_id], [article_id], [created_at]) VALUES (622, 4, CAST(N'2024-09-29T19:00:00.000' AS DateTime))
INSERT [dbo].[Bookmarks] ([user_id], [article_id], [created_at]) VALUES (623, 3, CAST(N'2024-09-29T18:30:00.000' AS DateTime))
INSERT [dbo].[Bookmarks] ([user_id], [article_id], [created_at]) VALUES (638, 5, CAST(N'2024-09-29T19:30:00.000' AS DateTime))
INSERT [dbo].[Bookmarks] ([user_id], [article_id], [created_at]) VALUES (678, 8, CAST(N'2024-09-29T21:00:00.000' AS DateTime))
INSERT [dbo].[Bookmarks] ([user_id], [article_id], [created_at]) VALUES (711, 9, CAST(N'2024-09-29T21:30:00.000' AS DateTime))
INSERT [dbo].[Bookmarks] ([user_id], [article_id], [created_at]) VALUES (733, 10, CAST(N'2024-09-29T22:00:00.000' AS DateTime))
INSERT [dbo].[Bookmarks] ([user_id], [article_id], [created_at]) VALUES (764, 2, CAST(N'2024-09-29T18:00:00.000' AS DateTime))
INSERT [dbo].[Bookmarks] ([user_id], [article_id], [created_at]) VALUES (912, 7, CAST(N'2024-09-29T20:30:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([id], [article_id], [user_id], [text], [created_at]) VALUES (1, 2, 653, N'Great article about tech!', CAST(N'2024-09-29T15:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([id], [article_id], [user_id], [text], [created_at]) VALUES (2, 2, 649, N'Very informative on startups.', CAST(N'2024-09-29T15:30:00.000' AS DateTime))
INSERT [dbo].[Comments] ([id], [article_id], [user_id], [text], [created_at]) VALUES (3, 3, 666, N'Loved the update from TechCrunch.', CAST(N'2024-09-29T16:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([id], [article_id], [user_id], [text], [created_at]) VALUES (4, 4, 723, N'Interesting innovations.', CAST(N'2024-09-29T16:30:00.000' AS DateTime))
INSERT [dbo].[Comments] ([id], [article_id], [user_id], [text], [created_at]) VALUES (5, 5, 745, N'Good practices for coding.', CAST(N'2024-09-29T17:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([id], [article_id], [user_id], [text], [created_at]) VALUES (6, 6, 812, N'The AI future looks promising.', CAST(N'2024-09-29T17:30:00.000' AS DateTime))
INSERT [dbo].[Comments] ([id], [article_id], [user_id], [text], [created_at]) VALUES (7, 7, 699, N'Cybersecurity is crucial.', CAST(N'2024-09-29T18:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([id], [article_id], [user_id], [text], [created_at]) VALUES (8, 8, 703, N'The cloud is growing rapidly.', CAST(N'2024-09-29T18:30:00.000' AS DateTime))
INSERT [dbo].[Comments] ([id], [article_id], [user_id], [text], [created_at]) VALUES (9, 9, 756, N'Blockchain is the future.', CAST(N'2024-09-29T19:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([id], [article_id], [user_id], [text], [created_at]) VALUES (10, 10, 682, N'Great roundup from TechCrunch.', CAST(N'2024-09-29T19:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Reactions] ON 

INSERT [dbo].[Reactions] ([id], [user_id], [article_id], [comment_id], [type], [created_at]) VALUES (1, 653, 3, NULL, N'like', CAST(N'2024-09-29T20:00:00.000' AS DateTime))
INSERT [dbo].[Reactions] ([id], [user_id], [article_id], [comment_id], [type], [created_at]) VALUES (2, 625, 2, NULL, N'upvote', CAST(N'2024-09-29T20:30:00.000' AS DateTime))
INSERT [dbo].[Reactions] ([id], [user_id], [article_id], [comment_id], [type], [created_at]) VALUES (3, 637, 2, NULL, N'clap', CAST(N'2024-09-29T21:00:00.000' AS DateTime))
INSERT [dbo].[Reactions] ([id], [user_id], [article_id], [comment_id], [type], [created_at]) VALUES (4, 728, 2, NULL, N'like', CAST(N'2024-09-29T21:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reactions] OFF
GO
SET IDENTITY_INSERT [dbo].[RSS_Sources] ON 

INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (1, N'monitor', N'https://frivolous-sage.org', N'https://amused-religion.name', CAST(N'2022-01-01T09:09:00.000' AS DateTime), CAST(N'2022-01-01T09:09:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (2, N'pixel', N'http://grubby-cash.org', N'http://esteemed-switching.com', CAST(N'2022-01-01T09:10:00.000' AS DateTime), CAST(N'2022-01-01T09:10:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (3, N'card', N'https://uncomfortable-thickness.net', N'http://scarce-vane.biz', CAST(N'2022-01-01T09:11:00.000' AS DateTime), CAST(N'2022-01-01T09:11:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (4, N'capacitor', N'https://carefree-roof.info', N'https://unhealthy-skull.name', CAST(N'2022-01-01T09:12:00.000' AS DateTime), CAST(N'2022-01-01T09:12:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (5, N'bandwidth', N'http://giddy-insurance.net', N'http://simple-explosion.com', CAST(N'2022-01-01T09:13:00.000' AS DateTime), CAST(N'2022-01-01T09:13:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (6, N'circuit', N'https://sunny-frustration.com', N'https://thorny-bow.org', CAST(N'2022-01-01T09:14:00.000' AS DateTime), CAST(N'2022-01-01T09:14:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (7, N'bandwidth', N'https://soggy-stench.name', N'https://whopping-sunshine.name', CAST(N'2022-01-01T09:15:00.000' AS DateTime), CAST(N'2022-01-01T09:15:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (8, N'transmitter', N'https://yearly-rake.org', N'https://metallic-allergist.net', CAST(N'2022-01-01T09:16:00.000' AS DateTime), CAST(N'2022-01-01T09:16:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (9, N'bus', N'http://strident-address.name', N'http://jovial-circuit.org', CAST(N'2022-01-01T09:17:00.000' AS DateTime), CAST(N'2022-01-01T09:17:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (10, N'transmitter', N'https://velvety-monster.com', N'https://trusty-composite.com', CAST(N'2022-01-01T09:18:00.000' AS DateTime), CAST(N'2022-01-01T09:18:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (11, N'card', N'https://fruitful-water.net', N'http://rectangular-glass.biz', CAST(N'2022-01-01T09:19:00.000' AS DateTime), CAST(N'2022-01-01T09:19:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (12, N'panel', N'http://worried-taxicab.org', N'http://livid-parliament.biz', CAST(N'2022-01-01T09:20:00.000' AS DateTime), CAST(N'2022-01-01T09:20:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (13, N'monitor', N'https://grotesque-bird-watcher.name', N'https://neglected-conference.org', CAST(N'2022-01-01T09:21:00.000' AS DateTime), CAST(N'2022-01-01T09:21:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (14, N'system', N'https://stale-morbidity.info', N'https://colorless-bidet.biz', CAST(N'2022-01-01T09:22:00.000' AS DateTime), CAST(N'2022-01-01T09:22:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (15, N'transmitter', N'http://yearly-assassination.info', N'https://yellowish-rowing.biz', CAST(N'2022-01-01T09:23:00.000' AS DateTime), CAST(N'2022-01-01T09:23:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (16, N'alarm', N'http://well-off-stopsign.com', N'https://snappy-standpoint.net', CAST(N'2022-01-01T09:24:00.000' AS DateTime), CAST(N'2022-01-01T09:24:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (17, N'system', N'http://safe-comportment.net', N'http://warped-copper.biz', CAST(N'2022-01-01T09:25:00.000' AS DateTime), CAST(N'2022-01-01T09:25:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (18, N'application', N'http://trustworthy-gray.info', N'http://accurate-search.org', CAST(N'2022-01-01T09:26:00.000' AS DateTime), CAST(N'2022-01-01T09:26:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (19, N'driver', N'https://flippant-noise.com', N'https://impeccable-stir-fry.info', CAST(N'2022-01-01T09:27:00.000' AS DateTime), CAST(N'2022-01-01T09:27:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (20, N'system', N'https://rosy-credential.net', N'http://overlooked-memo.net', CAST(N'2022-01-01T09:28:00.000' AS DateTime), CAST(N'2022-01-01T09:28:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (21, N'program', N'http://minty-mud.com', N'https://giving-phrasing.name', CAST(N'2022-01-01T09:29:00.000' AS DateTime), CAST(N'2022-01-01T09:29:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (22, N'protocol', N'http://amazing-goodie.biz', N'https://shiny-dollar.info', CAST(N'2022-01-01T09:30:00.000' AS DateTime), CAST(N'2022-01-01T09:30:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (23, N'panel', N'http://cumbersome-mushroom.name', N'https://united-somersault.biz', CAST(N'2022-01-01T09:31:00.000' AS DateTime), CAST(N'2022-01-01T09:31:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (24, N'capacitor', N'https://junior-diagram.name', N'https://failing-laborer.com', CAST(N'2022-01-01T09:32:00.000' AS DateTime), CAST(N'2022-01-01T09:32:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (25, N'transmitter', N'http://formal-sleep.info', N'https://humming-channel.info', CAST(N'2022-01-01T09:33:00.000' AS DateTime), CAST(N'2022-01-01T09:33:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (26, N'circuit', N'https://untrue-bathroom.name', N'http://powerful-ephemera.info', CAST(N'2022-01-01T09:34:00.000' AS DateTime), CAST(N'2022-01-01T09:34:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (27, N'circuit', N'https://elaborate-dead.biz', N'http://graceful-president.biz', CAST(N'2022-01-01T09:35:00.000' AS DateTime), CAST(N'2022-01-01T09:35:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (28, N'application', N'https://courteous-parade.com', N'https://athletic-catcher.com', CAST(N'2022-01-01T09:36:00.000' AS DateTime), CAST(N'2022-01-01T09:36:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (29, N'driver', N'https://even-dude.com', N'https://definite-samurai.com', CAST(N'2022-01-01T09:37:00.000' AS DateTime), CAST(N'2022-01-01T09:37:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (30, N'capacitor', N'https://rural-trance.org', N'http://tempting-pardon.com', CAST(N'2022-01-01T09:38:00.000' AS DateTime), CAST(N'2022-01-01T09:38:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (31, N'circuit', N'https://old-concentrate.biz', N'http://delicious-theology.name', CAST(N'2022-01-01T09:39:00.000' AS DateTime), CAST(N'2022-01-01T09:39:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (32, N'circuit', N'https://unlucky-civilization.org', N'https://live-messenger.info', CAST(N'2022-01-01T09:40:00.000' AS DateTime), CAST(N'2022-01-01T09:40:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (33, N'pixel', N'https://prickly-thief.com', N'http://superior-sea.biz', CAST(N'2022-01-01T09:41:00.000' AS DateTime), CAST(N'2022-01-01T09:41:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (34, N'sensor', N'http://dead-settler.biz', N'http://weary-spandex.biz', CAST(N'2022-01-01T09:42:00.000' AS DateTime), CAST(N'2022-01-01T09:42:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (35, N'panel', N'https://hasty-quill.info', N'https://coordinated-volume.com', CAST(N'2022-01-01T09:43:00.000' AS DateTime), CAST(N'2022-01-01T09:43:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (36, N'matrix', N'http://scary-stuff.name', N'https://lined-tomorrow.net', CAST(N'2022-01-01T09:44:00.000' AS DateTime), CAST(N'2022-01-01T09:44:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (37, N'card', N'http://slimy-estimate.name', N'https://illiterate-crisis.info', CAST(N'2022-01-01T09:45:00.000' AS DateTime), CAST(N'2022-01-01T09:45:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (38, N'transmitter', N'https://hearty-mansard.name', N'http://grandiose-isolation.net', CAST(N'2022-01-01T09:46:00.000' AS DateTime), CAST(N'2022-01-01T09:46:00.000' AS DateTime))
INSERT [dbo].[RSS_Sources] ([id], [source_name], [rss_url], [website_url], [last_fetched_at], [created_at]) VALUES (39, N'bandwidth', N'http://immaterial-dairy.biz', N'https://slim-corral.com', CAST(N'2022-01-01T09:47:00.000' AS DateTime), CAST(N'2022-01-01T09:47:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[RSS_Sources] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([id], [name]) VALUES (631, N'AI')
INSERT [dbo].[Tags] ([id], [name]) VALUES (2, N'backing up')
INSERT [dbo].[Tags] ([id], [name]) VALUES (634, N'Blockchain')
INSERT [dbo].[Tags] ([id], [name]) VALUES (630, N'Business')
INSERT [dbo].[Tags] ([id], [name]) VALUES (1, N'bypassing')
INSERT [dbo].[Tags] ([id], [name]) VALUES (26, N'calculating')
INSERT [dbo].[Tags] ([id], [name]) VALUES (633, N'Cloud Computing')
INSERT [dbo].[Tags] ([id], [name]) VALUES (14, N'compressing')
INSERT [dbo].[Tags] ([id], [name]) VALUES (11, N'connecting')
INSERT [dbo].[Tags] ([id], [name]) VALUES (18, N'copying')
INSERT [dbo].[Tags] ([id], [name]) VALUES (632, N'Cybersecurity')
INSERT [dbo].[Tags] ([id], [name]) VALUES (6, N'generating')
INSERT [dbo].[Tags] ([id], [name]) VALUES (24, N'hacking')
INSERT [dbo].[Tags] ([id], [name]) VALUES (12, N'indexing')
INSERT [dbo].[Tags] ([id], [name]) VALUES (635, N'Innovation')
INSERT [dbo].[Tags] ([id], [name]) VALUES (637, N'Machine Learning')
INSERT [dbo].[Tags] ([id], [name]) VALUES (7, N'navigating')
INSERT [dbo].[Tags] ([id], [name]) VALUES (33, N'overriding')
INSERT [dbo].[Tags] ([id], [name]) VALUES (10, N'parsing')
INSERT [dbo].[Tags] ([id], [name]) VALUES (23, N'programming')
INSERT [dbo].[Tags] ([id], [name]) VALUES (13, N'quantifying')
INSERT [dbo].[Tags] ([id], [name]) VALUES (636, N'Startup')
INSERT [dbo].[Tags] ([id], [name]) VALUES (5, N'synthesizing')
INSERT [dbo].[Tags] ([id], [name]) VALUES (629, N'Tech')
INSERT [dbo].[Tags] ([id], [name]) VALUES (4, N'transmitting')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (1, N'driver', N'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (2, N'hard drive', N'The Football Is Good For Training And Recreational Purposes')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (3, N'matrix', N'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (4, N'card', N'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (5, N'system', N'The Football Is Good For Training And Recreational Purposes')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (6, N'monitor', N'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (9, N'feed', N'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (10, N'transmitter', N'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (11, N'bus', N'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (12, N'circuit', N'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (14, N'interface', N'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (17, N'array', N'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (19, N'capacitor', N'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (21, N'firewall', N'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients')
INSERT [dbo].[Topic] ([id], [name], [description]) VALUES (25, N'port', N'The Football Is Good For Training And Recreational Purposes')
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
INSERT [dbo].[Topic_Tags] ([topic_id], [tag_id]) VALUES (1, 1)
INSERT [dbo].[Topic_Tags] ([topic_id], [tag_id]) VALUES (2, 2)
INSERT [dbo].[Topic_Tags] ([topic_id], [tag_id]) VALUES (3, 4)
INSERT [dbo].[Topic_Tags] ([topic_id], [tag_id]) VALUES (4, 4)
INSERT [dbo].[Topic_Tags] ([topic_id], [tag_id]) VALUES (5, 5)
INSERT [dbo].[Topic_Tags] ([topic_id], [tag_id]) VALUES (6, 6)
INSERT [dbo].[Topic_Tags] ([topic_id], [tag_id]) VALUES (6, 11)
INSERT [dbo].[Topic_Tags] ([topic_id], [tag_id]) VALUES (9, 7)
INSERT [dbo].[Topic_Tags] ([topic_id], [tag_id]) VALUES (9, 10)
INSERT [dbo].[Topic_Tags] ([topic_id], [tag_id]) VALUES (10, 10)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (501, N'Jewel_Jones74', N'Dante17@hotmail.com', N'b5A9Q7602fkWI1t', N'https://loremflickr.com/640/480', CAST(N'2023-07-06T03:11:02.360' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (502, N'Cesar_Fadel19', N'Marcia.Rogahn@hotmail.com', N'eUwRoP8ghkjNIN4', N'https://loremflickr.com/640/480', CAST(N'2023-06-20T21:29:25.560' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (503, N'Don.Considine', N'Alfreda91@yahoo.com', N'BFcLsDquZUc5OO4', N'https://loremflickr.com/640/480', CAST(N'2023-01-28T11:34:47.560' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (504, N'Drake4', N'Ludie43@gmail.com', N'SFnmzb53UFS5CNU', N'https://loremflickr.com/640/480', CAST(N'2023-05-20T22:43:09.817' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (505, N'Rudolph_Carroll', N'Caesar38@gmail.com', N'9NesCKoKyawOIXE', N'https://loremflickr.com/640/480', CAST(N'2022-04-15T13:35:28.327' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (506, N'Luciano_King85', N'Leda_Mertz@hotmail.com', N'vJlJhzyXXmHORdf', N'https://loremflickr.com/640/480', CAST(N'2023-01-06T23:32:55.133' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (507, N'Noemy_Funk25', N'Kristopher_Lynch95@hotmail.com', N'vFgCievwvAe2U3l', N'https://loremflickr.com/640/480', CAST(N'2022-11-17T00:31:04.460' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (508, N'Joana_Stanton99', N'Norene.Bosco1@yahoo.com', N'UZKE3poXPj9DKyH', N'https://loremflickr.com/640/480', CAST(N'2023-09-21T02:40:19.043' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (509, N'Forest.Thompson10', N'Bryana.Hyatt24@gmail.com', N'F3bv6e0qfRkjvmQ', N'https://loremflickr.com/640/480', CAST(N'2022-02-01T23:30:19.663' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (510, N'Isaac_Kemmer', N'Dallin.Aufderhar57@hotmail.com', N'kblVX1ah1_IvlOj', N'https://loremflickr.com/640/480', CAST(N'2022-04-03T02:55:34.060' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (511, N'Chandler.Harber', N'Monte_Balistreri@yahoo.com', N'tGhmFQqgOefZT9e', N'https://loremflickr.com/640/480', CAST(N'2023-08-17T19:29:10.950' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (512, N'Elmira.Kshlerin', N'Hal75@hotmail.com', N'h6vJCUcGMzhovM8', N'https://loremflickr.com/640/480', CAST(N'2023-05-21T11:13:01.420' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (513, N'Gaston_Johnston97', N'Brandi_Berge27@yahoo.com', N'oSjdHYqohdIUdY2', N'https://loremflickr.com/640/480', CAST(N'2023-10-01T05:37:55.687' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (514, N'Demond.Bode', N'Manuela_Rempel@gmail.com', N'fxyxZMHQ4czoav9', N'https://loremflickr.com/640/480', CAST(N'2022-08-25T17:20:14.787' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (515, N'Presley.Ratke65', N'Orlando4@gmail.com', N'FKnqKw9sEa2KFQG', N'https://loremflickr.com/640/480', CAST(N'2022-01-21T04:14:10.660' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (516, N'Porter_Sporer', N'Lacey.Rau67@hotmail.com', N't9ISB9R2iNIPUEC', N'https://loremflickr.com/640/480', CAST(N'2023-01-15T06:29:26.173' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (517, N'Reuben_Reilly90', N'Rebeka_Rolfson@hotmail.com', N'9Bu5xNM50pvJSlg', N'https://loremflickr.com/640/480', CAST(N'2023-01-08T07:30:11.760' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (518, N'Shirley61', N'Devan.Johns@gmail.com', N'9tiarbKqo1xGyCx', N'https://loremflickr.com/640/480', CAST(N'2023-09-14T14:37:07.570' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (519, N'Lelah.Welch', N'Donato_Goyette@yahoo.com', N'r_vAAim_kAnf5Wj', N'https://loremflickr.com/640/480', CAST(N'2022-02-19T22:00:17.557' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (520, N'Angie_Tremblay', N'Joshuah.Rosenbaum57@yahoo.com', N'efhcHt0HipRez5z', N'https://loremflickr.com/640/480', CAST(N'2022-06-15T06:25:40.237' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (521, N'Howard29', N'Clare_Morissette@gmail.com', N'frJIacXFYR2j8Qm', N'https://loremflickr.com/640/480', CAST(N'2022-02-09T07:09:48.110' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (522, N'Easter25', N'Vernon88@gmail.com', N'zw9BgWXoS6Uwe5x', N'https://loremflickr.com/640/480', CAST(N'2023-10-27T13:32:06.487' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (523, N'Reilly67', N'Jena.Moore55@hotmail.com', N'kOjc_eJRs3SQXky', N'https://loremflickr.com/640/480', CAST(N'2023-05-06T15:44:42.970' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (524, N'Kristoffer_Okuneva', N'Berniece58@hotmail.com', N'F23jUEkCKYDsnSF', N'https://loremflickr.com/640/480', CAST(N'2023-06-28T13:56:14.423' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (525, N'Jeanne_Runolfsson', N'Murl60@hotmail.com', N'QiDqDMNXJGRq_in', N'https://loremflickr.com/640/480', CAST(N'2022-03-11T20:52:59.260' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (526, N'Rashad87', N'Elmira.Buckridge@hotmail.com', N'HcppodlHCShZeIr', N'https://loremflickr.com/640/480', CAST(N'2022-09-30T11:25:14.787' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (527, N'Ottilie28', N'Leta_Buckridge44@yahoo.com', N'XBlGq7DJAVf3nN8', N'https://loremflickr.com/640/480', CAST(N'2022-02-06T06:35:22.247' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (528, N'Josephine_Ruecker30', N'Janice.Harris33@hotmail.com', N'6eC34wIBnZzWzJU', N'https://loremflickr.com/640/480', CAST(N'2023-01-08T10:25:04.057' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (529, N'Rylee29', N'Evelyn76@yahoo.com', N'pZoQ9MMko_dYhSY', N'https://loremflickr.com/640/480', CAST(N'2023-02-13T13:23:08.453' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (530, N'Jadon72', N'Alvis_Ruecker32@hotmail.com', N'yHZFudSgnMh6Ls0', N'https://loremflickr.com/640/480', CAST(N'2023-01-12T12:10:49.787' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (531, N'Aniya_Strosin86', N'Giles13@gmail.com', N'qVZSKuY0YU0i3Pz', N'https://loremflickr.com/640/480', CAST(N'2022-06-04T05:27:43.807' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (532, N'Gracie_Ondricka', N'Rosemary.Pfeffer@gmail.com', N'VkRwVxKsrxQJaLU', N'https://loremflickr.com/640/480', CAST(N'2023-02-01T19:22:44.737' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (533, N'Marcia.Raynor86', N'Collin76@hotmail.com', N'SInpXl6zDy2q__H', N'https://loremflickr.com/640/480', CAST(N'2022-03-24T16:49:49.120' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (534, N'Arnulfo72', N'Sarai.Green56@yahoo.com', N'x7Lt7dDKB7sz7n6', N'https://loremflickr.com/640/480', CAST(N'2022-09-23T14:42:22.160' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (535, N'Candido27', N'Willard_Strosin@gmail.com', N'Tqlvp7OoOhXVhpM', N'https://loremflickr.com/640/480', CAST(N'2023-02-17T07:11:35.167' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (536, N'Lennie50', N'Jarrell19@hotmail.com', N'fBDun6WBMmC3dnh', N'https://loremflickr.com/640/480', CAST(N'2022-03-27T20:25:28.547' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (537, N'Berry32', N'Marlene98@yahoo.com', N'di5_Ha_9FbXHpTk', N'https://loremflickr.com/640/480', CAST(N'2023-08-04T16:22:39.073' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (538, N'Mina_Kihn97', N'Helene.Hagenes89@yahoo.com', N'JU4Hns3G4ymAzrg', N'https://loremflickr.com/640/480', CAST(N'2023-12-11T11:18:23.787' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (539, N'Glenna96', N'Eden.Kulas25@gmail.com', N'vW3dpszQZ8LpPdh', N'https://loremflickr.com/640/480', CAST(N'2023-02-09T15:25:17.480' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (540, N'Mohamed64', N'Dominic.Jerde53@yahoo.com', N'mquowOOHHnKOcsl', N'https://loremflickr.com/640/480', CAST(N'2022-10-03T06:50:42.467' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (541, N'Marc.Walter51', N'Alfreda_Gerlach@hotmail.com', N'9lD3_1dPsz6ZyuM', N'https://loremflickr.com/640/480', CAST(N'2023-09-06T11:51:57.360' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (542, N'Sabina32', N'Jillian.Funk78@hotmail.com', N'ehN4ZEdfqAdKemY', N'https://loremflickr.com/640/480', CAST(N'2022-03-21T05:01:23.593' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (543, N'Juana.Welch', N'Alberta_Crist89@yahoo.com', N'wGba_FiSTwK0e0J', N'https://loremflickr.com/640/480', CAST(N'2022-09-01T23:25:06.757' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (544, N'Margaretta.Donnelly13', N'Christy.Zemlak@yahoo.com', N'fl1PaT6zVI7Dd8L', N'https://loremflickr.com/640/480', CAST(N'2023-07-03T13:22:47.350' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (545, N'Doug_OConner33', N'Ubaldo_Sporer@gmail.com', N'XuCXNd0LFdE1qfi', N'https://loremflickr.com/640/480', CAST(N'2022-06-15T13:39:58.320' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (546, N'Kristin92', N'Burnice_Hansen59@yahoo.com', N'Z7jfAgq6EqcPBiO', N'https://loremflickr.com/640/480', CAST(N'2022-05-06T08:51:44.663' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (547, N'Daphney_VonRueden55', N'Holden_Schroeder@hotmail.com', N'Jr9ntcWuqVgebT1', N'https://loremflickr.com/640/480', CAST(N'2023-01-22T03:26:55.147' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (548, N'Deontae_Lehner', N'German_Predovic86@gmail.com', N'7fN2gRVbYTAkjlt', N'https://loremflickr.com/640/480', CAST(N'2023-12-07T03:16:17.783' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (549, N'Kennedy.Smitham52', N'Olin_Stokes42@hotmail.com', N'q6Xj0l4o7oVHupp', N'https://loremflickr.com/640/480', CAST(N'2023-05-18T17:41:49.097' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (550, N'Candida.Bode', N'Hank71@yahoo.com', N'xabWCGS0KP806Hv', N'https://loremflickr.com/640/480', CAST(N'2022-08-13T02:56:54.853' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (551, N'Georgette_Runolfsson98', N'Myah.Shields@yahoo.com', N'ohKpiyNrzQFn4pC', N'https://loremflickr.com/640/480', CAST(N'2022-06-13T14:21:51.963' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (552, N'Seth.Langworth', N'Clifton.Spencer89@yahoo.com', N'qHjQSIIaUL8a_Rh', N'https://loremflickr.com/640/480', CAST(N'2023-05-21T07:32:50.120' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (553, N'Jonathan.Maggio', N'Preston_Leannon11@gmail.com', N'rxGNt8fnYbCqprv', N'https://loremflickr.com/640/480', CAST(N'2023-04-05T02:18:11.917' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (554, N'Arvilla2', N'Mitchel73@hotmail.com', N'OEE3JWuGtPQp8CP', N'https://loremflickr.com/640/480', CAST(N'2023-08-15T02:58:13.803' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (555, N'Vilma_Becker69', N'Godfrey.Crona@yahoo.com', N'Ao1roU32E4WMVIA', N'https://loremflickr.com/640/480', CAST(N'2022-11-17T03:42:02.577' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (556, N'Peggie25', N'Elsie36@hotmail.com', N'PqWOH0fVDZLCXxx', N'https://loremflickr.com/640/480', CAST(N'2022-10-10T15:17:07.350' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (557, N'Blaze_Durgan', N'Idella32@yahoo.com', N'uiMOj1VLSA7ATFN', N'https://loremflickr.com/640/480', CAST(N'2022-04-12T17:11:46.563' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (558, N'Shea46', N'Nestor.Rowe@hotmail.com', N'O8VSdkfwZwIwG_l', N'https://loremflickr.com/640/480', CAST(N'2022-05-29T18:53:46.920' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (559, N'Brendon30', N'Anya71@hotmail.com', N'YRacNUUMrzFXt0c', N'https://loremflickr.com/640/480', CAST(N'2022-02-18T22:14:23.740' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (560, N'Tamara.Anderson', N'Chet.Rempel98@gmail.com', N'Wsz_DwUaYgfALFN', N'https://loremflickr.com/640/480', CAST(N'2023-05-13T03:07:15.057' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (561, N'Keagan97', N'Yesenia.McGlynn30@yahoo.com', N'wjGHzQvKyWbFM92', N'https://loremflickr.com/640/480', CAST(N'2023-12-01T19:24:33.160' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (562, N'Stanley.Hoppe39', N'Everette43@yahoo.com', N'b9R34Ot6T76GlfD', N'https://loremflickr.com/640/480', CAST(N'2022-01-02T04:13:42.053' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (563, N'Sheila_Rohan19', N'Randal6@yahoo.com', N'vENOPWwqd8AvVe4', N'https://loremflickr.com/640/480', CAST(N'2022-01-17T12:37:59.183' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (564, N'Ken_Rosenbaum58', N'Peyton32@gmail.com', N'Wt1z3cpKzMxInuC', N'https://loremflickr.com/640/480', CAST(N'2022-07-01T02:35:06.857' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (565, N'August98', N'Thad.Lakin@gmail.com', N'O_giDfizk2eJsA_', N'https://loremflickr.com/640/480', CAST(N'2022-04-29T06:20:27.953' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (566, N'Tara.Johnston', N'Skyla71@yahoo.com', N'IZwzVAgbDM_c6Vj', N'https://loremflickr.com/640/480', CAST(N'2023-12-04T10:53:39.310' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (567, N'Nikita_Wuckert36', N'Natasha.Russel@yahoo.com', N'UATC27HJIEfN7dn', N'https://loremflickr.com/640/480', CAST(N'2023-04-03T22:41:15.940' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (568, N'Tess26', N'Arielle.Kautzer@yahoo.com', N'l8FqvekLRIsNhny', N'https://loremflickr.com/640/480', CAST(N'2022-08-28T23:41:20.147' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (569, N'Johnnie.Kessler', N'Salvatore_Torp@yahoo.com', N'3lsbAiQGkbvauuw', N'https://loremflickr.com/640/480', CAST(N'2022-11-15T02:05:14.663' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (570, N'Damian_Thiel', N'Forrest60@gmail.com', N'SlXPOgVPTBLwTMQ', N'https://loremflickr.com/640/480', CAST(N'2022-07-31T03:29:28.910' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (571, N'Sabrina_Pacocha', N'Dillan26@yahoo.com', N'sDLJ_LS51lgAdn_', N'https://loremflickr.com/640/480', CAST(N'2023-10-21T05:23:43.247' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (572, N'Shad_Rolfson68', N'Roslyn.Towne12@yahoo.com', N'FUoAwq0fJP9J1ZI', N'https://loremflickr.com/640/480', CAST(N'2023-08-05T18:38:06.833' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (573, N'Itzel_Hartmann', N'Joey12@yahoo.com', N'M552GgevnqxenqN', N'https://loremflickr.com/640/480', CAST(N'2023-10-23T01:54:02.063' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (574, N'Noble.Osinski', N'Aubree_Funk36@hotmail.com', N'Bba8Qt3dEPR17m8', N'https://loremflickr.com/640/480', CAST(N'2023-08-21T06:18:52.570' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (575, N'Price_Hilll16', N'Freeda.Heidenreich64@hotmail.com', N'6QDnGfOl6gWw0K2', N'https://loremflickr.com/640/480', CAST(N'2023-11-09T18:23:42.410' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (576, N'Keaton83', N'Jacynthe_Goodwin@yahoo.com', N'2k9LRT0hC4hF0Ok', N'https://loremflickr.com/640/480', CAST(N'2022-05-06T20:54:04.547' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (577, N'Brisa28', N'Camden_Abbott@hotmail.com', N'o57guBjQXgSf7G7', N'https://loremflickr.com/640/480', CAST(N'2023-12-06T21:50:09.467' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (578, N'Declan_Wuckert', N'Verda88@hotmail.com', N'ACRYzU0R_CPMsjS', N'https://loremflickr.com/640/480', CAST(N'2022-10-19T08:15:49.493' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (579, N'Immanuel_VonRueden58', N'Savanna47@gmail.com', N'AZ3IJ_HnckC3_Ky', N'https://loremflickr.com/640/480', CAST(N'2022-02-15T20:10:58.303' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (580, N'Leonard_Torp88', N'Watson.Haley5@gmail.com', N'AuvqNAyB0V5JVBP', N'https://loremflickr.com/640/480', CAST(N'2022-12-20T21:32:12.377' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (581, N'Sadie_Williamson', N'Hellen42@yahoo.com', N'EyP5OciDcs4JVtY', N'https://loremflickr.com/640/480', CAST(N'2023-06-02T01:08:14.990' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (582, N'Jevon.Bergnaum', N'Kiera_Sipes22@yahoo.com', N'g4bVv_xXCjlCNYe', N'https://loremflickr.com/640/480', CAST(N'2022-03-11T12:26:40.073' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (583, N'Andrew.Gutkowski', N'Rhianna.Kilback@gmail.com', N'f8kqI30D3sppfwM', N'https://loremflickr.com/640/480', CAST(N'2023-01-15T02:22:22.347' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (584, N'Oma.Schoen24', N'Torrey_Bode@yahoo.com', N'KFDxG428QQtzIMz', N'https://loremflickr.com/640/480', CAST(N'2022-09-28T14:01:31.920' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (585, N'Harrison.Medhurst81', N'Vivienne_Paucek3@gmail.com', N'tCzkEm3VTn7Sh_b', N'https://loremflickr.com/640/480', CAST(N'2022-05-15T00:16:47.200' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (586, N'Gloria34', N'Gaetano.Fritsch25@yahoo.com', N'nic3U0Dm7UIBemn', N'https://loremflickr.com/640/480', CAST(N'2022-04-30T17:10:25.573' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (587, N'Sigurd36', N'Sibyl_Roob69@gmail.com', N'jmdgoX2Cpoi0QV0', N'https://loremflickr.com/640/480', CAST(N'2023-02-07T10:28:50.640' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (588, N'Dorothy_Torphy26', N'Mortimer_Effertz@yahoo.com', N'RzGvzLImgTF94Ab', N'https://loremflickr.com/640/480', CAST(N'2023-11-12T23:14:20.410' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (589, N'Elva_Schneider70', N'Euna.Rogahn46@hotmail.com', N'dEf1xmU0w27A9v7', N'https://loremflickr.com/640/480', CAST(N'2023-11-30T01:56:28.913' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (590, N'Jennyfer.Hickle', N'Judson.Hermann@hotmail.com', N'ZsWAcEfE_DWVq8J', N'https://loremflickr.com/640/480', CAST(N'2022-10-16T01:18:10.987' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (591, N'Magali_Fadel56', N'Santina33@gmail.com', N'cfmIWAG3TRG3EmW', N'https://loremflickr.com/640/480', CAST(N'2022-04-09T12:59:50.780' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (592, N'Petra.Harvey52', N'Emmanuelle.Bradtke26@yahoo.com', N'Z1Yd2Ve6qLfOQ1a', N'https://loremflickr.com/640/480', CAST(N'2022-04-23T16:13:45.267' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (593, N'Carlotta_Ziemann', N'Wanda_Carroll@gmail.com', N'UPgyGTDtS3DcCeI', N'https://loremflickr.com/640/480', CAST(N'2023-08-14T23:08:48.657' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (594, N'Eldred.Moore28', N'Karlee_Nolan@hotmail.com', N'lbdI2eq6CPmDGoJ', N'https://loremflickr.com/640/480', CAST(N'2022-12-20T13:32:25.627' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (595, N'Craig.Runolfsdottir', N'Michael59@yahoo.com', N'6lNuNHxbRNbUf8p', N'https://loremflickr.com/640/480', CAST(N'2023-03-06T13:51:03.837' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (596, N'Lisette89', N'Abel_Nienow@yahoo.com', N'qTk7JcxC34z0oT9', N'https://loremflickr.com/640/480', CAST(N'2022-05-13T00:10:27.970' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (597, N'Julie.Carter50', N'Cali22@hotmail.com', N'TbhsT4pCA1SN89n', N'https://loremflickr.com/640/480', CAST(N'2023-11-20T05:55:10.043' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (598, N'Ryley.Cremin18', N'Ara.Stoltenberg86@gmail.com', N'nk0G6HN6yOtbd1f', N'https://loremflickr.com/640/480', CAST(N'2022-11-24T12:19:59.483' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (599, N'Paul1', N'Neil_Kling15@gmail.com', N'GTozpxJ649shrNU', N'https://loremflickr.com/640/480', CAST(N'2022-03-21T17:08:35.433' AS DateTime))
GO
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (600, N'Dorcas40', N'Ken75@hotmail.com', N'dEoo2KJ53bXDzSZ', N'https://loremflickr.com/640/480', CAST(N'2023-06-13T14:00:06.810' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (601, N'Constance_Mohr', N'Deja_Krajcik3@hotmail.com', N'rkfTdjpb4VmNJgj', N'https://loremflickr.com/640/480', CAST(N'2022-03-21T20:09:47.660' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (602, N'Amina40', N'Laurel37@gmail.com', N'Djl4ymRbpq54td_', N'https://loremflickr.com/640/480', CAST(N'2023-07-28T07:36:19.130' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (603, N'Carolyne27', N'Noemy_Nicolas72@gmail.com', N'nj24UT2lFeUaX5R', N'https://loremflickr.com/640/480', CAST(N'2023-03-04T21:53:46.907' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (604, N'Serena_Corkery72', N'Guy.McCullough@hotmail.com', N'fJTVZHqPaM15qzG', N'https://loremflickr.com/640/480', CAST(N'2023-09-08T20:36:13.763' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (605, N'Jettie_Connelly', N'Marion.Ziemann43@gmail.com', N'0Sbfml7yleuuBaV', N'https://loremflickr.com/640/480', CAST(N'2022-04-11T11:14:59.763' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (606, N'Merlin25', N'Bradley_Nienow15@hotmail.com', N'A1LRNSFHMSDjSoM', N'https://loremflickr.com/640/480', CAST(N'2022-09-21T16:14:08.260' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (607, N'Jovani_Volkman46', N'Sasha69@yahoo.com', N'FjVnHvN6CP75Upw', N'https://loremflickr.com/640/480', CAST(N'2022-10-11T12:13:12.607' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (608, N'Maida.Feil3', N'Melyna77@gmail.com', N'6vyJ4xCvbYnKfLI', N'https://loremflickr.com/640/480', CAST(N'2023-06-25T01:16:45.483' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (609, N'Marquise_Mraz24', N'Tianna21@hotmail.com', N'13HPyuy1roXUV4p', N'https://loremflickr.com/640/480', CAST(N'2023-02-12T23:20:37.073' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (610, N'Emmett89', N'Cyril72@yahoo.com', N'eKttj70uNzKdDyR', N'https://loremflickr.com/640/480', CAST(N'2023-09-18T07:20:49.563' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (611, N'Estelle_Hickle98', N'Jesse.Macejkovic@gmail.com', N'sQOGogfTelurwGI', N'https://loremflickr.com/640/480', CAST(N'2022-12-02T20:07:26.460' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (612, N'Wilber36', N'Vance83@yahoo.com', N'q2B3Xp5lBpX9uye', N'https://loremflickr.com/640/480', CAST(N'2022-06-21T01:24:48.730' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (613, N'Kathlyn.Balistreri', N'Jonatan.Schoen@gmail.com', N'J63ptUVV_zJivnl', N'https://loremflickr.com/640/480', CAST(N'2023-04-04T00:48:46.713' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (614, N'Dannie_Sporer', N'Isaiah.Welch3@yahoo.com', N'N85gtFQtuOna9aq', N'https://loremflickr.com/640/480', CAST(N'2023-05-15T13:32:07.370' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (615, N'Grant.Johns', N'Norberto71@hotmail.com', N'AoxJhtE8I4rQtbQ', N'https://loremflickr.com/640/480', CAST(N'2023-08-13T16:43:30.220' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (616, N'Araceli90', N'Teresa_Funk@yahoo.com', N'Kwsc2AmSjre_ye2', N'https://loremflickr.com/640/480', CAST(N'2022-07-31T11:23:58.727' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (617, N'Gerald13', N'Magdalen8@yahoo.com', N'Dbu6IYwqB_oRzHK', N'https://loremflickr.com/640/480', CAST(N'2023-04-17T11:22:36.790' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (618, N'Cedrick.Kling', N'Nicola_Jakubowski@gmail.com', N'bgtLSRn2X9FMglg', N'https://loremflickr.com/640/480', CAST(N'2023-03-03T14:35:21.657' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (619, N'Anastasia79', N'Dario_Schneider@yahoo.com', N'KfVCPsNOv1gg2wA', N'https://loremflickr.com/640/480', CAST(N'2023-04-01T15:39:34.783' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (620, N'Rollin_Kovacek', N'Esmeralda.Medhurst@gmail.com', N'ap21ylIuxLNe1PF', N'https://loremflickr.com/640/480', CAST(N'2023-08-06T14:20:53.303' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (621, N'Tamia28', N'Joe_Lebsack@gmail.com', N'baMTyTvkk0quII8', N'https://loremflickr.com/640/480', CAST(N'2022-09-03T00:51:22.400' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (622, N'Luna_Pfannerstill37', N'Stanton89@gmail.com', N'PDVmchNy5etRrSg', N'https://loremflickr.com/640/480', CAST(N'2022-01-08T12:45:22.080' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (623, N'Kim95', N'Jacynthe_Lind21@hotmail.com', N'QoXJ5ZzOxUGYDwo', N'https://loremflickr.com/640/480', CAST(N'2022-09-03T23:39:45.780' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (624, N'Dangelo_Wyman19', N'Catharine.Stark@yahoo.com', N'dN6MAGMFjP9poG1', N'https://loremflickr.com/640/480', CAST(N'2022-08-27T20:02:34.240' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (625, N'Candelario.Corwin', N'Mckenna.Koelpin@hotmail.com', N'AZhwg4xFvwl8OjH', N'https://loremflickr.com/640/480', CAST(N'2022-05-04T03:56:27.077' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (626, N'Grover_Beier', N'Norene40@gmail.com', N'b7zYF6358o6Azt8', N'https://loremflickr.com/640/480', CAST(N'2022-01-07T06:35:01.077' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (627, N'Dillan_Oberbrunner93', N'Cassandra18@yahoo.com', N'Fm6qQ0WpnMiiW5x', N'https://loremflickr.com/640/480', CAST(N'2022-08-30T05:51:23.250' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (628, N'Manuela.Ferry', N'Ottilie_Volkman@hotmail.com', N'wV5E4hyOn6kc5Aj', N'https://loremflickr.com/640/480', CAST(N'2023-01-09T02:10:43.940' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (629, N'Max_Rogahn', N'Kelton.Marks@hotmail.com', N'rSBJEjW5W_jMk5A', N'https://loremflickr.com/640/480', CAST(N'2022-07-18T13:18:20.307' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (630, N'Earl_Murray57', N'Arjun77@gmail.com', N'ZngD_amPoEl8hej', N'https://loremflickr.com/640/480', CAST(N'2022-06-10T12:26:29.033' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (631, N'Jairo.Lind81', N'Lawson.Legros@hotmail.com', N'gyFdCmbQN93rKyO', N'https://loremflickr.com/640/480', CAST(N'2022-02-03T03:45:08.640' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (632, N'Shanna.Keeling99', N'Norris.Johnston67@gmail.com', N'n1zhUEWFAKDvJE7', N'https://loremflickr.com/640/480', CAST(N'2022-11-22T12:24:27.790' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (633, N'Margot.Lindgren51', N'Hassan_Cole@gmail.com', N'bkYJzaUl4vo0PNk', N'https://loremflickr.com/640/480', CAST(N'2023-02-06T00:51:08.633' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (634, N'Margot81', N'Toni_Schaden60@hotmail.com', N't30Twi7BNqqU4Ap', N'https://loremflickr.com/640/480', CAST(N'2023-08-27T15:49:11.423' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (635, N'Kacey.Christiansen13', N'Jany4@hotmail.com', N'OxownsnzvJbqHz9', N'https://loremflickr.com/640/480', CAST(N'2023-06-22T04:03:40.167' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (636, N'Sunny43', N'Zora12@hotmail.com', N'EixrYtnRATwvEUe', N'https://loremflickr.com/640/480', CAST(N'2023-04-29T15:12:30.677' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (637, N'Arlene.Kertzmann97', N'Nicolas_Beahan25@yahoo.com', N'y89O1f1Tw9xsNpP', N'https://loremflickr.com/640/480', CAST(N'2022-07-01T16:05:36.163' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (638, N'Vada_Lesch', N'Damaris80@gmail.com', N'3RmuZHZqlM7OiT5', N'https://loremflickr.com/640/480', CAST(N'2023-10-10T11:42:20.257' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (639, N'Eva_Langworth', N'Laura85@hotmail.com', N'lFLyjhMSw_P868P', N'https://loremflickr.com/640/480', CAST(N'2022-05-25T22:16:03.717' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (640, N'Emelia.Pfeffer96', N'Marion_Turcotte73@yahoo.com', N'8uHDrXpGl8m5wQ1', N'https://loremflickr.com/640/480', CAST(N'2022-02-01T02:05:48.837' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (641, N'Kevon.Boyer', N'Larue.Dickinson47@yahoo.com', N'CSZuk0xS0w8n8SW', N'https://loremflickr.com/640/480', CAST(N'2023-11-22T03:18:25.597' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (642, N'Shane26', N'Anahi_Lehner@yahoo.com', N'5UetMjUDkLqp2Dg', N'https://loremflickr.com/640/480', CAST(N'2023-03-11T18:07:27.703' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (643, N'Hollis.Murray72', N'Kelsie76@yahoo.com', N'_4sQByKxSc_5T_O', N'https://loremflickr.com/640/480', CAST(N'2022-06-28T21:12:24.613' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (644, N'Quinn.Hermiston', N'Stefanie.Roberts80@gmail.com', N'NScHqeKqnfXx_3V', N'https://loremflickr.com/640/480', CAST(N'2023-06-19T17:09:13.820' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (645, N'Hanna_Stokes', N'Ernest44@hotmail.com', N'4ESzrEq4prTjWNp', N'https://loremflickr.com/640/480', CAST(N'2023-01-21T00:14:40.150' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (646, N'Ricardo.Kiehn34', N'Solon.Krajcik71@gmail.com', N'E5EHU9DPTqjspay', N'https://loremflickr.com/640/480', CAST(N'2023-04-03T13:06:16.337' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (647, N'Isaias0', N'Letha56@yahoo.com', N'utIFnfbgucguMMt', N'https://loremflickr.com/640/480', CAST(N'2022-10-09T17:41:16.193' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (648, N'Eliza.Stanton', N'Lauriane.Reichert58@yahoo.com', N'p5eBI3mQuzfC5sd', N'https://loremflickr.com/640/480', CAST(N'2022-03-30T07:52:06.510' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (649, N'Lauryn_Zulauf2', N'Natalia_McClure@gmail.com', N'c5CMn5mcl0SDbfJ', N'https://loremflickr.com/640/480', CAST(N'2022-04-12T01:23:19.753' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (650, N'Merl.Ratke65', N'Terrance_Cummerata@gmail.com', N'WRuG7N2CXSZGHls', N'https://loremflickr.com/640/480', CAST(N'2023-04-05T06:22:19.430' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (651, N'Mireille72', N'Claudie.Russel@yahoo.com', N'1hTIuXGZY0gNQDZ', N'https://loremflickr.com/640/480', CAST(N'2022-12-22T17:26:41.237' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (652, N'Mandy51', N'Amely.Grimes51@hotmail.com', N'uDFsH09K51qwPCt', N'https://loremflickr.com/640/480', CAST(N'2023-03-13T05:25:46.680' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (653, N'Electa_Robel', N'Cara74@gmail.com', N'nLCiEIYMxRtHhje', N'https://loremflickr.com/640/480', CAST(N'2022-12-21T10:43:53.620' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (654, N'Arden.Orn', N'Deven44@hotmail.com', N'Q1K5z3m5Ju53FjQ', N'https://loremflickr.com/640/480', CAST(N'2022-08-19T18:04:41.720' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (655, N'Kenneth.Kovacek27', N'Jalen_Heaney@hotmail.com', N'hAHLc_TOHyhgP7G', N'https://loremflickr.com/640/480', CAST(N'2022-04-09T20:39:31.443' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (656, N'Nicholas_Howell', N'Maryam_Murazik1@yahoo.com', N'8ZuIN63j1L4Q65m', N'https://loremflickr.com/640/480', CAST(N'2023-11-29T11:31:32.230' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (657, N'Giovanny_Schuster', N'Javonte.Pacocha@hotmail.com', N'mTnJ9JbPSMfKfzs', N'https://loremflickr.com/640/480', CAST(N'2023-12-17T02:19:53.917' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (658, N'Clifford.Schoen95', N'Trystan_Nicolas@hotmail.com', N'97KMuJ1jwaUVLq9', N'https://loremflickr.com/640/480', CAST(N'2022-01-10T17:30:38.853' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (659, N'Abigayle.Pouros74', N'Mason75@yahoo.com', N'kplsdyGtqpyDBxv', N'https://loremflickr.com/640/480', CAST(N'2023-02-11T10:40:17.590' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (660, N'Carmine.Rippin', N'Marcia.Welch@yahoo.com', N'mCpU1W4HokjMBK4', N'https://loremflickr.com/640/480', CAST(N'2023-11-27T23:25:07.130' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (661, N'Hardy.Cormier77', N'Bradford.Kihn@yahoo.com', N'iECg8ZkanNKlL03', N'https://loremflickr.com/640/480', CAST(N'2022-04-12T02:41:43.623' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (662, N'Libby.Luettgen', N'Nia62@hotmail.com', N'Wt0LpBYVsXEqPk_', N'https://loremflickr.com/640/480', CAST(N'2022-06-28T21:35:06.110' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (663, N'Rosalinda64', N'Veda_Frami10@gmail.com', N'giT8nwdVwXOPopw', N'https://loremflickr.com/640/480', CAST(N'2022-01-21T16:41:54.667' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (664, N'Ashly.Zulauf', N'Isabella.Hilpert@gmail.com', N'72ypHTX0AuNkrZw', N'https://loremflickr.com/640/480', CAST(N'2022-12-17T11:28:27.310' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (665, N'Curt.Schaefer', N'Anjali_Ruecker20@yahoo.com', N'wwHM6TazQqJdsJ8', N'https://loremflickr.com/640/480', CAST(N'2022-10-03T22:52:28.397' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (666, N'Leland_Smith', N'Jesse33@hotmail.com', N'Dh9BIBaEvlQpph9', N'https://loremflickr.com/640/480', CAST(N'2022-06-08T05:17:00.860' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (667, N'Walton.Ratke', N'Makayla23@hotmail.com', N'vrF2oASTeBK6VMK', N'https://loremflickr.com/640/480', CAST(N'2023-05-25T04:39:16.007' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (668, N'Selina7', N'Benton0@gmail.com', N'ZyStzT_cySpNuEN', N'https://loremflickr.com/640/480', CAST(N'2022-02-07T11:23:27.987' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (669, N'Ariane_Renner', N'Narciso27@gmail.com', N'iUlq9aOq3lvDsed', N'https://loremflickr.com/640/480', CAST(N'2023-10-19T15:43:09.133' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (670, N'Bret29', N'Darrell37@gmail.com', N'daQI4xP5SxejKft', N'https://loremflickr.com/640/480', CAST(N'2022-04-30T10:15:26.760' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (671, N'Enos.Carter86', N'Tatum_Turner63@hotmail.com', N'xFvhVHe6TjBNNZA', N'https://loremflickr.com/640/480', CAST(N'2022-09-08T06:54:58.353' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (672, N'Randall.Thiel', N'Sandrine.Lemke90@hotmail.com', N'lHDHn23eYgEHdcd', N'https://loremflickr.com/640/480', CAST(N'2022-05-28T13:38:44.323' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (673, N'Garry28', N'Dalton27@gmail.com', N'LOM4BqKwEQCA4Hl', N'https://loremflickr.com/640/480', CAST(N'2022-08-06T20:35:37.533' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (674, N'Rosalia.Huels56', N'Tyra.Macejkovic@yahoo.com', N'K2GoQoodwFABPZd', N'https://loremflickr.com/640/480', CAST(N'2023-01-08T20:28:43.357' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (675, N'Freddy42', N'Annalise30@hotmail.com', N'wFqXjVVCvj4YtLv', N'https://loremflickr.com/640/480', CAST(N'2023-06-20T13:23:36.560' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (676, N'Erick.Schinner10', N'Cathryn_Marquardt10@hotmail.com', N'H3tGH9IKZnp5HzL', N'https://loremflickr.com/640/480', CAST(N'2022-01-23T03:13:41.860' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (677, N'Joe60', N'Erin.Balistreri@hotmail.com', N'dlOxIbwL47G5b3P', N'https://loremflickr.com/640/480', CAST(N'2022-12-01T10:50:43.217' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (678, N'Mustafa_Beier14', N'Camylle82@hotmail.com', N'IkiGFV0OtL6AcJm', N'https://loremflickr.com/640/480', CAST(N'2023-01-26T13:10:44.670' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (679, N'Lesly65', N'Felicity51@yahoo.com', N'9JDsz1za_wYdhAt', N'https://loremflickr.com/640/480', CAST(N'2022-11-06T15:19:42.107' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (680, N'Alejandra_Bailey14', N'Odell28@gmail.com', N'Bx3IvRfDUVgtsU9', N'https://loremflickr.com/640/480', CAST(N'2023-10-27T10:18:59.390' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (681, N'Antonio77', N'Walter_Jaskolski@gmail.com', N'O0bE8ak97AipM36', N'https://loremflickr.com/640/480', CAST(N'2023-04-23T07:48:14.733' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (682, N'Marlin.Durgan', N'Jayda85@gmail.com', N'f6UkhSMpGmKnCiL', N'https://loremflickr.com/640/480', CAST(N'2022-08-10T18:55:42.190' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (683, N'Arianna42', N'Kiel_Bergstrom@gmail.com', N'renp0KJUCjXN4YY', N'https://loremflickr.com/640/480', CAST(N'2022-09-04T13:29:39.910' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (684, N'Phoebe.Wisozk22', N'Yvette.Lesch@hotmail.com', N'f7hdmPaOGOIP3HV', N'https://loremflickr.com/640/480', CAST(N'2023-08-24T04:11:34.567' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (685, N'Cullen_Bins', N'Conor.Kris@hotmail.com', N'psODKGKCqt7Mk2R', N'https://loremflickr.com/640/480', CAST(N'2022-03-23T22:18:25.607' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (686, N'Alexane.Boyer80', N'Marilyne56@hotmail.com', N'kfb2i52dYB7iekU', N'https://loremflickr.com/640/480', CAST(N'2023-12-12T20:21:36.943' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (687, N'Jamaal_Marvin', N'Marshall_Abshire@hotmail.com', N'Ikn8VlmU2YZm0Tc', N'https://loremflickr.com/640/480', CAST(N'2022-10-09T23:10:42.097' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (688, N'Dayton_Heidenreich73', N'Jackson.Maggio@hotmail.com', N'qlWOWOZe0QS2B0w', N'https://loremflickr.com/640/480', CAST(N'2022-09-11T21:48:53.963' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (689, N'Kristofer.Predovic75', N'Finn.Cummerata@hotmail.com', N'DtTkJNRq3yVWGBi', N'https://loremflickr.com/640/480', CAST(N'2023-09-21T09:27:42.633' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (690, N'Randy30', N'Warren.Medhurst16@yahoo.com', N'2uPUv27NvckMeQh', N'https://loremflickr.com/640/480', CAST(N'2022-07-19T02:06:40.340' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (691, N'Amiya60', N'Domenick.Gutkowski@hotmail.com', N'3bf2jn6EKTYCQFM', N'https://loremflickr.com/640/480', CAST(N'2022-06-07T08:40:06.947' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (692, N'Amie.Sporer', N'Alfonso.Labadie37@gmail.com', N'miZKBUFKN3kjQ7_', N'https://loremflickr.com/640/480', CAST(N'2023-03-01T17:51:16.643' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (693, N'Ressie_Feest59', N'Erna48@hotmail.com', N'PhpQI0p0VXSegJw', N'https://loremflickr.com/640/480', CAST(N'2022-07-09T02:21:11.337' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (694, N'Darlene_Rutherford5', N'Maria_Dibbert@hotmail.com', N'oF7RxyFD8uTcWtd', N'https://loremflickr.com/640/480', CAST(N'2022-09-02T09:17:10.483' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (695, N'Adrienne_Moen87', N'Emma68@gmail.com', N'zVKuGsAvOg5vFb0', N'https://loremflickr.com/640/480', CAST(N'2023-12-31T21:17:00.780' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (696, N'Orion.Reinger33', N'Nikita_Kunze76@hotmail.com', N'mJbh8YieMqbTKyj', N'https://loremflickr.com/640/480', CAST(N'2022-09-13T19:28:06.720' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (697, N'Sincere_Brekke24', N'Audra12@yahoo.com', N'a3OilJNLVyCJYmD', N'https://loremflickr.com/640/480', CAST(N'2022-07-18T11:23:10.073' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (698, N'Concepcion_Welch', N'Ashly19@yahoo.com', N'5Tge6vDOQu9fOWY', N'https://loremflickr.com/640/480', CAST(N'2023-01-13T11:35:37.793' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (699, N'Keanu.Satterfield', N'Vergie74@gmail.com', N'fqNu6m8yZTq8ik4', N'https://loremflickr.com/640/480', CAST(N'2022-06-29T17:06:56.713' AS DateTime))
GO
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (700, N'Marlee_Wilkinson72', N'Mariane79@hotmail.com', N's43i01LTcb8L3ES', N'https://loremflickr.com/640/480', CAST(N'2022-07-27T07:15:03.727' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (701, N'Roslyn.Wuckert48', N'Bethel11@hotmail.com', N'9yNNrORIHbN2kud', N'https://loremflickr.com/640/480', CAST(N'2022-04-08T12:28:24.563' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (702, N'Breanne.Ondricka35', N'Antone64@yahoo.com', N'1xTkPr8_zmYvzlp', N'https://loremflickr.com/640/480', CAST(N'2023-05-05T01:43:23.837' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (703, N'Carroll_Terry84', N'Jaydon.Reichel55@hotmail.com', N'5joZTueAxH8Dw9b', N'https://loremflickr.com/640/480', CAST(N'2022-12-09T20:15:38.120' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (704, N'Joy.Lakin59', N'Evelyn_White48@hotmail.com', N'NjQbDD78JPbFTp5', N'https://loremflickr.com/640/480', CAST(N'2022-01-16T05:50:13.167' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (705, N'Adonis.Terry', N'Loren_Beier27@gmail.com', N'DgBnpnANBryOwER', N'https://loremflickr.com/640/480', CAST(N'2022-11-01T15:46:00.770' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (706, N'Hulda79', N'Maci2@hotmail.com', N'GjbEwFxOGGw12Cx', N'https://loremflickr.com/640/480', CAST(N'2022-02-08T14:48:46.243' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (707, N'Hope_Armstrong23', N'Werner.Douglas93@gmail.com', N'Nf3e71if0XTpN8s', N'https://loremflickr.com/640/480', CAST(N'2023-11-30T07:08:29.103' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (708, N'Reagan73', N'Cleve.Kuhn56@gmail.com', N'PSiLbwNkm1pe3nJ', N'https://loremflickr.com/640/480', CAST(N'2022-12-07T06:14:21.510' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (709, N'Federico.Rath41', N'Herta79@hotmail.com', N'f_O57dF8JptaByw', N'https://loremflickr.com/640/480', CAST(N'2022-10-05T12:22:50.450' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (710, N'Cameron54', N'Pasquale39@hotmail.com', N'EtuKilmQDU7ECm5', N'https://loremflickr.com/640/480', CAST(N'2023-02-20T20:25:19.347' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (711, N'Kaycee10', N'Enola_Robel@gmail.com', N'i8hV0o3BiIXG2n5', N'https://loremflickr.com/640/480', CAST(N'2023-04-04T05:44:59.863' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (712, N'Cecile69', N'Adell_Murazik19@yahoo.com', N'_A02FYypMnRQZU_', N'https://loremflickr.com/640/480', CAST(N'2022-07-25T15:43:22.487' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (713, N'Mckenna.Raynor38', N'Santino_Koss@yahoo.com', N'Vz50oiqBDSbfDzo', N'https://loremflickr.com/640/480', CAST(N'2022-06-13T09:33:10.760' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (714, N'Ben85', N'Dax68@hotmail.com', N'EkkiCBc1wTQcoab', N'https://loremflickr.com/640/480', CAST(N'2023-10-05T11:42:33.607' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (715, N'Kaleb.Jacobi', N'Ruth.Gulgowski7@hotmail.com', N'OVunx7ly169JtFY', N'https://loremflickr.com/640/480', CAST(N'2023-04-06T13:22:21.023' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (716, N'Agustin_Langworth', N'Brigitte28@yahoo.com', N'emCm7xQr1G1DNGT', N'https://loremflickr.com/640/480', CAST(N'2022-09-28T07:12:45.273' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (717, N'Jayme.Grimes', N'Effie65@gmail.com', N'Zw96CU6mZ1UnXyv', N'https://loremflickr.com/640/480', CAST(N'2022-11-22T18:43:14.750' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (718, N'Ellie91', N'Delilah_Gutkowski@hotmail.com', N'u9Cng9yvo1ZNRTk', N'https://loremflickr.com/640/480', CAST(N'2023-06-05T10:42:13.057' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (719, N'Gabriel12', N'Herman48@hotmail.com', N'uPTuvA5qf0aRTHV', N'https://loremflickr.com/640/480', CAST(N'2022-02-11T00:56:14.520' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (720, N'Mertie.Stoltenberg', N'Etha40@gmail.com', N'5fOPVYq7TJNQIgF', N'https://loremflickr.com/640/480', CAST(N'2023-01-27T19:00:31.083' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (721, N'Abner.Grant31', N'Meagan.Robel@hotmail.com', N'XX_onbHjbOYx5XA', N'https://loremflickr.com/640/480', CAST(N'2022-05-19T12:05:02.393' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (722, N'Velda89', N'Cecilia_Klein11@yahoo.com', N'gmRn7xilaD1NvsM', N'https://loremflickr.com/640/480', CAST(N'2023-03-09T13:55:33.593' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (723, N'Dino.Schmeler', N'Junior.Schmeler@gmail.com', N'2kPpTqkVtY77Gpn', N'https://loremflickr.com/640/480', CAST(N'2023-05-04T13:28:27.010' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (724, N'Nils90', N'Louie_Stiedemann@hotmail.com', N'yp3zyuzHTuAdYuP', N'https://loremflickr.com/640/480', CAST(N'2023-06-03T21:06:24.213' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (725, N'Naomi.Powlowski68', N'Karson.Sporer23@hotmail.com', N'd6Irv5d3Yzwsdmb', N'https://loremflickr.com/640/480', CAST(N'2023-10-03T11:24:53.840' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (726, N'Clemmie.Bailey23', N'Christelle_Weber28@gmail.com', N'7FiLTDdEIliJLXB', N'https://loremflickr.com/640/480', CAST(N'2022-05-23T07:23:50.580' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (727, N'Natalia.Schulist', N'Jefferey.Harber@yahoo.com', N'fdMPXjKrcOOyWqY', N'https://loremflickr.com/640/480', CAST(N'2023-05-30T03:10:38.957' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (728, N'Lowell_McClure', N'Ramiro_Kohler55@gmail.com', N'YoDozfR5psHx7Z7', N'https://loremflickr.com/640/480', CAST(N'2023-12-12T16:57:52.703' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (729, N'Cordelia.Larson', N'Xzavier64@hotmail.com', N'g9dZoB4peY8ghJ2', N'https://loremflickr.com/640/480', CAST(N'2022-12-25T11:09:12.140' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (730, N'Cletus_Steuber18', N'Amie61@hotmail.com', N'3lXufrKSjlSWQG5', N'https://loremflickr.com/640/480', CAST(N'2022-01-09T22:24:29.600' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (731, N'Lionel.Okuneva', N'Trenton50@gmail.com', N'32cZ9qJfGzP6W9U', N'https://loremflickr.com/640/480', CAST(N'2023-06-13T04:48:38.797' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (732, N'Shanie.Orn', N'Walton83@yahoo.com', N'4OvxCNkY4mXYERG', N'https://loremflickr.com/640/480', CAST(N'2023-05-31T12:11:32.840' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (733, N'Wallace_Kassulke', N'Joanne_Hagenes@gmail.com', N'URQQCGUSESMH1CQ', N'https://loremflickr.com/640/480', CAST(N'2023-10-12T14:35:33.313' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (734, N'Jalen16', N'Edythe_Kuhlman74@yahoo.com', N'sO3_xaQrZkgZ9It', N'https://loremflickr.com/640/480', CAST(N'2023-06-14T19:33:23.240' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (735, N'Teresa72', N'Blanche_Hickle95@yahoo.com', N'ti6eb0A2SszYEIO', N'https://loremflickr.com/640/480', CAST(N'2023-11-26T17:32:26.510' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (736, N'Hildegard57', N'Corine17@hotmail.com', N'ceuwinEcrH431iK', N'https://loremflickr.com/640/480', CAST(N'2022-10-01T13:15:41.247' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (737, N'Dalton.Streich', N'Cleora_Goyette@hotmail.com', N'MyCiZy5oGWaFGjE', N'https://loremflickr.com/640/480', CAST(N'2022-10-25T07:34:03.437' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (738, N'Alexanne_Dickens', N'Dave.Wyman@gmail.com', N'WsmUK893fIn08g_', N'https://loremflickr.com/640/480', CAST(N'2023-03-17T07:56:47.350' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (739, N'Jordyn_McLaughlin42', N'River.Upton@hotmail.com', N'cvhEqS_WHdb1IfV', N'https://loremflickr.com/640/480', CAST(N'2022-12-11T21:05:06.113' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (740, N'Alexandre_Hand93', N'Koby_Bartoletti79@yahoo.com', N'vYuP_foJJEah8hi', N'https://loremflickr.com/640/480', CAST(N'2022-12-28T00:42:07.247' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (741, N'Kailyn.Ortiz9', N'Jaeden.Roob@gmail.com', N'avqcnCKb88Qiqpq', N'https://loremflickr.com/640/480', CAST(N'2023-06-21T11:28:50.573' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (742, N'Solon_Brakus', N'Lora_Leannon@gmail.com', N'uSxY8wJD50j7ND0', N'https://loremflickr.com/640/480', CAST(N'2023-07-01T06:29:13.133' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (743, N'Rachel.Dicki90', N'Oma_Becker@gmail.com', N'dDJb2juEsWP2VR0', N'https://loremflickr.com/640/480', CAST(N'2023-11-20T19:28:45.677' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (744, N'Gerald_Murazik5', N'Jonatan.Satterfield@yahoo.com', N'QTsrSCcvVdus4TP', N'https://loremflickr.com/640/480', CAST(N'2023-06-04T03:38:00.570' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (745, N'Jazmyn.Bernier', N'Aida_Wyman45@hotmail.com', N'0c4JZnlRb5cjwuH', N'https://loremflickr.com/640/480', CAST(N'2022-03-20T20:36:35.837' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (746, N'Vance.Kunze', N'Katrina_Vandervort50@gmail.com', N'eU2RTVuJaOtApIm', N'https://loremflickr.com/640/480', CAST(N'2023-06-23T12:04:43.077' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (747, N'Burdette96', N'Emie19@gmail.com', N'v8IzzXSPhWiT_iP', N'https://loremflickr.com/640/480', CAST(N'2022-02-02T12:28:34.517' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (748, N'Osborne_Schuppe47', N'Rocio_Schumm@gmail.com', N'LFbWhsG3tQUVdm7', N'https://loremflickr.com/640/480', CAST(N'2023-01-15T09:41:56.337' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (749, N'Otha.Schamberger95', N'Arnaldo.Barton@yahoo.com', N'nwN7_54PRqLYAeQ', N'https://loremflickr.com/640/480', CAST(N'2023-07-14T14:13:37.103' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (750, N'Cullen_Koepp', N'Ayla93@gmail.com', N'VIeaJrYx3LAOtOo', N'https://loremflickr.com/640/480', CAST(N'2023-03-10T21:17:20.633' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (751, N'Mireya_Schultz22', N'Kade11@yahoo.com', N'A_SuTA_rGM8MxUW', N'https://loremflickr.com/640/480', CAST(N'2023-05-27T08:43:31.677' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (752, N'Garret.Bogisich3', N'April.Larson@gmail.com', N'keE5yYhH6Eped0d', N'https://loremflickr.com/640/480', CAST(N'2023-05-13T12:22:07.693' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (753, N'Elvie_Beer24', N'Jailyn41@yahoo.com', N'FbKOL6MpHsYiZT7', N'https://loremflickr.com/640/480', CAST(N'2022-08-13T22:52:20.700' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (754, N'Sandrine.Bauch', N'Justine55@hotmail.com', N'A2wz2rSsKgHeNEY', N'https://loremflickr.com/640/480', CAST(N'2022-04-07T14:50:56.030' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (755, N'Alexys9', N'Walker_Gottlieb48@yahoo.com', N'Ta7H5hBHRh_YpAF', N'https://loremflickr.com/640/480', CAST(N'2022-04-07T19:50:05.223' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (756, N'Kirstin.Ratke61', N'Rowan.Huels@gmail.com', N'OJcfIvZPSNbyZhZ', N'https://loremflickr.com/640/480', CAST(N'2022-11-19T06:57:29.733' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (757, N'Amiya94', N'Daryl79@yahoo.com', N'PrXi1mWODxjJScX', N'https://loremflickr.com/640/480', CAST(N'2022-04-06T17:33:15.917' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (758, N'John38', N'Cedrick77@hotmail.com', N'C0T9tEhyjZJelbb', N'https://loremflickr.com/640/480', CAST(N'2022-12-13T08:50:08.277' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (759, N'Pablo73', N'Elias27@gmail.com', N'UrD_hve5EXTi8y7', N'https://loremflickr.com/640/480', CAST(N'2022-08-24T08:52:37.723' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (760, N'Patience_Zulauf', N'Lou11@hotmail.com', N'MFdvZksJWmlRBy2', N'https://loremflickr.com/640/480', CAST(N'2022-12-24T07:23:59.267' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (761, N'Nat88', N'Cale3@gmail.com', N'IztbTPBPA8gabyH', N'https://loremflickr.com/640/480', CAST(N'2023-05-15T07:08:45.137' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (762, N'Josianne.Gutkowski', N'Marshall.Nader@hotmail.com', N'6iFxgqeiUk5qlKP', N'https://loremflickr.com/640/480', CAST(N'2022-08-29T13:14:29.450' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (763, N'Zackary.Gerhold', N'Ansley_Crist61@gmail.com', N'DM_w84hRiFfkeP2', N'https://loremflickr.com/640/480', CAST(N'2023-12-08T12:30:08.303' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (764, N'Chaim56', N'Ransom_Thompson19@hotmail.com', N'gwiw3nFQvVcGV3Z', N'https://loremflickr.com/640/480', CAST(N'2023-06-15T23:35:04.347' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (765, N'Kenyon_Considine8', N'Cordia_Keebler48@gmail.com', N'5zs2DcvXfjTihVw', N'https://loremflickr.com/640/480', CAST(N'2023-04-28T20:54:57.867' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (766, N'Oliver99', N'Leland29@yahoo.com', N'8DxbGZ_0AkcrPIY', N'https://loremflickr.com/640/480', CAST(N'2023-12-23T06:01:07.393' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (767, N'Jonatan.Marvin2', N'Joanny.Gusikowski74@hotmail.com', N'GpX7uFx0R3wvq8x', N'https://loremflickr.com/640/480', CAST(N'2022-08-14T00:56:01.123' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (768, N'Alfred_DAmore', N'Cade_Hackett81@hotmail.com', N'Pc__Vr4H3hdfMNk', N'https://loremflickr.com/640/480', CAST(N'2023-08-25T16:58:25.817' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (769, N'Caroline_Kozey', N'Brittany_Wilkinson@yahoo.com', N'yCBXQSHU2xZri1B', N'https://loremflickr.com/640/480', CAST(N'2023-01-01T10:49:35.737' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (770, N'Taya60', N'Adrian.OHara97@gmail.com', N'BcQskwmzixEEXfc', N'https://loremflickr.com/640/480', CAST(N'2023-01-30T02:12:32.777' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (771, N'Quinton_Larkin35', N'Celestine_Veum@gmail.com', N'Yiwq9noJeCVEYU4', N'https://loremflickr.com/640/480', CAST(N'2022-11-08T02:04:44.000' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (772, N'Melvin.Ward', N'Teagan_Thiel1@gmail.com', N'34caVpcedc3rSIa', N'https://loremflickr.com/640/480', CAST(N'2022-02-23T17:43:10.377' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (773, N'Bailey.Dooley35', N'Brett48@hotmail.com', N'uU4Z8ASFv1pQdmU', N'https://loremflickr.com/640/480', CAST(N'2023-09-17T14:45:37.357' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (774, N'Scottie95', N'Dexter.Gerhold@hotmail.com', N'AQSUaepa3jCTLHU', N'https://loremflickr.com/640/480', CAST(N'2022-04-14T11:09:22.863' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (775, N'Lydia23', N'Therese.Johns@gmail.com', N'tnhy3RPlfHziYi8', N'https://loremflickr.com/640/480', CAST(N'2023-12-04T06:01:23.827' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (776, N'Minnie27', N'Leila.Bernhard85@yahoo.com', N'GkBpvqwhuslCpI8', N'https://loremflickr.com/640/480', CAST(N'2022-11-19T14:09:07.173' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (777, N'Emerson25', N'Nicolas.Bernhard@hotmail.com', N'rwHy5hcbtSQhmbZ', N'https://loremflickr.com/640/480', CAST(N'2022-09-19T01:16:03.387' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (778, N'Serena.Mohr8', N'Savanna98@hotmail.com', N'eY0G92nIFqvwjJi', N'https://loremflickr.com/640/480', CAST(N'2023-11-08T21:51:05.500' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (779, N'Hassan.Cremin95', N'Stanford88@yahoo.com', N'OKifEXIKBveAbZR', N'https://loremflickr.com/640/480', CAST(N'2023-10-23T11:54:55.997' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (780, N'Claud6', N'Bertrand_McCullough@yahoo.com', N'k9fpvRHQfjIKuj7', N'https://loremflickr.com/640/480', CAST(N'2023-07-20T19:04:28.487' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (781, N'Darrin_Farrell29', N'Allene_Glover85@gmail.com', N'oA68_HzGEUaR9Z7', N'https://loremflickr.com/640/480', CAST(N'2023-06-14T19:19:58.527' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (782, N'Jakob23', N'Citlalli80@yahoo.com', N'dWvkh1RUmyMh5IK', N'https://loremflickr.com/640/480', CAST(N'2023-11-25T06:09:33.627' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (783, N'Katherine8', N'Hellen_Conroy@hotmail.com', N'Ep0E2ubwJYGx6LO', N'https://loremflickr.com/640/480', CAST(N'2023-09-04T01:28:10.927' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (784, N'Agnes_Lakin72', N'Ashlee55@gmail.com', N'r5KRYAqX1SIjHYR', N'https://loremflickr.com/640/480', CAST(N'2022-11-17T19:11:47.887' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (785, N'Aileen19', N'Naomie35@hotmail.com', N'yhOSakevSfURS5k', N'https://loremflickr.com/640/480', CAST(N'2022-09-25T19:15:07.030' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (786, N'Eileen_Oberbrunner', N'Brennon.Beier94@gmail.com', N'j44DUweXYryx9F_', N'https://loremflickr.com/640/480', CAST(N'2022-10-26T19:23:34.647' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (787, N'Enid.Lehner', N'Triston.Beer62@hotmail.com', N'VVOHzqerPaesTLq', N'https://loremflickr.com/640/480', CAST(N'2023-10-30T02:07:58.790' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (788, N'Luciano.Hilpert', N'Scottie.Nolan@gmail.com', N'StWDZ2X6BoidXnM', N'https://loremflickr.com/640/480', CAST(N'2023-05-24T20:45:40.333' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (789, N'Anita.Borer65', N'Bridie.Cummings@gmail.com', N'Z9eSBTKc_dH3f_f', N'https://loremflickr.com/640/480', CAST(N'2023-08-20T21:56:39.800' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (790, N'Rowland.Buckridge', N'Carissa24@gmail.com', N'IASISJb6go84Ump', N'https://loremflickr.com/640/480', CAST(N'2022-11-09T05:00:31.173' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (791, N'Marquis.Abernathy97', N'Wendell.Kiehn@gmail.com', N'OCgRt3NgIGKRpxx', N'https://loremflickr.com/640/480', CAST(N'2022-06-11T21:26:59.260' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (792, N'Jordane22', N'Breanne_Romaguera20@yahoo.com', N'GibyEHIWukPVQRP', N'https://loremflickr.com/640/480', CAST(N'2023-09-10T05:19:31.980' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (793, N'Kaya_Dicki', N'Elva.Johns@gmail.com', N'GG5XyTRoV3axYcg', N'https://loremflickr.com/640/480', CAST(N'2023-04-18T17:10:55.607' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (794, N'Marco66', N'Mazie.Jerde83@hotmail.com', N'jmXS64eg40AgLBj', N'https://loremflickr.com/640/480', CAST(N'2022-02-21T15:19:52.427' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (795, N'Sydnee.Erdman', N'Amy67@hotmail.com', N'dRhmHv8CkHRavRi', N'https://loremflickr.com/640/480', CAST(N'2022-02-24T14:47:48.317' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (796, N'Pascale_Grady', N'Eula.Murazik@yahoo.com', N'neREbjNXHAH6FuZ', N'https://loremflickr.com/640/480', CAST(N'2023-04-15T01:43:42.017' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (797, N'Bernard_Nikolaus96', N'Bernhard.Dare@gmail.com', N'AmMhohhKVB8HGbT', N'https://loremflickr.com/640/480', CAST(N'2023-12-30T23:19:14.530' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (798, N'Shana_Bahringer', N'Jamal.Cremin@yahoo.com', N'UKFdQcWtE3jLse8', N'https://loremflickr.com/640/480', CAST(N'2023-09-14T10:59:49.177' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (799, N'Vicky.Kovacek', N'Ronaldo.Baumbach@yahoo.com', N'Lk4ZOmOP0NtwFtj', N'https://loremflickr.com/640/480', CAST(N'2022-06-25T19:58:26.270' AS DateTime))
GO
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (800, N'Ross.Wuckert', N'Kenton9@hotmail.com', N'PBgJz_q6S7DqslN', N'https://loremflickr.com/640/480', CAST(N'2022-05-30T19:59:13.160' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (801, N'Moises68', N'Garland_Krajcik84@gmail.com', N'Do5cI4IBS2czi9R', N'https://loremflickr.com/640/480', CAST(N'2023-01-04T14:58:26.590' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (802, N'Icie_McGlynn13', N'Alivia31@yahoo.com', N'eyiBkCv2_JR28Vp', N'https://loremflickr.com/640/480', CAST(N'2023-09-01T18:39:43.127' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (803, N'Lonny5', N'Celine.Keeling@yahoo.com', N'dF6Ng0ILfZ46JH0', N'https://loremflickr.com/640/480', CAST(N'2022-07-17T21:13:38.420' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (804, N'May.Frami', N'Dell_Gutkowski45@gmail.com', N'kZvbU_ZcxeutJhG', N'https://loremflickr.com/640/480', CAST(N'2022-03-09T23:17:50.263' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (805, N'Stacey.Homenick', N'Rita36@gmail.com', N'7Iwh_fx2qoB7NH3', N'https://loremflickr.com/640/480', CAST(N'2022-05-08T05:50:05.537' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (806, N'Darion_Schroeder3', N'Camille.Daugherty20@gmail.com', N'68KWCmVVjthYdKi', N'https://loremflickr.com/640/480', CAST(N'2023-05-21T04:33:53.217' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (807, N'Julien.Ratke', N'Natalie.Hessel17@gmail.com', N'SeP9kBZqri8pWYh', N'https://loremflickr.com/640/480', CAST(N'2022-12-23T09:16:46.803' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (808, N'Abbey30', N'Juwan.Crist95@hotmail.com', N'S_wwnr8ami5nO0R', N'https://loremflickr.com/640/480', CAST(N'2022-08-28T16:53:52.330' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (809, N'Loraine_Gorczany', N'Lawson_Crist@yahoo.com', N'aL_4qKNbovxgGIG', N'https://loremflickr.com/640/480', CAST(N'2022-04-16T03:13:43.460' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (810, N'Al96', N'Catharine39@hotmail.com', N'gqyt5DE4MMSm9zR', N'https://loremflickr.com/640/480', CAST(N'2023-01-24T23:14:32.427' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (811, N'Jessica_Rath74', N'Brendon.Gutmann@hotmail.com', N'dS1kURytO1NerOc', N'https://loremflickr.com/640/480', CAST(N'2023-08-07T17:47:48.610' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (812, N'Sophia_Kirlin77', N'Santa.Friesen15@hotmail.com', N'8dbjHti_h62GqSN', N'https://loremflickr.com/640/480', CAST(N'2022-03-18T07:20:06.393' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (813, N'Ora_Vandervort69', N'Wilbert_Koelpin66@gmail.com', N'Ax5gxiRjXEPZ2rj', N'https://loremflickr.com/640/480', CAST(N'2023-09-25T17:40:53.620' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (814, N'Margaret_Lockman', N'Giuseppe.Smitham@hotmail.com', N'lQIE8uZSSF2Pz0f', N'https://loremflickr.com/640/480', CAST(N'2022-06-10T09:33:27.627' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (815, N'Carlotta_Gottlieb', N'Brittany.Moen48@gmail.com', N'AdgxkonYm2K0jAJ', N'https://loremflickr.com/640/480', CAST(N'2022-01-25T00:30:00.267' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (816, N'Otho_Jaskolski9', N'Daisy74@hotmail.com', N'9RH0CQ7leeDsOGY', N'https://loremflickr.com/640/480', CAST(N'2022-09-29T00:15:50.273' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (817, N'Antwan_Haley90', N'Ruthe.Lockman10@gmail.com', N'EhRJNqCZxjUudh6', N'https://loremflickr.com/640/480', CAST(N'2022-03-01T02:14:00.823' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (818, N'Shaylee53', N'Reece.Langosh51@yahoo.com', N'jdBb0nRX3QCaZV5', N'https://loremflickr.com/640/480', CAST(N'2022-02-24T07:29:28.883' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (819, N'Jeff_Fritsch85', N'Eudora61@hotmail.com', N'HbimURF3TplfroX', N'https://loremflickr.com/640/480', CAST(N'2023-03-25T07:17:15.210' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (820, N'Kraig88', N'Camren68@hotmail.com', N'FZukCr4WtjZeHoS', N'https://loremflickr.com/640/480', CAST(N'2022-05-04T07:35:23.923' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (821, N'Cody39', N'Hayley.Kohler@gmail.com', N'XVSOeW9UNwpxRsQ', N'https://loremflickr.com/640/480', CAST(N'2022-03-07T15:27:29.397' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (822, N'Kareem25', N'Casey73@gmail.com', N'UF0swPbP7FVwi2I', N'https://loremflickr.com/640/480', CAST(N'2022-02-22T11:51:30.610' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (823, N'Cassandra97', N'Reanna.OKon43@hotmail.com', N'hUjgwk0sMSr1sf3', N'https://loremflickr.com/640/480', CAST(N'2022-10-26T18:35:47.250' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (824, N'Edison77', N'Haylee89@hotmail.com', N'4LgdZ2uHfcOf7F2', N'https://loremflickr.com/640/480', CAST(N'2022-11-26T21:14:39.137' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (825, N'Eileen.Hills', N'Thora.Crooks6@hotmail.com', N'hFM8y3S94t5GN8p', N'https://loremflickr.com/640/480', CAST(N'2022-07-30T23:57:36.713' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (826, N'Easter_Barton23', N'Yvonne.Farrell47@yahoo.com', N'rNNk4JSqe0vlxCL', N'https://loremflickr.com/640/480', CAST(N'2023-11-16T15:14:37.577' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (827, N'Hildegard_Kihn', N'Jacquelyn70@gmail.com', N'HscxxcX675GKQ7q', N'https://loremflickr.com/640/480', CAST(N'2023-05-07T08:12:18.103' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (828, N'Corrine29', N'Lillie.Conn@gmail.com', N'oDvxHmUOen073cG', N'https://loremflickr.com/640/480', CAST(N'2023-06-16T12:57:18.667' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (829, N'Alexa.Parisian', N'Boris_Tillman@gmail.com', N'QDtTiIMmQSm3MPy', N'https://loremflickr.com/640/480', CAST(N'2023-08-19T20:47:14.237' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (830, N'Sven_Dibbert92', N'Josh_Ritchie80@yahoo.com', N'JFfoqO1oAtEJEn1', N'https://loremflickr.com/640/480', CAST(N'2023-07-30T20:04:54.157' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (831, N'Alize.Yundt', N'Vinnie.Swaniawski87@yahoo.com', N'St3NMtOx0enURz9', N'https://loremflickr.com/640/480', CAST(N'2023-09-20T21:58:25.457' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (832, N'Etha.Huel80', N'Karlie37@gmail.com', N'2oaDVRGJovncwqV', N'https://loremflickr.com/640/480', CAST(N'2022-11-11T00:47:44.487' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (833, N'Ambrose.Toy4', N'Unique_Kuhn3@yahoo.com', N'YfdpRO_c1bQQvgk', N'https://loremflickr.com/640/480', CAST(N'2023-02-02T01:10:42.683' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (834, N'Jarod68', N'Jalon_Schaden@yahoo.com', N'pCZYk5aZgDfsFDv', N'https://loremflickr.com/640/480', CAST(N'2022-06-26T04:15:13.973' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (835, N'Audrey83', N'Raina95@hotmail.com', N'71xqQU0cykltN4h', N'https://loremflickr.com/640/480', CAST(N'2023-06-06T05:19:07.427' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (836, N'Leonor7', N'Harrison.Prosacco@hotmail.com', N'xQZWQXA7MRpwAX9', N'https://loremflickr.com/640/480', CAST(N'2023-09-25T00:15:24.433' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (837, N'Kaylin47', N'Matt_Rodriguez@hotmail.com', N'PnkJSniPAjXr5Sx', N'https://loremflickr.com/640/480', CAST(N'2023-05-01T06:24:00.290' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (838, N'Dell82', N'Lenora12@gmail.com', N'HpGtttwn3Vjed6g', N'https://loremflickr.com/640/480', CAST(N'2023-01-16T21:08:48.837' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (839, N'Anita.Bahringer13', N'Brandt_Dietrich@hotmail.com', N'sf1vh8K1lIfgmlT', N'https://loremflickr.com/640/480', CAST(N'2023-09-05T15:22:37.143' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (840, N'Nestor2', N'Manuel_Haley@hotmail.com', N'fsikSEPKYwPSAfI', N'https://loremflickr.com/640/480', CAST(N'2022-05-17T13:22:03.450' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (841, N'Jennifer.Osinski73', N'Elsa93@yahoo.com', N'q40QuB4LQwHSfCM', N'https://loremflickr.com/640/480', CAST(N'2023-07-05T01:15:47.043' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (842, N'Cullen.Franey', N'Mark.Bailey@gmail.com', N'nN2TZhbkPdrJoBE', N'https://loremflickr.com/640/480', CAST(N'2022-05-11T23:39:03.707' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (843, N'Alana_Roberts90', N'Hilton.Schneider20@yahoo.com', N'T5p7seokikFsD_v', N'https://loremflickr.com/640/480', CAST(N'2022-05-13T14:34:40.907' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (844, N'Tillman.Schroeder', N'Jerad8@gmail.com', N'uetll_krMiv3bOq', N'https://loremflickr.com/640/480', CAST(N'2023-08-29T13:06:10.773' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (845, N'Jake78', N'Brenda_Graham8@hotmail.com', N'suAVBdTSAIqJykq', N'https://loremflickr.com/640/480', CAST(N'2023-06-25T11:25:31.117' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (846, N'Tate77', N'Payton.Kling28@hotmail.com', N'rRNWRUsmqxZV9Fd', N'https://loremflickr.com/640/480', CAST(N'2023-09-17T00:56:29.177' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (847, N'Emerson.Fahey53', N'Madison_Braun38@hotmail.com', N'nnoKe9xIqhqsqKQ', N'https://loremflickr.com/640/480', CAST(N'2023-09-08T16:32:47.220' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (848, N'Gust_Jaskolski', N'Quinten_Reichel@yahoo.com', N'xrmpdYr4b2se04s', N'https://loremflickr.com/640/480', CAST(N'2023-02-13T15:20:09.957' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (849, N'Colton.Wiza', N'Salvador.Barrows@yahoo.com', N'gPd3ZZB_4JyMNmA', N'https://loremflickr.com/640/480', CAST(N'2023-02-28T00:56:19.727' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (850, N'Danielle_Lindgren', N'Alvina.Harvey@yahoo.com', N'U2NxX3oqhxysgh7', N'https://loremflickr.com/640/480', CAST(N'2023-05-24T04:31:34.200' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (851, N'Elmer90', N'Breana58@gmail.com', N'_sSIQt5XWGwGD4p', N'https://loremflickr.com/640/480', CAST(N'2022-07-07T09:21:24.817' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (852, N'Tevin35', N'Peyton_Schimmel@hotmail.com', N'eEdXdUwbnrEBPZy', N'https://loremflickr.com/640/480', CAST(N'2022-08-06T23:54:13.987' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (853, N'Brooks.Borer57', N'Mayra_Stoltenberg@gmail.com', N'qC_0zqLcXhouB25', N'https://loremflickr.com/640/480', CAST(N'2023-02-02T21:14:50.657' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (854, N'Virginie53', N'Devon.Rohan@gmail.com', N'iNSmiFl64fszh8f', N'https://loremflickr.com/640/480', CAST(N'2023-06-13T07:25:19.443' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (855, N'Fredrick78', N'Christophe.Corwin17@yahoo.com', N'wDfJNGBzFk33mtD', N'https://loremflickr.com/640/480', CAST(N'2023-09-20T17:45:33.080' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (856, N'Lexi_Leffler16', N'Hattie15@gmail.com', N'ZK4rjS6YmFCC8zx', N'https://loremflickr.com/640/480', CAST(N'2022-03-06T00:19:40.353' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (857, N'Rose_Spencer', N'Alexa_Volkman71@hotmail.com', N'x5IXJlapcnO0PWF', N'https://loremflickr.com/640/480', CAST(N'2022-12-09T13:14:25.013' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (858, N'Casimir.Christiansen', N'Arlo_Ankunding@hotmail.com', N'UOOdF1cW1UJVQn3', N'https://loremflickr.com/640/480', CAST(N'2023-01-02T17:53:04.430' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (859, N'Frankie_Parisian', N'Adriana.Beatty@gmail.com', N'VCzZnpAgQ57ko37', N'https://loremflickr.com/640/480', CAST(N'2022-09-19T06:21:31.043' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (860, N'Pearline.DAmore', N'Rosalia_Cummings11@yahoo.com', N'3O0KIdUJ_CzBJGO', N'https://loremflickr.com/640/480', CAST(N'2022-03-05T10:25:58.223' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (861, N'Norma90', N'Celestine.Kris@gmail.com', N'cCxzmRDQp0FnjXv', N'https://loremflickr.com/640/480', CAST(N'2022-05-25T23:23:59.197' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (862, N'Madge.West', N'Florence.Halvorson50@yahoo.com', N'zK7genb23AHgXww', N'https://loremflickr.com/640/480', CAST(N'2022-03-22T07:05:13.283' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (863, N'Leonie.Altenwerth16', N'Frances.Kling@gmail.com', N'LeqAYTV49Buzocy', N'https://loremflickr.com/640/480', CAST(N'2022-09-20T07:55:50.097' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (864, N'Caroline_Steuber62', N'Viviane_Ritchie@gmail.com', N'uyX8yFB3wXGhaHI', N'https://loremflickr.com/640/480', CAST(N'2022-07-06T23:42:50.970' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (865, N'Eva.Waelchi', N'Isai_Gerlach97@yahoo.com', N'AKRMdAHKTxXVkGA', N'https://loremflickr.com/640/480', CAST(N'2022-07-21T02:25:32.200' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (866, N'Freddie.Altenwerth76', N'Litzy74@hotmail.com', N'4cFhKa8ws1wILYy', N'https://loremflickr.com/640/480', CAST(N'2023-11-22T21:16:05.093' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (867, N'Summer_Maggio', N'Marques33@gmail.com', N'gnVELIcaAs_1DTy', N'https://loremflickr.com/640/480', CAST(N'2022-11-24T09:54:16.330' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (868, N'Ayana39', N'Rosina.Kunde@gmail.com', N'mjPAZs0piziYtTL', N'https://loremflickr.com/640/480', CAST(N'2022-12-06T16:04:16.623' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (869, N'Connie70', N'Jan.Hauck@yahoo.com', N'IsiOrQDCERkWHJu', N'https://loremflickr.com/640/480', CAST(N'2023-09-24T23:41:08.740' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (870, N'Keshawn.Windler53', N'Florida80@hotmail.com', N'FiXCNsKLxJ_y4on', N'https://loremflickr.com/640/480', CAST(N'2022-02-28T12:14:11.537' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (871, N'Joanie63', N'Dillan.Strosin@gmail.com', N'bX_8YeVeostPGyP', N'https://loremflickr.com/640/480', CAST(N'2022-03-10T22:29:19.753' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (872, N'Sydnee.Doyle68', N'Alek_Marks@gmail.com', N'gU7jxSnljSQuEOR', N'https://loremflickr.com/640/480', CAST(N'2023-02-25T20:36:55.887' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (873, N'Malvina46', N'Jermaine.Grimes@gmail.com', N'DlkC6cGTX4XeUkm', N'https://loremflickr.com/640/480', CAST(N'2022-10-16T00:41:47.710' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (874, N'Devyn.Fritsch2', N'Ned73@yahoo.com', N'Vq6YLi9FvFcg0zX', N'https://loremflickr.com/640/480', CAST(N'2022-01-28T18:52:32.263' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (875, N'Mckenzie_Gulgowski', N'Josianne_Hauck@yahoo.com', N'mu4Kplgkg9EB5KL', N'https://loremflickr.com/640/480', CAST(N'2022-10-27T18:25:27.263' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (876, N'Orrin62', N'Jamie_Bernhard33@gmail.com', N'PT5AmmKmX1NTzts', N'https://loremflickr.com/640/480', CAST(N'2022-01-09T17:12:13.723' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (877, N'Donnie68', N'Olen_Mann@gmail.com', N'27IuyiRZsxbg2TY', N'https://loremflickr.com/640/480', CAST(N'2022-06-17T06:07:13.513' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (878, N'Bethel11', N'Zula_Reinger@hotmail.com', N'9AMVl1Pxofb9TrU', N'https://loremflickr.com/640/480', CAST(N'2022-10-22T13:56:57.820' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (879, N'Ruthie.Corkery', N'Toby6@yahoo.com', N'qesRvzKyY1sG7kl', N'https://loremflickr.com/640/480', CAST(N'2022-06-30T22:27:22.647' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (880, N'Adella_Langosh38', N'Chance_Lockman4@gmail.com', N'kYa7Ldl9vowqU9u', N'https://loremflickr.com/640/480', CAST(N'2022-08-05T14:33:38.553' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (881, N'Fay3', N'Aniyah_Breitenberg@yahoo.com', N'TCVmdbXo9C2aXZI', N'https://loremflickr.com/640/480', CAST(N'2022-11-02T03:35:11.993' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (882, N'Katrine_Mayert86', N'Emmitt0@yahoo.com', N'mHFRDY9A1ftH3Q0', N'https://loremflickr.com/640/480', CAST(N'2022-12-18T12:27:05.377' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (883, N'Sedrick81', N'Adolphus_McCullough@yahoo.com', N'flw_DXgdjRmNU0Z', N'https://loremflickr.com/640/480', CAST(N'2022-01-10T14:28:42.983' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (884, N'Karianne.Stamm', N'Annabell_Paucek@hotmail.com', N'wvLniKPwtYEhVfa', N'https://loremflickr.com/640/480', CAST(N'2022-01-22T15:09:16.050' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (885, N'Dorcas46', N'Margot22@gmail.com', N'I0Uu3vW9JWfFhxf', N'https://loremflickr.com/640/480', CAST(N'2023-10-19T20:27:20.537' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (886, N'Stephan_Abshire16', N'Robert.Huel10@hotmail.com', N'XZoOPPTyzMYYmlq', N'https://loremflickr.com/640/480', CAST(N'2023-09-07T03:20:10.933' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (887, N'Chase.Frami10', N'Armando.Spencer@hotmail.com', N'7QeJ2RwZlBQV8XH', N'https://loremflickr.com/640/480', CAST(N'2022-03-23T04:43:59.137' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (888, N'Tracey90', N'Aurelia_Schneider@yahoo.com', N'nnePgPqajCCmiH9', N'https://loremflickr.com/640/480', CAST(N'2023-12-11T11:24:01.953' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (889, N'Austen_Flatley44', N'Justen78@yahoo.com', N'ah7352BJRiv4v4g', N'https://loremflickr.com/640/480', CAST(N'2023-05-27T03:00:56.697' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (890, N'Amalia_Pouros', N'Immanuel_Grant@gmail.com', N'vNPZ1Hjgfquk9ki', N'https://loremflickr.com/640/480', CAST(N'2022-09-24T08:45:46.170' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (891, N'Tyrique_Ratke76', N'Rebekah25@gmail.com', N'CiP7_j8wI5Dsri1', N'https://loremflickr.com/640/480', CAST(N'2023-11-12T11:34:55.373' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (892, N'Alize48', N'Keenan25@yahoo.com', N'91_4dyx6Ek_Aq68', N'https://loremflickr.com/640/480', CAST(N'2022-09-15T14:24:54.507' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (893, N'Fletcher_Braun8', N'Zachery_Gerlach@hotmail.com', N'k4kaA06V1VQA7Pw', N'https://loremflickr.com/640/480', CAST(N'2023-10-15T15:39:09.637' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (894, N'Jillian.Hamill65', N'Tara_Kuhn@yahoo.com', N'U2WFlECAFGdRD51', N'https://loremflickr.com/640/480', CAST(N'2022-09-15T19:41:41.587' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (895, N'Pedro71', N'Javonte_Emard23@hotmail.com', N'nPpjUY8m48KBB4j', N'https://loremflickr.com/640/480', CAST(N'2023-10-03T09:50:56.070' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (896, N'Kameron_Russel81', N'Orpha.Schultz@gmail.com', N'6wCRvPn3VrEPFuJ', N'https://loremflickr.com/640/480', CAST(N'2022-07-31T18:16:12.873' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (897, N'Alexis.Sawayn94', N'Ladarius.Kulas34@hotmail.com', N'gLl3RK9e7OTNBVF', N'https://loremflickr.com/640/480', CAST(N'2023-08-07T02:36:12.333' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (898, N'Cheyenne_Bailey99', N'Newton42@yahoo.com', N'ymaBhVBGym8dQqY', N'https://loremflickr.com/640/480', CAST(N'2022-12-03T02:40:39.727' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (899, N'Chesley_Parker89', N'Murl_Connelly41@gmail.com', N'gliCUkQLFZgX8kI', N'https://loremflickr.com/640/480', CAST(N'2022-12-15T00:28:22.503' AS DateTime))
GO
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (900, N'Annamarie31', N'Alisha.Beier48@gmail.com', N'wRdsB5C1cNK07cl', N'https://loremflickr.com/640/480', CAST(N'2023-07-10T10:09:16.347' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (901, N'Adalberto_Conn', N'Tiana.Prohaska@gmail.com', N'aKSMPSXeYM3sQp_', N'https://loremflickr.com/640/480', CAST(N'2022-05-29T02:09:34.640' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (902, N'Bert.Jacobson43', N'Brandon_Kirlin59@hotmail.com', N'lpG1M4DDoIPIIm0', N'https://loremflickr.com/640/480', CAST(N'2022-05-22T21:09:18.203' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (903, N'Bettye.Bosco', N'Clifton.Homenick20@gmail.com', N'lLNdn6Xy1tLs3aZ', N'https://loremflickr.com/640/480', CAST(N'2022-10-29T13:51:17.713' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (904, N'Annabel.Jacobson71', N'Hazel_Kuhlman47@yahoo.com', N'b_9GessTF_K6_bb', N'https://loremflickr.com/640/480', CAST(N'2023-05-29T09:37:40.597' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (905, N'Kasey_Grimes', N'Elvis.Ullrich@hotmail.com', N'QeIDeiJ8MWI4WpV', N'https://loremflickr.com/640/480', CAST(N'2023-09-01T00:50:55.217' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (906, N'Davin_White4', N'Karen.Conroy94@gmail.com', N'PiNMKU8k3NmjGVi', N'https://loremflickr.com/640/480', CAST(N'2023-06-06T23:26:48.750' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (907, N'Adolf.Klein', N'Izaiah_Thompson@hotmail.com', N'jrFmUIkrkGCzHB1', N'https://loremflickr.com/640/480', CAST(N'2023-06-01T02:00:00.417' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (908, N'Dayne.Welch52', N'Freeda.Jones@yahoo.com', N'S_fDMPJKHMxuefb', N'https://loremflickr.com/640/480', CAST(N'2022-08-22T11:03:12.277' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (909, N'Manley.Okuneva44', N'King.Treutel@hotmail.com', N'Roc753DjLbZYl3F', N'https://loremflickr.com/640/480', CAST(N'2022-06-24T22:55:57.630' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (910, N'Caitlyn.Ritchie80', N'Freddie45@gmail.com', N'o8SFsqDmFxGHBDL', N'https://loremflickr.com/640/480', CAST(N'2022-01-15T04:25:57.263' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (911, N'Kiley.Walter', N'Jerrold_Weimann@gmail.com', N'gij8a3tnzyBW0dY', N'https://loremflickr.com/640/480', CAST(N'2022-07-13T16:22:19.727' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (912, N'Daphne.Baumbach26', N'Chesley73@gmail.com', N'ZUkXJ7B7E0NWGW6', N'https://loremflickr.com/640/480', CAST(N'2023-05-05T16:42:06.123' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (913, N'Wilhelm6', N'Otha_Mohr@gmail.com', N'h6jIt3wd6EMb7tm', N'https://loremflickr.com/640/480', CAST(N'2023-07-25T14:49:07.480' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (914, N'Cedrick_Keebler', N'Edward22@hotmail.com', N'UExZPqML8PnoX22', N'https://loremflickr.com/640/480', CAST(N'2023-12-15T05:03:18.977' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (915, N'Jeffry90', N'Tate49@gmail.com', N'tGmb3sZUZ4rfKJq', N'https://loremflickr.com/640/480', CAST(N'2022-04-05T08:59:35.880' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (916, N'Kane_Runolfsson', N'Francisca_Mante@yahoo.com', N'wdiwsXDzooxpTB8', N'https://loremflickr.com/640/480', CAST(N'2022-07-06T13:42:04.807' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (917, N'Ike36', N'Gwen_Dietrich90@hotmail.com', N'1SQ2tDts8aF1ULX', N'https://loremflickr.com/640/480', CAST(N'2023-06-24T18:25:33.480' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (918, N'Salvatore26', N'Edmund88@yahoo.com', N'L5dTWdhoLLg4Zoq', N'https://loremflickr.com/640/480', CAST(N'2022-08-03T04:33:46.880' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (919, N'Gerson96', N'Braeden.Schumm98@gmail.com', N'0HnZYL2D5Tn4zUj', N'https://loremflickr.com/640/480', CAST(N'2023-12-18T12:41:12.077' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (920, N'Evelyn_Rippin', N'Lance_Effertz84@yahoo.com', N'qVCmhvmlYDE7byK', N'https://loremflickr.com/640/480', CAST(N'2023-11-19T20:36:57.910' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (921, N'Keagan.Christiansen90', N'Dashawn.Hirthe@hotmail.com', N'rixJ9cDZHbisCQo', N'https://loremflickr.com/640/480', CAST(N'2023-12-12T16:18:47.260' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (922, N'Shayne38', N'Amari.Hand82@gmail.com', N'GwMOF5eo58J8Vfg', N'https://loremflickr.com/640/480', CAST(N'2022-12-06T20:45:31.837' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (923, N'Camilla.Considine73', N'Durward25@hotmail.com', N'KsBg_co9lXByhHK', N'https://loremflickr.com/640/480', CAST(N'2022-11-04T19:18:20.583' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (924, N'Marlon.Grady', N'Ulices.Hartmann@yahoo.com', N'GedHcLWt8PyDcsu', N'https://loremflickr.com/640/480', CAST(N'2023-06-24T06:22:00.187' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (925, N'Joelle82', N'Nicola_White0@yahoo.com', N'8myRuDWmkg8g6I4', N'https://loremflickr.com/640/480', CAST(N'2022-06-18T12:29:36.067' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (926, N'Phyllis57', N'Antonetta.Sanford@yahoo.com', N'w4FF7LW80hop51L', N'https://loremflickr.com/640/480', CAST(N'2022-07-03T10:01:02.720' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (927, N'Izaiah.Reichel', N'Estella_Upton85@gmail.com', N'nn5zyUJGXYfhsCd', N'https://loremflickr.com/640/480', CAST(N'2023-05-18T21:13:45.300' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (928, N'Bradly.Bernier', N'Breanna.DuBuque@hotmail.com', N'cCVjUH83Djx13Re', N'https://loremflickr.com/640/480', CAST(N'2022-11-15T12:20:10.037' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (929, N'Alfonso.Paucek56', N'Danyka.Jenkins@hotmail.com', N'YWIGDvszSxMmMGX', N'https://loremflickr.com/640/480', CAST(N'2023-11-05T20:33:24.443' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (930, N'Cordia86', N'Tessie90@hotmail.com', N'rNKNNhhV8RMwSBf', N'https://loremflickr.com/640/480', CAST(N'2022-02-03T14:47:14.640' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (931, N'Maia19', N'Damon.Upton17@hotmail.com', N'fMGOhPUaviNxc0x', N'https://loremflickr.com/640/480', CAST(N'2022-01-23T14:11:26.670' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (932, N'Edgardo_Spinka', N'Brooks39@hotmail.com', N'SUgXCMgMjMoxL98', N'https://loremflickr.com/640/480', CAST(N'2023-11-10T11:35:45.003' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (933, N'Elisa.Mante70', N'Hayley_Price5@gmail.com', N'MIbopmSGuVDjVDH', N'https://loremflickr.com/640/480', CAST(N'2023-11-04T23:29:13.303' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (934, N'Nicolette_Stroman', N'Seth49@gmail.com', N'kkb3bo7D7KY_TZ3', N'https://loremflickr.com/640/480', CAST(N'2022-04-14T05:06:56.823' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (935, N'Roselyn_Daniel5', N'Maximilian.Hamill60@yahoo.com', N'PURV19JXxygDJkk', N'https://loremflickr.com/640/480', CAST(N'2022-11-05T02:38:17.170' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (936, N'Armando_Christiansen', N'Wendy28@gmail.com', N'Zj_XqW1rg3T29aT', N'https://loremflickr.com/640/480', CAST(N'2022-10-10T21:24:20.470' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (937, N'Alanis.Feest61', N'Elian.Bins60@yahoo.com', N'E8OpXZPjrIXDvjP', N'https://loremflickr.com/640/480', CAST(N'2022-06-23T13:15:01.677' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (938, N'Amparo6', N'Leslie_Hermann32@gmail.com', N'F7qiVMQn1cfomIc', N'https://loremflickr.com/640/480', CAST(N'2023-07-14T00:13:46.053' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (939, N'Luz74', N'Doyle.Oberbrunner51@gmail.com', N'iI27VWNtCdvsTp4', N'https://loremflickr.com/640/480', CAST(N'2022-06-21T11:40:54.667' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (940, N'Hortense70', N'Murphy36@gmail.com', N'Qw4af4r1GTP5FRV', N'https://loremflickr.com/640/480', CAST(N'2022-09-03T06:28:34.143' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (941, N'Kelley25', N'Lauryn_Kilback34@gmail.com', N'grlUyBNI8XUzuts', N'https://loremflickr.com/640/480', CAST(N'2022-02-27T01:41:41.783' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (942, N'Agustin_Fisher', N'Christiana.Gleichner@gmail.com', N'uNH3UjfiCEbBI1t', N'https://loremflickr.com/640/480', CAST(N'2022-09-04T23:55:48.860' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (943, N'Riley_Mills79', N'Claudia.Block91@gmail.com', N'RsV_YcohzAB_av6', N'https://loremflickr.com/640/480', CAST(N'2022-09-18T13:39:59.857' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (944, N'Delpha_McCullough28', N'Bernhard_Ratke@hotmail.com', N'JPLekbwSmJ5bi9F', N'https://loremflickr.com/640/480', CAST(N'2023-11-13T03:16:51.340' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (945, N'Khalil_Bosco90', N'Ivy_Harvey6@gmail.com', N'fOmSiPmwZfOQBXn', N'https://loremflickr.com/640/480', CAST(N'2022-06-11T20:27:06.583' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (946, N'Clovis99', N'Ernie30@hotmail.com', N'lA__I52q0BIQ4S1', N'https://loremflickr.com/640/480', CAST(N'2022-05-31T19:36:21.117' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (947, N'Jarrett61', N'Mariano.Altenwerth@hotmail.com', N'_B1RddOB4f5iw47', N'https://loremflickr.com/640/480', CAST(N'2023-05-01T18:59:07.507' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (948, N'Kaia.Lynch', N'Percy_Bins@yahoo.com', N'wdb0ZlISvfhyB32', N'https://loremflickr.com/640/480', CAST(N'2022-03-31T00:05:15.137' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (949, N'Franco65', N'Eldridge.Streich83@gmail.com', N'3If2_2UpinRvTlF', N'https://loremflickr.com/640/480', CAST(N'2022-06-21T12:53:27.050' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (950, N'Robbie.Pfeffer74', N'Tressie_Yundt87@yahoo.com', N'EO_DJ4j5V7_wdqk', N'https://loremflickr.com/640/480', CAST(N'2022-03-05T23:26:30.927' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (951, N'Jackie_Konopelski', N'Christop.Ward45@hotmail.com', N'DczT7R8SYt_K81U', N'https://loremflickr.com/640/480', CAST(N'2023-02-05T03:43:08.360' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (952, N'Freddy6', N'Ines70@yahoo.com', N'hIjvPB46c0q3X3N', N'https://loremflickr.com/640/480', CAST(N'2023-01-04T15:36:45.820' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (953, N'Demetris30', N'Maymie_Waters@yahoo.com', N'0OXnB55PTQgjrF0', N'https://loremflickr.com/640/480', CAST(N'2022-11-24T05:49:47.627' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (954, N'Kelsi.Hand33', N'Jensen_Hayes63@yahoo.com', N'2c6C6D_YnKUbyfs', N'https://loremflickr.com/640/480', CAST(N'2022-02-16T23:37:19.207' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (955, N'Ariane_Erdman6', N'Rico.Rice@hotmail.com', N'EnQ8lPv48UGHAad', N'https://loremflickr.com/640/480', CAST(N'2023-07-05T07:40:20.353' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (956, N'Willard.Predovic11', N'Mac_Hirthe2@hotmail.com', N'TVjzKTH6QOHIXRI', N'https://loremflickr.com/640/480', CAST(N'2023-09-30T23:41:19.710' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (957, N'Gennaro.Greenholt', N'Chesley.Dare@yahoo.com', N'z4nwE7tV9wx0xsO', N'https://loremflickr.com/640/480', CAST(N'2022-05-26T00:31:50.127' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (958, N'Luz_Frami52', N'Eladio.Buckridge9@yahoo.com', N'F8N3BmMtBUASWpU', N'https://loremflickr.com/640/480', CAST(N'2022-06-08T23:28:28.950' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (959, N'Einar39', N'Kameron_Zboncak@gmail.com', N'0ZLByh7uNukB1ph', N'https://loremflickr.com/640/480', CAST(N'2022-02-15T13:01:04.273' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (960, N'Roderick.Stracke24', N'Brook_Vandervort31@yahoo.com', N'Jyl31PnVCvyta6Q', N'https://loremflickr.com/640/480', CAST(N'2023-07-08T14:05:27.297' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (961, N'Clementina.Cormier', N'Reilly84@gmail.com', N'5yMcQbrHcecEund', N'https://loremflickr.com/640/480', CAST(N'2023-12-30T15:03:38.567' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (962, N'Werner9', N'Elyse_Tillman36@yahoo.com', N'cjYJFoTlzQrxhdn', N'https://loremflickr.com/640/480', CAST(N'2023-02-28T15:58:25.710' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (963, N'Abdiel_McGlynn', N'Melba.Kuphal6@gmail.com', N'LfHvxJ3YOkjIoMi', N'https://loremflickr.com/640/480', CAST(N'2022-04-02T00:25:23.477' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (964, N'Jairo5', N'Anna.Baumbach29@yahoo.com', N'K46O9wR08kAXxf3', N'https://loremflickr.com/640/480', CAST(N'2023-12-09T06:23:04.393' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (965, N'Godfrey28', N'Stevie.Nicolas@gmail.com', N'wk7GRCYmRCeRg25', N'https://loremflickr.com/640/480', CAST(N'2022-04-01T20:05:12.573' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (966, N'Delta_Hansen20', N'Vernie.Reilly35@gmail.com', N'puFrPTaly9AzfNf', N'https://loremflickr.com/640/480', CAST(N'2023-12-17T20:03:11.477' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (967, N'Delilah_Schumm46', N'Dorothy.Keebler@hotmail.com', N'WvyiVOw8QSe1VQp', N'https://loremflickr.com/640/480', CAST(N'2023-01-07T01:57:39.530' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (968, N'Jovani.Murazik89', N'Godfrey0@hotmail.com', N'HCN9EU23pJeQn7R', N'https://loremflickr.com/640/480', CAST(N'2022-02-10T07:11:37.487' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (969, N'Jade.Hayes72', N'Loren.Roob81@yahoo.com', N'u3ODveBf3e1VDrr', N'https://loremflickr.com/640/480', CAST(N'2023-10-31T03:49:30.920' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (970, N'Cayla_Gerhold', N'Ariane_Bernhard@gmail.com', N'y2TO76ocxFz9O8N', N'https://loremflickr.com/640/480', CAST(N'2022-09-01T02:24:24.377' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (971, N'Lily63', N'Gene34@yahoo.com', N'TBzTSySE4pwaKwV', N'https://loremflickr.com/640/480', CAST(N'2023-10-08T00:16:00.737' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (972, N'Janick.Walter', N'Mikel.Berge92@yahoo.com', N'fOZ89y45vALNjr6', N'https://loremflickr.com/640/480', CAST(N'2022-02-23T03:48:32.750' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (973, N'Toby92', N'Charlotte.Feeney42@hotmail.com', N'aBwHztfKoM62mhk', N'https://loremflickr.com/640/480', CAST(N'2023-04-11T15:45:38.540' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (974, N'Jerrold_Murphy', N'Angie68@yahoo.com', N'zC6zdno6tXGS9IL', N'https://loremflickr.com/640/480', CAST(N'2022-06-18T09:48:57.463' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (975, N'Robin27', N'Charlene70@hotmail.com', N'EgM8EiZw6zHNBcG', N'https://loremflickr.com/640/480', CAST(N'2022-07-31T00:14:37.930' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (976, N'Iva97', N'Kelton_Bergstrom58@hotmail.com', N'C2z9eJi43PNJHAd', N'https://loremflickr.com/640/480', CAST(N'2023-06-26T11:29:18.413' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (977, N'Jerad64', N'Angelita_Feest64@gmail.com', N'mVKtG4McR84YPVh', N'https://loremflickr.com/640/480', CAST(N'2023-05-10T23:01:54.437' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (978, N'Beau_Stoltenberg', N'Alexandre_Thompson@gmail.com', N'C651CdeY4EcVRjh', N'https://loremflickr.com/640/480', CAST(N'2022-10-31T09:21:38.107' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (979, N'Kaylin.OKeefe35', N'Eliza_Mayert@hotmail.com', N'aX8svDWNt37AzHu', N'https://loremflickr.com/640/480', CAST(N'2023-11-11T21:32:42.437' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (980, N'Jedidiah.Schowalter', N'Carissa_Funk@gmail.com', N'0V5PFrrHpChlWpw', N'https://loremflickr.com/640/480', CAST(N'2022-03-28T03:08:10.373' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (981, N'Reyes_Zulauf7', N'Zechariah_Volkman@gmail.com', N'4Nv6j5Ds_DUgsfE', N'https://loremflickr.com/640/480', CAST(N'2023-06-06T21:58:28.223' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (982, N'Miguel_Miller60', N'Lavinia.Kunde28@hotmail.com', N'9fMSpSdLKWYUAn9', N'https://loremflickr.com/640/480', CAST(N'2022-07-07T11:45:59.140' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (983, N'Gustave_Hilpert32', N'Ola30@yahoo.com', N'kxTScaEAMA8sUL2', N'https://loremflickr.com/640/480', CAST(N'2023-12-03T20:42:27.210' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (984, N'Dustin65', N'Raleigh.Leffler49@gmail.com', N'eAxubF_HJdqrH1H', N'https://loremflickr.com/640/480', CAST(N'2022-03-15T11:23:46.177' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (985, N'Haylee45', N'Abdullah93@gmail.com', N'E4vU9BGD4akY4Ce', N'https://loremflickr.com/640/480', CAST(N'2023-11-11T13:40:14.330' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (986, N'Domenic.Nienow24', N'Dewayne.Raynor19@gmail.com', N'0vSMNiu8UcKeXrY', N'https://loremflickr.com/640/480', CAST(N'2022-07-02T07:48:13.600' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (987, N'Margie_Marvin93', N'America_Predovic88@gmail.com', N'V51Wh06RpVyOGVu', N'https://loremflickr.com/640/480', CAST(N'2022-08-25T06:01:22.653' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (988, N'Norbert.Feeney25', N'Zelma.Collier80@hotmail.com', N'pgnkMRRs24SjIv1', N'https://loremflickr.com/640/480', CAST(N'2022-06-28T14:35:03.187' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (989, N'Lourdes.Aufderhar', N'Brain51@gmail.com', N'QQzog_lMN2LlGHW', N'https://loremflickr.com/640/480', CAST(N'2023-11-24T09:49:27.067' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (990, N'Thalia63', N'Caleigh_Tromp91@hotmail.com', N'W9YrVFfc2cHYnTM', N'https://loremflickr.com/640/480', CAST(N'2022-09-24T11:24:09.867' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (991, N'Jacquelyn_Hagenes29', N'Blair_Haley68@hotmail.com', N'Q49647tDpPhXl1T', N'https://loremflickr.com/640/480', CAST(N'2022-09-25T13:46:49.677' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (992, N'Coleman_Volkman61', N'Miller94@gmail.com', N'frwJ2RjjAq0I4UY', N'https://loremflickr.com/640/480', CAST(N'2023-01-10T22:40:43.413' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (993, N'Eloise79', N'Royce37@yahoo.com', N'BVRuOajMUpmyF2o', N'https://loremflickr.com/640/480', CAST(N'2023-08-04T05:59:08.530' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (994, N'Garfield28', N'Creola.Lakin@hotmail.com', N'zTTQU_bh7358Hue', N'https://loremflickr.com/640/480', CAST(N'2022-10-24T13:20:53.080' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (995, N'Loyal28', N'Marjolaine_Kris@yahoo.com', N'y88S99vHSE0M6ug', N'https://loremflickr.com/640/480', CAST(N'2023-12-19T04:09:18.557' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (996, N'Carmella_Harber', N'Lafayette_Stamm99@hotmail.com', N'LAGNi21f0K4NIVa', N'https://loremflickr.com/640/480', CAST(N'2022-12-07T17:39:22.257' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (997, N'Clint_Hammes', N'Keshawn31@gmail.com', N'lhOi34k0uHVCqCi', N'https://loremflickr.com/640/480', CAST(N'2022-05-17T19:41:38.490' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (998, N'Malinda_Zulauf', N'Jensen.Boehm@gmail.com', N'OvknBEnrTshzB4Q', N'https://loremflickr.com/640/480', CAST(N'2023-12-01T11:31:07.430' AS DateTime))
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (999, N'Elvera20', N'Deion20@yahoo.com', N'4J0a7NDgmAYbqH3', N'https://loremflickr.com/640/480', CAST(N'2022-10-11T17:52:18.027' AS DateTime))
GO
INSERT [dbo].[Users] ([id], [username], [email], [password_hash], [profile_picture], [created_at]) VALUES (1000, N'Charity18', N'Hulda.Johnson53@hotmail.com', N'Vwoy6UGggAjro7H', N'https://loremflickr.com/640/480', CAST(N'2022-11-08T09:54:36.767' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Squads__72E12F1B38FB5DBD]    Script Date: 29/09/2024 10:38:49 CH ******/
ALTER TABLE [dbo].[Squads] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Subscriptions]    Script Date: 29/09/2024 10:38:49 CH ******/
ALTER TABLE [dbo].[Subscriptions] ADD  CONSTRAINT [UQ_Subscriptions] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[followed_tag_id] ASC,
	[followed_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tags__72E12F1BC08B3E54]    Script Date: 29/09/2024 10:38:49 CH ******/
ALTER TABLE [dbo].[Tags] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Topic__72E12F1B2B80FB20]    Script Date: 29/09/2024 10:38:49 CH ******/
ALTER TABLE [dbo].[Topic] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E616496D1E737]    Script Date: 29/09/2024 10:38:49 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC572ABCB1280]    Script Date: 29/09/2024 10:38:49 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Squad_Members] ADD  DEFAULT ('member') FOR [role]
GO
ALTER TABLE [dbo].[Article_Squads]  WITH CHECK ADD  CONSTRAINT [FK_Article_Squads_Articles] FOREIGN KEY([article_id])
REFERENCES [dbo].[Articles] ([id])
GO
ALTER TABLE [dbo].[Article_Squads] CHECK CONSTRAINT [FK_Article_Squads_Articles]
GO
ALTER TABLE [dbo].[Article_Squads]  WITH CHECK ADD  CONSTRAINT [FK_Article_Squads_Squads] FOREIGN KEY([squad_id])
REFERENCES [dbo].[Squads] ([id])
GO
ALTER TABLE [dbo].[Article_Squads] CHECK CONSTRAINT [FK_Article_Squads_Squads]
GO
ALTER TABLE [dbo].[Article_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Article_Tags_Articles] FOREIGN KEY([article_id])
REFERENCES [dbo].[Articles] ([id])
GO
ALTER TABLE [dbo].[Article_Tags] CHECK CONSTRAINT [FK_Article_Tags_Articles]
GO
ALTER TABLE [dbo].[Article_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Article_Tags_Tags] FOREIGN KEY([tag_id])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[Article_Tags] CHECK CONSTRAINT [FK_Article_Tags_Tags]
GO
ALTER TABLE [dbo].[Article_Topic]  WITH CHECK ADD  CONSTRAINT [FK_Article_Topic_Articles] FOREIGN KEY([article_id])
REFERENCES [dbo].[Articles] ([id])
GO
ALTER TABLE [dbo].[Article_Topic] CHECK CONSTRAINT [FK_Article_Topic_Articles]
GO
ALTER TABLE [dbo].[Article_Topic]  WITH CHECK ADD  CONSTRAINT [FK_Article_Topic_Topic] FOREIGN KEY([topic_id])
REFERENCES [dbo].[Topic] ([id])
GO
ALTER TABLE [dbo].[Article_Topic] CHECK CONSTRAINT [FK_Article_Topic_Topic]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_RSS_Sources] FOREIGN KEY([rss_id])
REFERENCES [dbo].[RSS_Sources] ([id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_RSS_Sources]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Users]
GO
ALTER TABLE [dbo].[Bookmarks]  WITH CHECK ADD  CONSTRAINT [FK_Bookmarks_Articles] FOREIGN KEY([article_id])
REFERENCES [dbo].[Articles] ([id])
GO
ALTER TABLE [dbo].[Bookmarks] CHECK CONSTRAINT [FK_Bookmarks_Articles]
GO
ALTER TABLE [dbo].[Bookmarks]  WITH CHECK ADD  CONSTRAINT [FK_Bookmarks_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Bookmarks] CHECK CONSTRAINT [FK_Bookmarks_Users]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Articles] FOREIGN KEY([article_id])
REFERENCES [dbo].[Articles] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Articles]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Reactions]  WITH CHECK ADD  CONSTRAINT [FK_Reactions_Articles] FOREIGN KEY([article_id])
REFERENCES [dbo].[Articles] ([id])
GO
ALTER TABLE [dbo].[Reactions] CHECK CONSTRAINT [FK_Reactions_Articles]
GO
ALTER TABLE [dbo].[Reactions]  WITH CHECK ADD  CONSTRAINT [FK_Reactions_Comments] FOREIGN KEY([comment_id])
REFERENCES [dbo].[Comments] ([id])
GO
ALTER TABLE [dbo].[Reactions] CHECK CONSTRAINT [FK_Reactions_Comments]
GO
ALTER TABLE [dbo].[Reactions]  WITH CHECK ADD  CONSTRAINT [FK_Reactions_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Reactions] CHECK CONSTRAINT [FK_Reactions_Users]
GO
ALTER TABLE [dbo].[Squad_Members]  WITH CHECK ADD  CONSTRAINT [FK_Squad_Members_Squads] FOREIGN KEY([squad_id])
REFERENCES [dbo].[Squads] ([id])
GO
ALTER TABLE [dbo].[Squad_Members] CHECK CONSTRAINT [FK_Squad_Members_Squads]
GO
ALTER TABLE [dbo].[Squad_Members]  WITH CHECK ADD  CONSTRAINT [FK_Squad_Members_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Squad_Members] CHECK CONSTRAINT [FK_Squad_Members_Users]
GO
ALTER TABLE [dbo].[Squads]  WITH CHECK ADD  CONSTRAINT [FK_Squads_Users] FOREIGN KEY([created_by])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Squads] CHECK CONSTRAINT [FK_Squads_Users]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_Followed_Users] FOREIGN KEY([followed_user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Followed_Users]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_Tags] FOREIGN KEY([followed_tag_id])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Tags]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Users]
GO
ALTER TABLE [dbo].[Topic_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Tags_Tags] FOREIGN KEY([tag_id])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[Topic_Tags] CHECK CONSTRAINT [FK_Topic_Tags_Tags]
GO
ALTER TABLE [dbo].[Topic_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Tags_Topic] FOREIGN KEY([topic_id])
REFERENCES [dbo].[Topic] ([id])
GO
ALTER TABLE [dbo].[Topic_Tags] CHECK CONSTRAINT [FK_Topic_Tags_Topic]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD CHECK  (([source_type]='rss' OR [source_type]='user'))
GO
ALTER TABLE [dbo].[Reactions]  WITH CHECK ADD CHECK  (([type]='clap' OR [type]='upvote' OR [type]='like'))
GO
ALTER TABLE [dbo].[Squad_Members]  WITH CHECK ADD CHECK  (([role]='admin' OR [role]='member'))
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [CK_Subscriptions_TagOrUser] CHECK  (([followed_tag_id] IS NOT NULL AND [followed_user_id] IS NULL OR [followed_tag_id] IS NULL AND [followed_user_id] IS NOT NULL))
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [CK_Subscriptions_TagOrUser]
GO
USE [master]
GO
ALTER DATABASE [daily_dev] SET  READ_WRITE 
GO
