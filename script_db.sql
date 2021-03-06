USE [UCOMUNIDAD]
GO
/****** Object:  Table [dbo].[carrera]    Script Date: 3/09/2018 8:48:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carrera](
	[car_id] [int] NOT NULL,
	[car_nombre] [varchar](100) NOT NULL,
	[car_uni_id] [int] NOT NULL,
 CONSTRAINT [PK_carrera] PRIMARY KEY CLUSTERED 
(
	[car_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[consultas]    Script Date: 3/09/2018 8:48:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consultas](
	[con_id] [int] NOT NULL,
	[con_asunto] [varchar](100) NOT NULL,
	[con_fechacrea] [datetime] NOT NULL,
	[con_fechaactu] [datetime] NOT NULL,
	[con_usu_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[con_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[respuesta]    Script Date: 3/09/2018 8:48:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[respuesta](
	[res_id] [int] NOT NULL,
	[res_usu_id] [int] NOT NULL,
	[res_con_id] [int] NOT NULL,
	[res_calificacion] [varchar](50) NOT NULL,
	[res_respuestaconsulta] [varchar](2000) NOT NULL,
	[res_fecha_respuesta] [datetime] NOT NULL,
	[res_fecha_califica] [datetime] NOT NULL,
	[res_estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_respuesta] PRIMARY KEY CLUSTERED 
(
	[res_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipousuario]    Script Date: 3/09/2018 8:48:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipousuario](
	[tip_id] [int] NOT NULL,
	[tip_nombre] [varchar](100) NOT NULL,
	[tip_status] [varchar](100) NOT NULL,
	[tip_descripcion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[tip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[universidad]    Script Date: 3/09/2018 8:48:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[universidad](
	[uni_id] [int] NOT NULL,
	[uni_nombre] [varchar](100) NOT NULL,
	[uni_telefono] [varchar](50) NOT NULL,
	[uni_direccion] [varchar](100) NOT NULL,
	[uni_pais] [int] NOT NULL,
 CONSTRAINT [PK_universidad] PRIMARY KEY CLUSTERED 
(
	[uni_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 3/09/2018 8:48:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[usu_id] [int] NOT NULL,
	[usu_nombre] [varchar](100) NOT NULL,
	[usu_tel] [varchar](50) NOT NULL,
	[usu_dir] [varchar](100) NOT NULL,
	[usu_mail] [varchar](100) NOT NULL,
	[usu_fechacrea] [datetime] NOT NULL,
	[usu_tip_id] [int] NULL,
	[usu_car_id] [int] NULL,
	[usu_nombreusuario] [varchar](50) NULL,
	[usu_clave] [varchar](50) NULL,
	[usu_intento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[usu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[carrera]  WITH CHECK ADD  CONSTRAINT [FK_carrera_universidad] FOREIGN KEY([car_uni_id])
REFERENCES [dbo].[universidad] ([uni_id])
GO
ALTER TABLE [dbo].[carrera] CHECK CONSTRAINT [FK_carrera_universidad]
GO
ALTER TABLE [dbo].[consultas]  WITH CHECK ADD  CONSTRAINT [FK_consultas_usuario] FOREIGN KEY([con_usu_id])
REFERENCES [dbo].[usuario] ([usu_id])
GO
ALTER TABLE [dbo].[consultas] CHECK CONSTRAINT [FK_consultas_usuario]
GO
ALTER TABLE [dbo].[respuesta]  WITH CHECK ADD  CONSTRAINT [FK_respuesta_consultas] FOREIGN KEY([res_con_id])
REFERENCES [dbo].[consultas] ([con_id])
GO
ALTER TABLE [dbo].[respuesta] CHECK CONSTRAINT [FK_respuesta_consultas]
GO
ALTER TABLE [dbo].[respuesta]  WITH CHECK ADD  CONSTRAINT [FK_respuesta_usuario] FOREIGN KEY([res_usu_id])
REFERENCES [dbo].[usuario] ([usu_id])
GO
ALTER TABLE [dbo].[respuesta] CHECK CONSTRAINT [FK_respuesta_usuario]
GO
ALTER TABLE [dbo].[universidad]  WITH CHECK ADD  CONSTRAINT [FK_universidad_universidad] FOREIGN KEY([uni_id])
REFERENCES [dbo].[universidad] ([uni_id])
GO
ALTER TABLE [dbo].[universidad] CHECK CONSTRAINT [FK_universidad_universidad]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_carrera] FOREIGN KEY([usu_car_id])
REFERENCES [dbo].[carrera] ([car_id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_carrera]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_tipousuario] FOREIGN KEY([usu_tip_id])
REFERENCES [dbo].[tipousuario] ([tip_id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_tipousuario]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'oro,plata,bronce' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'respuesta', @level2type=N'COLUMN',@level2name=N'res_calificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'activo,gestionado,cerrado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'respuesta', @level2type=N'COLUMN',@level2name=N'res_estado'
GO
