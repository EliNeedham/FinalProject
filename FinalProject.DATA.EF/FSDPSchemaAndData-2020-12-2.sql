
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/2/2020 9:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/2/2020 9:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/2/2020 9:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/2/2020 9:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/2/2020 9:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Homes]    Script Date: 12/2/2020 9:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Homes](
	[HomeId] [int] IDENTITY(1,1) NOT NULL,
	[HomeName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[OwnderId] [nvarchar](128) NOT NULL,
	[HomePhoto] [varchar](50) NULL,
	[SpecialNotes] [varchar](300) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateAdded] [date] NOT NULL,
 CONSTRAINT [PK_Homes] PRIMARY KEY CLUSTERED 
(
	[HomeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 12/2/2020 9:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[ReservationLimit] [tinyint] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 12/2/2020 9:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[HomeId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[ReservationDate] [date] NOT NULL,
	[ServiceId] [int] NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 12/2/2020 9:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceType] [varchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[Description] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/2/2020 9:03:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[CompanyName] [nvarchar](100) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[UserPhoto] [varchar](50) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202011162152038_InitialCreate', N'FinalProject.MVC.UI.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E2F70FE83A0A7738AAC954B77B127B0B7489DB80DCEE68275B2386F0B5AA21D9D9528AD44A5090EFACBFAD09FD4BFD0A144DD78D1C5566CA758606191C36F86C321391C0EF3E7EF7F8C7F7CF23DE31147B11B908979343A340D4CECC071C96A622674F9E6BDF9E3877F7C37BE70FC27E3734E77C2E8A0258927E603A5E1A965C5F603F6513CF25D3B0AE260494776E05BC809ACE3C3C37F5B474716060813B00C63FC2921D4F571FA019FD380D838A409F2AE02077B312F879A798A6A5C231FC721B2F1C49CB90479B751F03F6CD3D1D5E7E9E8FE7294B5328D33CF4520D11C7B4BD3408404145190F7F43EC6731A0564350FA1007977CF2106BA25F262CCFB715A9277EDD2E131EB925536CCA1EC24A681DF13F0E884EBC8129BAFA569B3D02168F102B44D9F59AF534D4ECC4B07A7459F020F1420323C9D7A11239E9857058BB338BCC67494371C6590B308E07E0DA2AFA32AE281D1B9DD416153C7A343F6EFC098261E4D223C2138A111F20E8CDB64E1B9F67FF0F35DF01593C9C9D16279F2FEED3BE49CBCFB019FBCADF614FA0A74B50228026B097104B2E165D17FD3B0EAED2CB161D1ACD226D30AD8124C0FD3B8424F1F3159D1079838C7EF4D63E63E61272FE1C6754F5C984DD08846097C5E279E87161E2EEAAD469EECFF06AEC76FDF0DC2F51A3DBAAB74E805FE30712298579FB097D6C60F6E984DAFDA787FE164B328F0D977DDBEB2DA2FF320896CD699404B7287A215A675E9C65669BC9D4C9A410D6FD639EAFE9B369354366F2529EBD03A332167B1EDD990CBFBB27C3B5BDC5918C2E0A5A6C534D26470FA4D6B24A01C180ADAD2948EBA9A12812EFE9D57C60B1FB9DE004B63072EE09D2CDDC8C7452F7F0AC01011E92DF32D8A6358199C5F50FCD0203AFC1C40F439B693080C764E911FBE38B7DB8780E0EBC45FB079B03D5E830DCDDDAFC10CD934882E086BB531DEC7C0FE1A24F48238E788E27B6AE780ECF3CEF5BB030C22CE996DE3389E813163671A80F39D035E127A72DC1B8E2D54BB764DA61E727DB56F222CA95F72D2D23F5153483E8A864CE5A73489FA3158B9A49BA839A95ED48CA255544ED6575406D64D524EA9173425689533A31ACCF34B476878D72F85DD7FDF6FB3CD5BB71654D438871512FF8C098E6019736E11A53822E50874593776E12CA4C3C798BEF8DE9472FA8CBC6468566BCD867411187E36A4B0FB3F1B5231A1F8D1759857D2E1409413037C277AF559AB7DCE09926D7B3AD4BAB96DE6DB590374D3E52C8E03DB4D67812214C6031975F9C18733DAA31A596FC4C808740C0CDD655B1E9440DF4CD1A86EC839F630C5C6999D850AA728B69123AB113AE4F4102CDF511582951192BA70DF4B3CC1D271C41A2176088A61A6BA84CAD3C225B61B22AF554B42CB8E5B18EB7BC143AC39C721268C61AB26BA305707449800051F6150DA3434B62A16D76C881AAF5537E66D2E6C39EE529C622B36D9E23B6BEC92FB6F2F6298CD1ADB827136ABA48B00DAE0DE2E0C949F55BA1A807870D93703154E4C1A03E52ED5560CB4AEB11D18685D25AFCE40B3236AD7F117CEABFB669EF583F2F6B7F54675EDC0366BFAD833D3CC7C4F6843A1058E64F33C5FB04AFC4415873390939FCF62EEEA8A26C2C0E798D64336A5BFABF443AD6610D1889A004B436B01E5D782129034A17A0897C7F21AA5E35E440FD83CEED608CBD77E01B662033276F57AB442A8BF44158DB3D3E9A3E859610D9291773A2C54701406212E5EF58E77508A2E2E2B2BA68B2FDCC71BAE748C0F4683825A3C578D92F2CE0CAEA5DC34DBB5A472C8FAB8641B6949709F345ACA3B33B896B88DB62B49E114F4700B3652517D0B1F68B2E5918E62B729EAC656963DC50BC69626CD6A7C85C2D025AB4ADA152F31E659CED5F4CDBC7F12929F615876ACC8452AA42D38D120422B2CD4026B9074E646313D47142D108BF34C1D5F2253EEAD9AE53F6759DD3EE541CCF7819C9AFDCE5A345CE6D7F65CD929E15833E8A9CF3C9B349CAEB003757383A5C3210F458A08FE34F0129FE81D2D7DEBEC1EAFDA3E2B9111C69620BFE448495A93DCDDFA10741A2079720C3C58853FB3FE80E921746ACFBDD1AAE2751EAA1E250F5855517441AC9D0DA0CEB1596BD044DFB1FF98B522BCCC3CE3092B55005ED413A392F3208155EABAA3D6D352AA98F59AEE8842EE491552A8EA216535C3A42664B5622D3C8D46D514DD39C839255574B9B63BB222BBA40AADA85E035B21B358D71D5591805205565477C72EB351C4C5748F7732ED8966E3AD2C3BFC6EB69769305E66651C662BACDCF157812AC53DB1F82DBE04C6CBF7D2AAB427C08DAD2A8B7D6C66551A0CFD4A54BB25AF2F448D57FB7ACCDAD5776DB16FBAFAD7E3F5B3DD17B510E920289214DC8B03A170F01BF34358FB231CE95496919846AE46D8E89F638AFD112318CDBF7953CFC56C59CF09AE10719738A659BA87797C78742CBCDFD99FB734561C3B9EE210AB7B50531FB32D646E914714D90F2892F32836786F52824A21EA4BE2E0A789F9FFB4D5691AED60BFD2E203E332BE27EEB7042AEEA2041BBFC979A1C3E4DF7778F15108FADBAB784AD15DE597FFFD92353D306E22984EA7C6A1A0E87586BFFEC0A2973459D30DA459FBD9C5EB9D6DB5370C4A5461B6ACFF6461E1D2419E2BE452FED3474FFFEA2B9AF249C246888A670743E10DA242DDB38275B0B44F0A1CF8A4E993827E9D553F31584734EDF30297F407131F17745F86F2963BDC871407A76D2C49A99E5B93B337CAD4DCF5DE24E5706F34D1E53CED1E7083E6626FE6A2BCB21CE7C1B64E450AF360D8BBB4FB17CF5BDE9754E5D269DF6D86F23693921B2E9AFE56B9C87B903DA7C806DA7DC6F1B66D4D1709DEF3B4CD7E79C57B666C7C9BDF7DF6F0B68D4D1720DE7363EB9523BC67B6B6ABFD73C796D6790BDD79C6AF9CBCA4B9D1514591DB327AB3903B1CFF17011841E651660F31D529644DE9AF2D0C4B123D537DEE9AC8589A38125F89A2996DBFBEF20DBFB1B39CA699AD26E3B389375FFF1B79739A66DE9A3CCA5DE4222B331955F9E12DEB58535AD56BCA3DAEF5A425D5BDCD676DBC9E7F4DA9C68328A5367B34B7CBAF27B37810950C39757A6412CB17C5B07756FEA623ECDFB1BB2A21D85F7824D8AEED9A05CD255906F9E62D48949308119A2B4C91035BEA5944DD25B22954B30074FA923C0DEAB16B9005762EC94D42C3844297B1BFF06A012FE60434F14FD3A5EB328F6F42F6150FD10510D36581FB1BF253E27A4E21F74C1113D24030EF82877BD9585216F65D3D1748D701E908C4D557384577D80F3D008B6FC81C3DE2756403F3FB8857C87E2E23803A90F681A8AB7D7CEEA25584FC986394EDE1136CD8F19F3EFC058A401194DA540000, N'6.2.0-61023')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'fbea1706-e75d-43f9-a584-b2a80283641d', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'318459d1-6762-4e8e-9a2a-f96a342a138b', N'Client')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'4980a00c-6ed6-4c6d-9b88-df5596e3244a', N'Employee')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'189df4a0-925b-43f4-b5dd-80aae8173a27', N'318459d1-6762-4e8e-9a2a-f96a342a138b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'25ad51e0-fa72-4d57-a09d-ab7b315ad500', N'318459d1-6762-4e8e-9a2a-f96a342a138b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'32e28007-0c10-46c6-b4ea-df63ec20de58', N'318459d1-6762-4e8e-9a2a-f96a342a138b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4e9bd8f5-e875-4392-beae-6654b8740a86', N'318459d1-6762-4e8e-9a2a-f96a342a138b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'687ba335-1b56-4d69-9723-7c507028617f', N'318459d1-6762-4e8e-9a2a-f96a342a138b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'adca5feb-3a78-4d7b-afd5-748119870080', N'318459d1-6762-4e8e-9a2a-f96a342a138b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b0d283a1-c986-4490-ac49-a8ef5158567f', N'318459d1-6762-4e8e-9a2a-f96a342a138b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e781e3d7-3c3a-4327-b491-d1b3ffd2af49', N'318459d1-6762-4e8e-9a2a-f96a342a138b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e85d57f0-ff04-4e0c-9907-4d8dc349cf88', N'318459d1-6762-4e8e-9a2a-f96a342a138b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2ae4d393-48bc-4959-8d72-9de0fb17b8b1', N'4980a00c-6ed6-4c6d-9b88-df5596e3244a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9fa8e4df-df88-4921-94b3-0a8e58567b06', N'fbea1706-e75d-43f9-a584-b2a80283641d')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'189df4a0-925b-43f4-b5dd-80aae8173a27', N'E@youneedham.net', 0, N'AGT+lTZjMFHnC5oSMjF7yCi75Y8Y4G6Wh7lu5AVeFjvQTM+g2dS1mrk+qmSqVoYIww==', N'217ed41f-6165-4612-80aa-62aa7cd1bc46', NULL, 0, 0, NULL, 1, 0, N'E@youneedham.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'25ad51e0-fa72-4d57-a09d-ab7b315ad500', N'CW@walken.com', 0, N'AL/6xbysFHMJtUq+He0oezrYG4eSdiOj8rIxprdcW2inaKXZlYHrggmO5ByJtS+LgQ==', N'cdc0a9bc-2d24-4b77-ada2-5d3db7da5c3b', NULL, 0, 0, NULL, 1, 0, N'CW@walken.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2ae4d393-48bc-4959-8d72-9de0fb17b8b1', N'DReed@maidinkc.com', 0, N'AF9UqOcbE4iVtkUyxsszQIz+XnLPTcSsXye16wl3yMZYEc7OZYkskqoOz+Nfzheasg==', N'b78c0f34-cc4a-4fa3-8197-84b67843d74f', NULL, 0, 0, NULL, 1, 0, N'DReed@maidinkc.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'32e28007-0c10-46c6-b4ea-df63ec20de58', N'Faith@faith.com', 0, N'ABQClROIjFM2PM7iZD/nwv+Bnh6pFRFTqdAqTW0om3EQVg1ldREiyJst09cOekyedA==', N'a6b43d88-c79a-44aa-8840-440ce725176e', NULL, 0, 0, NULL, 1, 0, N'Faith@faith.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4e9bd8f5-e875-4392-beae-6654b8740a86', N'jeff@jeff.com', 0, N'AIa2Xcf+2HkjcEmRprPaVscdA0Z2C4NcjP3Q7RTOSG944ii+p3p0K0htguswKms5VQ==', N'ac737906-bad7-4d4e-b68f-ba8077ab792f', NULL, 0, 0, NULL, 1, 0, N'jeff@jeff.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'687ba335-1b56-4d69-9723-7c507028617f', N'Chris@superman.com', 0, N'AHd3uNPu7CR5cuwQUZOFYWdeiri0BrbgPHPnzwVb/ju6fjt40Yw1eV5XaA61qn1lnA==', N'b898557f-397f-4450-9f28-1ad0a2923519', NULL, 0, 0, NULL, 1, 0, N'Chris@superman.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9fa8e4df-df88-4921-94b3-0a8e58567b06', N'BossMaid@MaidinKC.com', 0, N'AHfQl1uCmHg3IFegIkbemIjt4sjTVGqN7+ln7BsE4kPuVLRPtexO+dThpUVB6NHX/g==', N'7b93e181-3e8b-4d6c-99dc-b6efcfdede5c', NULL, 0, 0, NULL, 1, 0, N'BossMaid@MaidinKC.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'adca5feb-3a78-4d7b-afd5-748119870080', N'el@youneedham.net', 0, N'AC4YNRqZ2bV2f+m/SYc6m5b21rLGkFSp8kF0XhrQGnnxlXk6TVbrBL0aHYnacgyQBQ==', N'58b34395-f37c-44cc-a41e-4378902387a6', NULL, 0, 0, NULL, 1, 0, N'el@youneedham.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b0d283a1-c986-4490-ac49-a8ef5158567f', N'DReed@dogue.com', 0, N'ACb04xQjHrHRYDc6zke9W1qsG1+GPePjD5ALmin9R1U50gcUJ7cd6JBiCzCFX30uBw==', N'f4aac74a-3b15-4b2c-adeb-b04688104b12', NULL, 0, 0, NULL, 1, 0, N'DReed@dogue.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bc1bfd95-0029-423c-b9d2-d8cc4ebdb0c3', N'Woody@Carpentry.com', 0, N'AIieYTkzKjIMwjyrZECLi/Cac6GECKlUWfaN45XHT3J0WklBPkR9wXWxVnKGwsfFYQ==', N'7b444ae9-fdad-4acd-8049-8b60fbf5ecc5', NULL, 0, 0, NULL, 1, 0, N'Woody@Carpentry.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e781e3d7-3c3a-4327-b491-d1b3ffd2af49', N'Justin@kennedy.com', 0, N'AFfnZajzoKdFTxhi798GGKk+hkaO+k/PAq4+HVRXa2k/k4bbr9pmidqp3JTd5+2PPA==', N'9defdbe6-0faa-48f3-b3fa-41f60929e92a', NULL, 0, 0, NULL, 1, 0, N'Justin@kennedy.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e85d57f0-ff04-4e0c-9907-4d8dc349cf88', N'chad@way.com', 0, N'AIhvDffEC9cbdiX3pMjIZfEp991VMGwMXQ+iI47rPP6sLfmtRozpTBx1mbVsvAu0hg==', N'b454f7c3-90e5-4649-99e2-9aafc91aea05', NULL, 0, 0, NULL, 1, 0, N'chad@way.com')
