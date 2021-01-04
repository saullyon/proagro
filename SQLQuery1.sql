USE [master]
GO
/****** Object:  Database [proagro]  ******/
CREATE DATABASE [proagro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proagro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\proagro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proagro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\proagro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [proagro] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proagro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proagro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proagro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proagro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proagro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proagro] SET ARITHABORT OFF 
GO
ALTER DATABASE [proagro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proagro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proagro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proagro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proagro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proagro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proagro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proagro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proagro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proagro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [proagro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proagro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proagro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proagro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proagro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proagro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proagro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proagro] SET RECOVERY FULL 
GO
ALTER DATABASE [proagro] SET  MULTI_USER 
GO
ALTER DATABASE [proagro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proagro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proagro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proagro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proagro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [proagro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'proagro', N'ON'
GO
ALTER DATABASE [proagro] SET QUERY_STORE = OFF
GO
USE [proagro]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 04/01/2021 0:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[Abreviatura] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Georreferencias]    Script Date: 04/01/2021 0:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Georreferencias](
	[idGeorreferencia] [int] IDENTITY(1,1) NOT NULL,
	[idEstado] [int] NOT NULL,
	[Latitud] [float] NOT NULL,
	[Longitud] [float] NOT NULL,
 CONSTRAINT [PK_Georreferencias] PRIMARY KEY CLUSTERED 
(
	[idGeorreferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 04/01/2021 0:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[idPermiso] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[idPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 04/01/2021 0:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Contrasenia] [varchar](10) NOT NULL,
	[Nombre] [varchar](80) NOT NULL,
	[FechaN_C] [smalldatetime] NOT NULL,
	[RFC] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Estados] ON 
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (1, N'AGUASCALIENTES', N'AGS')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (2, N'BAJA CALIFORNIA', N'BCN')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (3, N'BAJA CALIFORNIA SUR', N'BCS')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (4, N'CAMPECHE', N'CAMP')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (5, N'COAHUILA', N'COAH')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (6, N'COLIMA', N'COL')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (7, N'CHIAPAS', N'CHIS')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (8, N'CHIHUAHUA', N'CHIH')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (9, N'DISTRITO FEDERAL', N'DF')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (10, N'DURANGO', N'DGO')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (11, N'GUANAJUATO', N'GTO')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (12, N'GUERRERO', N'GRO')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (13, N'HIDALGO', N'HGO')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (14, N'JALISCO', N'JAL')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (15, N'ESTADO DE MEXICO', N'MEX')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (16, N'MICHOACAN', N'MICH')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (17, N'MORELOS', N'MOR')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (18, N'NAYARIT', N'NAY')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (19, N'NUEVO LEON', N'NL')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (20, N'OAXACA', N'OAX')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (21, N'PUEBLA', N'PUE')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (22, N'QUERETARO', N'QRO')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (23, N'QUINTANA ROO', N'QRO')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (24, N'SAN LUIS POTOSI', N'SLP')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (25, N'SINALOA', N'SIN')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (26, N'SONORA', N'SON')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (27, N'TABASCO', N'TAB')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (28, N'TAMAULIPAS', N'TAMP')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (29, N'TLAXCALA', N'TLAX')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (30, N'VERACRUZ', N'VER')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (31, N'YUCATAN', N'YUC')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (32, N'ZACATECAS', N'ZAC')
GO
INSERT [dbo].[Estados] ([idEstado], [Estado], [Abreviatura]) VALUES (33, N'CIUDAD DE MEXICO', N'CDMX')
GO
SET IDENTITY_INSERT [dbo].[Estados] OFF
GO
SET IDENTITY_INSERT [dbo].[Georreferencias] ON 
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (1, 1, 21.13180225, -89.50884361)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (2, 1, 22.302625, 102.2263139)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (3, 1, 23.2336, 103.3168167)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (4, 1, 23.23353333, 103.3335528)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (5, 1, 22.07935, 102.0409833)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (6, 1, 22.39769444, 102.2899333)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (7, 1, 22.39863333, 102.2900556)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (8, 1, 21.98357222, 102.2667667)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (9, 1, 21.9836, 102.2502306)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (10, 1, 22.616775, 102.2335389)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (11, 5, 25.506789, -102.2433589)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (12, 5, 25.50705411, -102.2443927)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (13, 5, 26.30458298, -103.0647895)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (14, 5, 26.30687434, -103.0620606)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (15, 5, 26.30047677, -103.0553136)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (16, 5, 26.29786489, -103.0583045)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (17, 5, 26.30464132, -103.0648854)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (18, 5, 26.30694835, -103.0622138)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (19, 5, 26.31341072, -103.0691436)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (20, 5, 26.31077704, -103.0722422)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (21, 25, 24.20180556, 107.1031389)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (22, 25, 2.201583333, 107.1035556)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (23, 25, 24.22061111, 107.1337222)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (24, 25, 24.22238889, 107.1337222)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (25, 25, 24.10958333, 107.0839722)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (26, 25, 24.11113889, 107.08325)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (27, 25, 24.10941667, 107.0788889)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (28, 25, 24.10727778, 107.0763611)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (29, 25, 24.21880556, 107.1337778)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (30, 25, 24.22055556, 107.13375)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (31, 14, 20.62366667, 103.8016111)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (32, 14, 20.44083333, 103.9239167)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (33, 14, 20.48036111, 103.9556111)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (34, 14, 20.48425, 103.9726389)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (35, 14, 19.88372222, 103.372)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (36, 14, 19.62819444, 103.7716944)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (37, 14, 19.64733333, 103.7284444)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (38, 14, 19.65225, 103.7428056)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (39, 14, 19.65730556, 103.7916111)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (40, 14, 19.5935, 103.8120556)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (41, 28, 25.74877778, 97.57894444)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (42, 28, 25.30605556, 97.86688889)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (43, 28, 25.30605556, 97.86688889)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (44, 28, 24.61438889, 97.91577778)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (45, 28, 25.31441667, 97.79305556)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (46, 28, 24.61452778, 97.91575)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (47, 28, 25.29966667, 97.85988889)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (48, 28, 25.29966667, 97.85988889)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (49, 28, 25.74986111, 97.60216667)
GO
INSERT [dbo].[Georreferencias] ([idGeorreferencia], [idEstado], [Latitud], [Longitud]) VALUES (50, 28, 25.74986111, 97.60218611)
GO
SET IDENTITY_INSERT [dbo].[Georreferencias] OFF
GO
SET IDENTITY_INSERT [dbo].[Permisos] ON 
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (2, 2, 5)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (3, 3, 25)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (4, 4, 14)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (5, 5, 28)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (6, 6, 5)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (7, 7, 5)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (8, 8, 5)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (9, 9, 1)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (10, 10, 25)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (11, 11, 14)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (12, 12, 28)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (13, 13, 28)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (14, 14, 28)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (15, 15, 14)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (16, 16, 14)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (17, 17, 1)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (18, 18, 25)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (19, 19, 25)
GO
INSERT [dbo].[Permisos] ([idPermiso], [idUsuario], [idEstado]) VALUES (20, 20, 1)
GO
SET IDENTITY_INSERT [dbo].[Permisos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (1, N'abcde', N'PORCICULTORES EL HIBRIDO S DE RL', CAST(N'2005-01-11T00:00:00' AS SmallDateTime), N'PHI0501116U3')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (2, N'abcde', N'AGROPECUARIA EL GIGANTE S.A. DE C.V.', CAST(N'2000-01-14T00:00:00' AS SmallDateTime), N'AGI000114C70')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (3, N'abcde', N'PROVEEDORES AGROALIMENTARIOS DEL DISTRITO DE RIEGO 01 SPR DE RL', CAST(N'2004-05-28T00:00:00' AS SmallDateTime), N'PAD0405282B1')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (4, N'abcde', N'EL SILOGISMO SPR DE RL', CAST(N'1997-11-06T00:00:00' AS SmallDateTime), N'SIL971106652')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (5, N'abcde', N'PRODUCTORES UNIDOS DE LAGOS, S.C. DE R.L. DE C.V.', CAST(N'2005-07-11T00:00:00' AS SmallDateTime), N'PUL0507113N6')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (6, N'abcde', N'ALIMENTOS PROCESADOS EL ZARCO S DE R.L. M.I. DE C.V.', CAST(N'2006-02-01T00:00:00' AS SmallDateTime), N'APZ060201412')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (7, N'abcde', N'HSBC MEXICO S.A., INSTITUCION DE BANCA MULTIPLE GRUPO FINANCIERO HSBC', CAST(N'1995-01-25T00:00:00' AS SmallDateTime), N'HMI950125KG8')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (8, N'abcde', N'UNION GANADERA LAS TROJES', CAST(N'2005-11-14T00:00:00' AS SmallDateTime), N'UGD0511148J3')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (9, N'abcde', N'QUESOS LOS MARTINEZ, S. DE R.L. M.I. DE C.V.', CAST(N'2005-06-14T00:00:00' AS SmallDateTime), N'QMA050614F17')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (10, N'abcde', N'RANCHO MEDIO KILO, S. P.R. DE R.L.', CAST(N'1998-02-03T00:00:00' AS SmallDateTime), N'RMK9802033P7')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (11, N'abcde', N'MARTIN RUIZ BERNAL, S. DE P.R. DE R.L.', CAST(N'2002-02-20T00:00:00' AS SmallDateTime), N'MRB0112136W7')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (12, N'abcde', N'CHIVOS Y BORREGOS DE AGUASCALIENTES, S.P.R. DE R.L', CAST(N'2006-02-13T00:00:00' AS SmallDateTime), N'CBA051107TKA')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (13, N'abcde', N'GANADEROS UNIDOS DE TEQUILILLA', CAST(N'2002-12-09T00:00:00' AS SmallDateTime), N'GUT021209P8G')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (14, N'abcde', N'COMUNIDAD PRODUCTORA 2000, S.P.R.DE R.L.', CAST(N'1999-12-10T00:00:00' AS SmallDateTime), N'CPD9912105S7')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (15, N'abcde', N'INOVAGRO, S.A. DE C.V.', CAST(N'2003-06-16T00:00:00' AS SmallDateTime), N'INO030616JN5')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (16, N'abcde', N'GANADERIA LA GREÑUDA, S.C. DE R.L.', CAST(N'2006-06-24T00:00:00' AS SmallDateTime), N'GGR060624JV4')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (17, N'abcde', N'PRODUCTORES DE LA ESTANCIA DE CUQUIO, S.C.  DE  R.L.', CAST(N'2005-10-21T00:00:00' AS SmallDateTime), N'PEC051021HX7')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (18, N'abcde', N'GRANJA EL 13 DE LOS ACUÑA, S.P.R.  DE  R.L.', CAST(N'2004-03-27T00:00:00' AS SmallDateTime), N'GTA040327Q39')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (19, N'abcde', N'EL GREÑERO, S. DE R.L. DE C.V.', CAST(N'2002-05-08T00:00:00' AS SmallDateTime), N'GRE0205086JA')
GO
INSERT [dbo].[Usuario] ([idUsuario], [Contrasenia], [Nombre], [FechaN_C], [RFC]) VALUES (20, N'abcde', N'AGRASISA, S.A. DE C.V.', CAST(N'2001-11-09T00:00:00' AS SmallDateTime), N'AGR011109ST4')
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Georreferencias]  WITH CHECK ADD  CONSTRAINT [FK_Georreferencias_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Georreferencias] CHECK CONSTRAINT [FK_Georreferencias_Estados]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Estados]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Usuario]
GO
USE [master]
GO
ALTER DATABASE [proagro] SET  READ_WRITE 
GO