GO
SET IDENTITY_INSERT [dbo].[Homes] ON 

INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (8, N'Chateau', N'1 Chateau St', N'Leawood', N'KS', N'85469', N'32e28007-0c10-46c6-b4ea-df63ec20de58', N'fc555905-bd20-4216-8890-f637d9036ca9.jpg', N'some cobbles have come loose, avoid them', 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (9, N'Castelago', N'455 East elm', N'KC', N'MO', N'64110', N'32e28007-0c10-46c6-b4ea-df63ec20de58', N'2f32d5ec-b05f-488f-86dd-d997fb0a5a10.jpg', N'looks like it''s never been dusted', 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (10, N'The Neuschwanstein', N'1 Black Forest Dr', N'Schwangau', N'DE', N'55555', N'32e28007-0c10-46c6-b4ea-df63ec20de58', N'b2e6c146-f7bb-4366-94e8-f0436a13b00c.jpg', N'might need several workers on this one', 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (11, N'Canard', N'5 Water Way', N'Overland Park', N'KS', N'55555', N'32e28007-0c10-46c6-b4ea-df63ec20de58', N'003b93d4-9c51-4907-9fbe-2cca805b6949.jpg', N'a bit wet', 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (12, N'The Monty Python', N'1 Moat Rd', N'Peril', N'UK', N'45862', N'e781e3d7-3c3a-4327-b491-d1b3ffd2af49', N'665a36ae-6fc2-47e8-bd8b-6b584b8c5764.jpg', N'Access is by rowboat only, but you could probably also wade..', 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (13, N'Dog House', N'58 Canine Way', N'Kansas City', N'MO', N'85462', N'32e28007-0c10-46c6-b4ea-df63ec20de58', N'6d81100d-fa1c-41b3-97d6-bc0faf9fb094.jpg', N'quick job', 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (14, N'Maison ', N'5986 Ice Way', N'Leawood', N'KS', N'86592', N'687ba335-1b56-4d69-9723-7c507028617f', N'8abe293c-f1a4-4dfe-b83e-424bf197587e.jpg', N'bundle up for this job', 0, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (15, N'Dolomite Shack', N'8564 Via di Bondone', N'Paganella', N'MO', N'85236', N'687ba335-1b56-4d69-9723-7c507028617f', N'bca531b8-c082-4e08-a741-06a0e95e75b8.jpg', N'easy work', 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (16, N'TeePee', N'8526 Whatevs St', N'Overland Park', N'KS', N'85462', N'687ba335-1b56-4d69-9723-7c507028617f', N'8e82cfd5-0636-4198-ad5f-ed83c69fd651.jpg', N'dusty', 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (17, N'Primrose Cottage', N'8592 Cottage Way', N'Kansas City', N'MO', N'85269', N'25ad51e0-fa72-4d57-a09d-ab7b315ad500', N'15eb7202-92d0-4cc2-b5e6-9f3c20098c97.jpg', N'floors need work', 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (18, N'The Laurel', N'85 Laurel Ct', N'Kansas City', N'Mo', N'64120', N'25ad51e0-fa72-4d57-a09d-ab7b315ad500', N'87e46662-4ef2-4d57-985c-972d26c5101a.jpg', N'musty', 0, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (19, N'The Ives', N'8543 Ivy St', N'Kansas City', N'MO', N'64150', N'bc1bfd95-0029-423c-b9d2-d8cc4ebdb0c3', N'0b8b2f7e-60b9-402c-b2ad-f759fa597027.jpg', N'bathtub has stain', 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Homes] ([HomeId], [HomeName], [Address], [City], [State], [ZipCode], [OwnderId], [HomePhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (20, N'Tree House', N'856 Treetop Ave', N'Kansas City', N'Mo', N'85462', N'bc1bfd95-0029-423c-b9d2-d8cc4ebdb0c3', N'119c3a04-366e-4fc8-83be-50655c818730.jpg', N'wind blows dust around', 1, CAST(N'2020-11-18' AS Date))
SET IDENTITY_INSERT [dbo].[Homes] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (1, N'Bookside', N'123 55th Street', N'Kansas City', N'MO', N'64110', 5)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (2, N'Leawood', N'456 127th St', N'Leawood', N'KS', N'66211', 5)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (3, N'Overland Park', N'889 W 135th St', N'Overland Park', N'KS', N'66221', 5)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (4, N'Crossroads', N'789 W 18th St', N'Kansas City', N'Mo', N'64108', 5)
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (1, 8, 1, CAST(N'2020-11-29' AS Date), 1)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (2, 14, 3, CAST(N'2020-11-30' AS Date), 1)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (3, 15, 1, CAST(N'2020-11-30' AS Date), 2)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (4, 17, 4, CAST(N'2020-12-25' AS Date), 4)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (5, 18, 2, CAST(N'2020-12-12' AS Date), 3)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (6, 13, 1, CAST(N'2020-12-13' AS Date), 2)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (7, 8, 1, CAST(N'2020-12-13' AS Date), 1)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (8, 9, 1, CAST(N'2020-11-30' AS Date), 4)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (9, 10, 4, CAST(N'2020-12-05' AS Date), 1)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (10, 11, 1, CAST(N'2020-12-05' AS Date), 2)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (11, 12, 1, CAST(N'2020-11-30' AS Date), 1)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (12, 12, 1, CAST(N'2020-11-30' AS Date), 3)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (13, 12, 1, CAST(N'2020-11-30' AS Date), 1)
INSERT [dbo].[Reservations] ([ReservationId], [HomeId], [LocationId], [ReservationDate], [ServiceId]) VALUES (14, 15, 1, CAST(N'2020-11-30' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Reservations] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceId], [ServiceType], [Price], [Description]) VALUES (1, N'The Mr. Lebowski Clean', 199.9900, N'We just clean the rug. Seriously. Sometimes that''s all you need. ')
INSERT [dbo].[Services] ([ServiceId], [ServiceType], [Price], [Description]) VALUES (2, N'The Office Space Clean', 299.9900, N'We do the basic, bare minimum clean. You know, just enough to not get in trouble when you have house guests. ')
INSERT [dbo].[Services] ([ServiceId], [ServiceType], [Price], [Description]) VALUES (3, N'The Mr. Rogers Clean', 399.9900, N'A fairly deep cleaning. After this clean you can invite everyone in the neighborhood over for a beautiful evening.')
INSERT [dbo].[Services] ([ServiceId], [ServiceType], [Price], [Description]) VALUES (4, N'The Mary Poppins Clean', 499.9900, N'Practically Perfect in Every Way. This is the works. Singing and chimney sweep is available at extra charge.')
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
INSERT [dbo].[UserDetails] ([UserId], [CompanyName], [FirstName], [LastName], [UserPhoto]) VALUES (N'25ad51e0-fa72-4d57-a09d-ab7b315ad500', N'Walken Out', N'Christopher', N'Walken', N'31bc80b8-f1cd-4d9c-bc4a-6d2bee6ef68e.jpg')
INSERT [dbo].[UserDetails] ([UserId], [CompanyName], [FirstName], [LastName], [UserPhoto]) VALUES (N'2ae4d393-48bc-4959-8d72-9de0fb17b8b1', N'Maid in KC', N'Deborah', N'Reed', N'eefbedd8-24a3-4e2d-8153-06ff238b670f.jpg')
INSERT [dbo].[UserDetails] ([UserId], [CompanyName], [FirstName], [LastName], [UserPhoto]) VALUES (N'32e28007-0c10-46c6-b4ea-df63ec20de58', N'Gotta Have Faith', N'Faith', N'Reed', N'c48c9dce-aee7-4a20-b1fd-74f670802167.jpg')
INSERT [dbo].[UserDetails] ([UserId], [CompanyName], [FirstName], [LastName], [UserPhoto]) VALUES (N'4e9bd8f5-e875-4392-beae-6654b8740a86', N'Jeff Bananas', N'Jeff', N'DeMaranville', N'0c001219-8994-4b3c-957f-cc386d7ad812.png')
INSERT [dbo].[UserDetails] ([UserId], [CompanyName], [FirstName], [LastName], [UserPhoto]) VALUES (N'687ba335-1b56-4d69-9723-7c507028617f', N'Superman Inc', N'Christopher', N'Reeve', N'12f2aaf2-4af4-4346-9326-a6bbc6d314b7.jpg')
INSERT [dbo].[UserDetails] ([UserId], [CompanyName], [FirstName], [LastName], [UserPhoto]) VALUES (N'9fa8e4df-df88-4921-94b3-0a8e58567b06', N'Maid in KC', N'Elizabeth', N'Needham', N'32f2da36-7049-45a8-84a4-070e7887e0f7.jpg')
INSERT [dbo].[UserDetails] ([UserId], [CompanyName], [FirstName], [LastName], [UserPhoto]) VALUES (N'b0d283a1-c986-4490-ac49-a8ef5158567f', N'Dogue', N'Dee', N'Reed', N'd0cfd4f9-152f-4783-86a0-33ea89f313be.jpg')
INSERT [dbo].[UserDetails] ([UserId], [CompanyName], [FirstName], [LastName], [UserPhoto]) VALUES (N'bc1bfd95-0029-423c-b9d2-d8cc4ebdb0c3', N'Woodpecker Carpentry', N'Woody', N'Woodpecker', N'ec738563-e4f7-44e5-b620-e1c7ff6c16d8.jpg')
INSERT [dbo].[UserDetails] ([UserId], [CompanyName], [FirstName], [LastName], [UserPhoto]) VALUES (N'e781e3d7-3c3a-4327-b491-d1b3ffd2af49', NULL, N'Justin', N'Kennedy', N'2ed41e54-0b20-48f8-b4e6-0fa3bf7943b9.jpg')
INSERT [dbo].[UserDetails] ([UserId], [CompanyName], [FirstName], [LastName], [UserPhoto]) VALUES (N'e85d57f0-ff04-4e0c-9907-4d8dc349cf88', N'My Way Digital Media', N'Chad', N'Way', N'8af0eaa4-4ed3-429a-9ef4-bddba7bb3173.jpg')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/2/2020 9:03:38 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/2/2020 9:03:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/2/2020 9:03:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/2/2020 9:03:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/2/2020 9:03:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/2/2020 9:03:38 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Homes]  WITH CHECK ADD  CONSTRAINT [FK_Homes_UserDetails] FOREIGN KEY([OwnderId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[Homes] CHECK CONSTRAINT [FK_Homes_UserDetails]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Homes] FOREIGN KEY([HomeId])
REFERENCES [dbo].[Homes] ([HomeId])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Homes]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Locations]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Services] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([ServiceId])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Services]
GO
ALTER DATABASE [FinalProject] SET  READ_WRITE 
GO
